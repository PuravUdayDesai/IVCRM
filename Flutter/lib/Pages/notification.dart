//default
import 'package:flutter/material.dart';

//plugins
import 'package:http/http.dart' as http;


//custom
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
import '../User/current_user.dart';
import '../Models/Company/notification_model.dart';



class Notifications extends StatefulWidget{  

  @override
	_NotificationsState createState () => _NotificationsState();
}

class _NotificationsState extends State<Notifications>{
	List<Widget> notiLi = [];
  List<NotificationClass> notifications = [];
  OverlayEntry overlayEntry;

  bool getNewData = true;
    void closeOverlay(){
      //print(overlayEntry);
      overlayEntry.remove();
      setState((){
        getNewData = true;
      });
    }


  @override
  void initState(){
    overlayEntry = OverlayEntry(
      builder : (context){
        return Positioned(
          top : 165.0,
          right : 1.0,
          //child : Material(
            //shape : CircleBorder(),
            child : RawMaterialButton(
              onPressed : (){
                Navigator.of(context).pop();
                closeOverlay();
              },
              elevation : 2.0,
              fillColor : Colors.white,
              child : Icon(Icons.clear,color : Colors.black),
              shape : CircleBorder(),
            ),
          //),
        );
      }
    );
  }


  

  @override
  Widget build(BuildContext context){
    
     
    return Scaffold(
      appBar : AppBar(
        title : Text('Notifications'),
      ),
      body : FutureBuilder(
        future : getData(),
        builder : (c,s){
          if(s.data==null){
            return Center(
              child : CircularProgressIndicator(),
            );
          }
          else{
            if(s.data.length == 0){
              return Center(child : Text('No Data Exists.',textScaleFactor : 2.0));
            }
            return ListView.builder(
              itemCount : s.data.length,
              itemBuilder : (c,i){
                return makeCard(s.data[i]);
              }
            );
          }
        }
      ),
    );
  }

  Future<List<NotificationClass>> getData() async{
    // final response = await http.get('http://52.188.114.136:8080/notification/151');
    // print('----------http://52.188.114.136:8080/notification/151----------');
    // print(response.statusCode);
    // print(jsonDecode(response.body));
    // var res = jsonDecode(response.body);
    if(getNewData){
      getNewData = false;

      var json = await ApiCall.getDataFromApi(Uri.GET_NOTIFICATION+'/${CurrentUser.id}');
      if(notifications.length!=0){
        notifications.clear();
      }
      if(json == 'nothing'){
        return notifications;
      }
      for(int i=0;i<json.length;i++){
        int _companyExecutiveID = json[i]['companyExecutiveID'];
        String _companyExecutiveName = json[i]['companyExecutiveName'];
        int _notificationID = json[i]['notificationID'];
        String _notificationSubject = json[i]['notificationSubject'];
        String _notificationDescription = json[i]['notificationDescription'];
        String _notificationTime = json[i]['notificationTime'];
        String _notificationTimeString = json[i]['notificationTimeString'];
        bool _readIndex = json[i]['readIndex'];

        NotificationClass obj = NotificationClass(
          _companyExecutiveID,
          _companyExecutiveName,
          _notificationID,
          _notificationSubject,
          _notificationDescription,
          _notificationTime,
          _notificationTimeString,
          _readIndex
        );

        notifications.add(obj);
      }

      return notifications;
    }
    else{
      return notifications; 
    }



  }

  Widget makeCard(var obj){
    return ListTile(
      leading : Icon(Icons.notifications),
      title : Text(obj.notificationSubject),
      subtitle : Text(obj.notificationTime),
      isThreeLine : true,
      onTap : (){
        showMyDialog(context,obj);
        updateUnreadToRead(obj.notificationID);
      },
    );
  }

  void showMyDialog(con,obj){
    // if(super.notificationData !=null){
    //   obj = notificationData;
    // }
   
    OverlayState overlayState = Overlay.of(con);
    overlayState.insert(overlayEntry);
    Dialog dial = new Dialog(
      //barrierDismissible : false,
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.only(topLeft : Radius.circular(12.0))  ,
          borderRadius : BorderRadius.all(Radius.circular(16.0)),
      ),
      elevation: 5.0,

      child : Stack(
        children : <Widget>[
          Container(
            width : 350,
            height : 250,
            //padding : const EdgeInsets.all(10.0),
            child : Column(
              children : <Widget>[
                Container(
                  padding : const EdgeInsets.all(8.0),
                  //color : Theme.of(context).primaryColor,
                  //color : Colors.grey[200],
                  alignment : Alignment.center,
                  height : 40.0,
                  child : Text(
                    obj.notificationSubject,
                    textScaleFactor : 1.4,
                    overflow : TextOverflow.ellipsis,
                    style : TextStyle(
                      color : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Divider(),
                Flexible(
                  child : SingleChildScrollView(
                    child : Padding(
                      padding : const EdgeInsets.all(5.0),
                      child : Text(
                        obj.notificationDescription,
                        textScaleFactor : 1.25,
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  height : 30.0,
                  width : double.infinity,
                  padding : const EdgeInsets.only(bottom : 5.0),
                  //color : Theme.of(context).accentColor,
                  //color : Theme.of(context).primaryColor,
                  alignment : Alignment.center,
                  child : Text(
                    obj.notificationTime,
                    textScaleFactor : 1.3,
                    style : TextStyle(
                      color : Theme.of(context).accentColor,
                    ),
                  ),
                ),            
              ]
            ),
          ),
          
        ]
      ),

      
    );
    showDialog(
      context: con,
      barrierDismissible: false,
      builder: (_)=>dial,
    );
  }

  void updateUnreadToRead(int nid) async{
    String json = '{"readIndex": true,"justArrived": false}';  
    //String url = "http://08c25286d2b6.ngrok.io/notification/$nid";
    String url = Uri.GET_NOTIFICATION+'/$nid';
    Map<String, String> headers = {"Content-type": "application/json","Authorization" : CurrentUser.ACCESS_TOKEN};
    final response = await http.put(url, headers: headers, body: json);
    print("------------HEREEEEEs----------------");
    print(response.statusCode);
    CurrentUser.notificationCount = CurrentUser.notificationCount -1;
    
  }
}