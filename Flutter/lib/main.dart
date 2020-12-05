//default
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//plugin
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';



//custom
import 'Pages/login_screen.dart';
import 'Pages/home.dart';
import 'Pages/add_enquiry.dart';
import 'Pages/add_client.dart';
import 'Bloc/theme.dart';
import 'Utils/theme.dart';
import 'Pages/Admin/home_admin.dart';
import 'User/current_user.dart';
import 'User/user_details.dart';
import 'Utils/shared_prefs.dart';
import 'Api_Services/ApiCall.dart';
import 'Api_Services/Uri.dart';







//void main() => runApp(MyApp());

void main() => runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(lightTheme),
        child: MyApp(),
        // child : MaterialApp(
        //   debugShowCheckedModeBanner : false,
        //   home : MyApp2(),
        // ),
      ),
    );
Map<int, Color> color1 =
{
50:Color.fromRGBO(66,157,190, .1),
100:Color.fromRGBO(66,157,190, .2),
200:Color.fromRGBO(66,157,190, .3),
300:Color.fromRGBO(66,157,190, .4),
400:Color.fromRGBO(66,157,190, .5),
500:Color.fromRGBO(66,157,190, .6),
600:Color.fromRGBO(66,157,190, .7),
700:Color.fromRGBO(66,157,190, .8),
800:Color.fromRGBO(66,157,190, .9),
900:Color.fromRGBO(66,157,190, 1),
};

class MyApp2 extends StatelessWidget{
  TextEditingController ip = TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Only for testing..'),
      ),
      body : Center(
        child : Padding(
          padding : const EdgeInsets.all(20.0),
          child : TextFormField(
            controller : ip,
            decoration : InputDecoration(
              hintText : 'Enter Ip(without ngrok.io and http://) ex.x123456789 ',
              labelText : 'IP',
            ),
          ),
        ),
        
      ),
      floatingActionButton : FloatingActionButton(
        onPressed : (){
          Uri.endPoint = ip.text;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder : (context) => MyApp()
            )
          );
        },
        child : Icon(Icons.forward),
      ),
    );
  }
}

//Pub installs executables into D:\Setup\flutter_windows_v1.12.13+hotfix.5-stable\flutter\.pub-cache\bin, which is not on your path.


class MyApp extends StatelessWidget{
    List<String> _ownerId;
    List<String> executive;
    SharedPref sharedPref = SharedPref();
    Future<int> loadSharedPrefs() async{
        try{          
          print('1');
          await sharedPref.remove('owner');
          await sharedPref.remove('executive');
          _ownerId = await sharedPref.read('owner');                    
          if(_ownerId==null){
            executive = await sharedPref.read('executive');
            if(executive == null){
              Future.delayed(Duration(seconds : 5),(){
                print('now');
                });
              return 1;
            }
            var r = await ApiCall.getDataFromApiUsingToken(Uri.GET_COMPANY_EXECUTIVE+'/${executive[0]}',executive[1]);

            CurrentUser.ownerId=int.parse(executive[2]);
            CurrentUser.companyId = int.parse(executive[3]);
            CurrentUser.loginId = r['loginID'];
            //print(CurrentUser.loginId);
            CurrentUser.ACCESS_TOKEN = executive[1];
            CurrentUser.id = int.parse(r['executiveId']);
            CurrentUser.name = r['executiveName'];
            CurrentUser.username = r['loginID'];
            CurrentUser.companyName = r['companyName'];
            CurrentUser.phone = r['contactNumber'];
            CurrentUser.city = r['cityName'];
            CurrentUser.branchName = r['companyBranchName'];
            CurrentUser.notificationCount = int.parse(executive[4]);
            CurrentUser.notificationCount = CurrentUser.notificationCount + int.parse(executive[5]);
            CurrentUser.immediateTicketCount = int.parse(executive[6]);
            CurrentUser.highTicketCount = int.parse(executive[7]);
            CurrentUser.normalTicketCount = int.parse(executive[8]);
            CurrentUser.lowTicketCount = int.parse(executive[9]);
            CurrentUser.isOwner = false;
            return 3;
              } else{
                print('_ownerId = $_ownerId');
                var r = await ApiCall.getDataFromApiUsingToken(Uri.GET_OWNER+"/${_ownerId[0]}",_ownerId[1]);
                print(r);
                print('3');
                CurrentUser.id = r['id'];
                print('4');
                CurrentUser.ACCESS_TOKEN = _ownerId[1];
                print('here access token = ${CurrentUser.ACCESS_TOKEN}');
                CurrentUser.ownerName = r['ownerName'];
                CurrentUser.ownerPhone = r['ownerContact'];
                CurrentUser.ownerEmail = r['ownerEmail'];
                CurrentUser.ownerUsername = r['userName'];
                CurrentUser.createdOn = r['createdOn'];
                CurrentUser.lastEditOn = r['lastEditOn'];
                CurrentUser.ownerId = r['id'];
                CurrentUser.isOwner = true;      
                return 2;
              }
          
          return 1;
        }catch(Exception){
          print(Exception.toString());
        }
      }

    
 
  @override
  Widget build(BuildContext context){
    MaterialColor customColor = MaterialColor(0xff429dbe, color1);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
      return MaterialApp(
        title : 'IVCRM',
        theme : themeNotifier.getTheme(),
        home : FutureBuilder(
          future : loadSharedPrefs(),
          builder : (c,s){
            if(s.data == null){
              return Splashscreen();
            }
            else{
              if(s.data == 1){
                return LoginScreen();
              }
              else if(s.data == 2){
                return AdminHome();
              }
              else{
                return Home();
              }
            }
          }
        ),
        debugShowCheckedModeBanner : false,
        onGenerateRoute : (s){
        	switch(s.name){
        		case '/home' : 
        		return PageTransition(child : Home(),type : PageTransitionType.upToDown,duration : Duration(seconds : 2));
        		break;
                case '/add_enquiry' : 
                return PageTransition(child : AddEnquiry(),type : PageTransitionType.upToDown,duration : Duration(seconds : 2));
                break;
                case '/add_client' : 
                return PageTransition(child : AddClient(),type : PageTransitionType.upToDown,duration : Duration(seconds : 2));
                break;
                case '/admin_home' : 
                return PageTransition(child : AdminHome(),type : PageTransitionType.upToDown,duration : Duration(seconds : 2));
                break;
        		default :
        		return null;
        	}
        },
      );
  }
}

class Splashscreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body : Container(
        height : MediaQuery.of(context).size.height,
        width : MediaQuery.of(context).size.width,
        color : Colors.white,
        child : Column(
          mainAxisAlignment : MainAxisAlignment.spaceAround,
          children : <Widget>[
            Image.asset(
              'Assets/Images/CRM1.jpg',
              fit : BoxFit.fitWidth,
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.center,
              children : <Widget>[
                Text(
                  'Loading...',
                  textScaleFactor : 2.0,
                  style : TextStyle(
                    color : Colors.black,
                    fontWeight : FontWeight.bold,
                  ),
                ),
                SizedBox(width : 20.0),
                CircularProgressIndicator(),
              ]
            ),

          ]
        ),
      ),
    );
  }
}

