//default
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'dart:math';

//plgins
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission/permission.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:phone_state_i/phone_state_i.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter_sound/android_encoder.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';



//custom
import 'home_page.dart';
import 'enquiry.dart';
import 'client.dart';
import 'ticket.dart';
import 'my_account.dart';
import '../User/current_user.dart';
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
import '../Utils/company_util.dart';
import '../Bloc/bottom_navigation.dart';
import 'notification.dart';




class Home extends StatefulWidget{
	HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Timer timer;
  Position _currentPosition;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  bool _isRecording = false;
  String data="Recording : false";
  List <String> _path = [null, null, null, null, null, null, null];
  StreamSubscription _dbPeakSubscription;
  StreamSubscription _recorderSubscription;
  StreamSubscription _callStreamSubscription;
  FlutterSound flutterSound;
  t_CODEC _codecEnc = t_CODEC.CODEC_AAC;
  bool timeOneDone = false;
  String filePath = "";

	List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Enquiry(),
    Client(),
    Ticket(),
    MyAccount()
  ];

  




  @override
  initState(){
    super.initState();

    getPermissions();
    _callStreamSubscription = phoneStateCallEvent.listen((PhoneStateCallEvent event) {
      print('Call is Incoming or Connected: ' + event.stateC);  
      if(event.stateC=="true"){        
        onStartRecorderPressed(true);
      }
      else if(event.stateC=="false"){        
        onStartRecorderPressed(false);        
      }
    });
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();

    timer = Timer.periodic(Duration(seconds: 300), (Timer t) => getData());

    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: onSelectNotification);
  }  

  Future<void> getPermissions() async {
    final permissions =
        await Permission.getPermissionsStatus([PermissionName.Storage,PermissionName.Microphone]);
    var request = true;
    switch (permissions[0].permissionStatus) {
      case PermissionStatus.allow:
        request = false;
        break;
      case PermissionStatus.always:
        request = false;
        break;
      default:
    }
    switch (permissions[1].permissionStatus) {
      case PermissionStatus.allow:
        request = false;
        break;
      case PermissionStatus.always:
        request = false;
        break;
      default:
    }
    if (request) {
      await Permission.requestPermissions([PermissionName.Storage,PermissionName.Microphone]);
    }
  }
/*
1. voice_com
2. default
3. package update
*/

  void startRecorder() async{
    print('inn');
    print('Using : ${AndroidAudioSource.DEFAULT}');
    try {
      Directory tempDir = await getExternalStorageDirectory();      
      var rng = new Random();  
      int val=rng.nextInt(100000);         
      print(_codecEnc);
      filePath = "${tempDir.path}/${val}sound.aac";
      String path = await flutterSound.startRecorder(
        uri: filePath, 
        codec: _codecEnc,        
        androidAudioSource: AndroidAudioSource.DEFAULT,               
      );
      print('startRecorder: $path');

      _dbPeakSubscription =
          flutterSound.onRecorderDbPeakChanged.listen((value) {
            //print("got update -> $value");
          });
      _isRecording = true;
      setState(() {        
        _path[_codecEnc.index] = path;
        data="Recording : $_isRecording";
      });
    } catch (abc,err) {
      print("Error:"+abc.toString());
      print("Stacktrace:"+err.toString());      
      _isRecording = false;
      setState (()
      {                  
        data="Recording : $_isRecording";
      });
    }
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print ('stopRecorder: $result');

      if ( _recorderSubscription != null ) {
        _recorderSubscription.cancel ();
        _recorderSubscription = null;
      }
      if ( _dbPeakSubscription != null ) {
        _dbPeakSubscription.cancel ();
        _dbPeakSubscription = null;
      }
    } catch ( err ) {
      print ('stopRecorder error: $err');
    }
    _isRecording = false;
    setState(() {
      data="Recording : $_isRecording";
    });
    await getCallLog(); 
  }

  onStartRecorderPressed(bool callState) async{
    if(callState){     
      if(flutterSound.audioState == t_AUDIO_STATE.IS_STOPPED){
        startRecorder();   
      }          
    }
    else{
      if (flutterSound.audioState == t_AUDIO_STATE.IS_RECORDING){  
        print("Stop recorder");
        stopRecorder();
      }
    }    
  }

  void getCallLog() async{
    int i;
    CallLog.get().then((Iterable<CallLogEntry> log) async{
      
      print(log.elementAt(0).number);
      if(filePath == ""){
        print("Nothing to do");
      } else{
        print(filePath);
        print(log.elementAt(0).callType);
        String phone = log.elementAt(0).number.toString();
        if(phone.startsWith('+91')){
          phone = phone.substring(3,phone.length);  
        }
        
        print(phone);
        var r = await ApiCall.getDataFromApi(Uri.GET_CLIENT+'/checkForClientContact/${CurrentUser.id}?contactNumber=${phone}');    
        if(r['check']){
          print("Keep the file");
          Directory tempPath = await getExternalStorageDirectory();
          String pathForJsonFile = "${tempPath.path}/callInfo.json";
          final file = File(pathForJsonFile);
          String dt = DateTime.now().subtract(Duration(seconds: log.elementAt(0).duration)).toString();
          int ct=0;
          if(log.elementAt(0).callType==CallType.incoming)
            ct=1;
          else if(log.elementAt(0).callType==CallType.outgoing)
            ct=2;
          else
            ct=3;
          file.writeAsString('{"clientId":${r["clientId"]},"companyExecutiveId":${CurrentUser.id},"clientNameOnCompanyExecutiveList":"${r["contactName"]}","clientContactNumber":"${log.elementAt(0).number}","callType":${ct},"talkDuration":${log.elementAt(0).duration},"callTime":"${dt}"}');
          print("callInfo.json file created");
          print(log.elementAt(0).duration);


          // Map<String, MultipartFile> fileMap = {};
          // Map<String,File> files = Map<String,File>();
          // Map<String,dynamic> data = Map<String,dynamic>();

          print('filePath = $filePath');
          print('path for json file = $pathForJsonFile');

          // files['file'] = File(filePath);
          // files['data'] = File(pathForJsonFile);

          // for (MapEntry fileEntry in files.entries) {
          //   File file = fileEntry.value;
          //   //print('file = ${file.toString()}');
          //   String fileName = file.path.split('/').last;
          //   print('fileEntry.key = ${fileEntry.key.toString()}');
          //   fileMap[fileEntry.key] =
          //   MultipartFile(file.openRead(), await file.length(), filename: fileName);
          // }
          // data.addAll(fileMap);
          // //print('data = $data');
          // var formData = FormData.fromMap(data);
          // Dio dio = new Dio();
          //   var r1 = await dio.post(
          //     Uri.GET_CALL_TRANSACTION,
          //     data: formData, options: Options(contentType: 'multipart/form-data')
          //   );
          //   print(r1.statusCode);

          var uri = CompanyUtil.convertToUri(Uri.GET_CALL_TRANSACTION);
          var request = http.MultipartRequest('POST', uri);
            // ..files.add(
            //   await http.MultipartFile.fromPath(
            //     'file', filePath
            //   )
            // );
            // ..files.add(
            //   await http.MultipartFile.fromPath(
            //     'data', pathForJsonFile
            //   )
            // );
          request.files.add(
            await http.MultipartFile.fromPath(
              'file',filePath,
              filename : filePath.split('/').last,
              contentType : MediaType('audio','aac')
            )
          );
          request.files.add(
            await http.MultipartFile.fromPath(
              'data',pathForJsonFile,
              filename : pathForJsonFile.split('/').last,
              contentType : MediaType('application','json')
            )
          );
          print('request = ${request.toString()}');
          var response = await request.send();
          print(response.statusCode);
          //if (response.statusCode == 200) print('Uploaded!');
        } else{
          print("Lets delete the file");
          File fi = File(filePath);
          if(fi.existsSync()){
            fi.deleteSync();
            print("File deleted");
          }
          else{
            print("File doesn't exist");
          }
        }              
      }      
    });
  }


  Future onSelectNotification(String payload) async {
    //Can use payload if want!!
    print("Sending to other screen");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Notifications(),
      ),
    );
  }

  Future _showNotificationWithDefaultSound(var res) async {
    print("In show notification");
    for(int i=0;i<res.length;i++){
      // var scheduledNotificationDateTime =
      //   DateTime.now().add(Duration(seconds: (i*5)));      
      if(res[i]['justArrived'] == true){
        var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
          res[i]['notificationID'].toString(), res[i]['notificationSubject'],
          res[i]['notificationDescription'],
          importance: Importance.Max, priority: Priority.High);
        var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
        var platformChannelSpecifics = new NotificationDetails(
            androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          res[i]['notificationID'],
          res[i]['notificationSubject'],
          res[i]['notificationDescription'],        
          platformChannelSpecifics
        );  
        var map = Map<String,dynamic>();
        map['justArrived'] = false;
        map['readIndex'] = false; 
        var r1 = await ApiCall.updateRecord(Uri.GET_NOTIFICATION+'/${res[i]['notificationID']}',map);
        print('r1 is $r1');
      }
    }      
  }

  void getData() async{

    var r = await ApiCall.getDataFromApi(Uri.GET_NOTIFICATION+'/${CurrentUser.id}');
    print("---------------------NOTI_DATA---------------");
    print(r);
    print("----------------------------------------------");
    //byeee

    _showNotificationWithDefaultSound(r);

    var currentLocation = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentLocation.latitude, currentLocation.longitude);

      Placemark place = p[0];

      var map = Map<String,dynamic>();
      map['companyExecutiveId'] = CurrentUser.id;
      map['companyId'] = CurrentUser.companyId;
      map['entryDateAndTime'] = DateTime.now().toString().substring(0,19);
      map['latitude'] = currentLocation.latitude.toString();
      map['longitude'] = currentLocation.longitude.toString();
      map['countryName'] = place.country;
      map['stateName'] = place.administrativeArea;
      map['cityName'] = place.subAdministrativeArea;
      map['areaName'] = place.subLocality;
      map['addressLine1'] = place.name;
      map['addressLine2'] = '';
      map['addressLine3'] = '';
      map['pincode'] = place.postalCode;

      var r2 = await ApiCall.createRecord(Uri.GET_GEO,map);
  }



   
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationNotifier>(
      create : (_) => BottomNavigationNotifier(0),
      child : Scaffold(
        body : SafeArea(
          child : Consumer<BottomNavigationNotifier>(
            builder : (context,data,child){
              return Center(
                child : data.getData()['index'] == 3 && data.getData()['name'] != null ? Ticket(ticketName : data.getData()['name']) : _widgetOptions.elementAt(data.getData()['index']),
              );
            }
          ),
        ),
        bottomNavigationBar : Consumer<BottomNavigationNotifier>(
          builder : (context,data,child){
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.create),
                  title: Text('Enquiry'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contacts),
                  title: Text('Clients'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_ind),
                  title: Text('Ticket'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert),
                  title: Text('Settings'),
                ),
              ],
              currentIndex: data.getData()['index'],
              type : BottomNavigationBarType.shifting,
              onTap: (i){
                setState((){
                  data.setData(i);
                });
              },
              selectedItemColor : Theme.of(context).accentColor,
              unselectedItemColor : Colors.grey[600],
              showUnselectedLabels : true,
            );
          }
        ),
      ),
    );
  }
}

