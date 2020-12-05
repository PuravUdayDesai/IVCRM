//default
import "package:flutter/material.dart";

//plugin

//custom

//import 'sidebar_layout.dart';
import 'payment_card.dart';
import '../User/current_user.dart';
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
import 'home.dart';
import '../Utils/shared_prefs.dart';
import '../User/user_details.dart';



class LoginScreen extends StatefulWidget
{
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
	bool password;
	Widget icon;
	TextEditingController userController = new TextEditingController();
	TextEditingController passwordController = new TextEditingController();
  TextEditingController secretKeyController = new TextEditingController();
  bool skvisible = false;
  bool _autoValidate = false;
  bool isLoading = false;
  GlobalKey<FormState> fbKey;
  SharedPref sharedPref = SharedPref();
  Widget myWidget = Container();

 

	void showError()
	{
		showDialog(
		    context: context,
		    builder: (BuildContext context){
		        return AlertDialog(
		          title: Text(
		          	"ERROR",
		          	style : TextStyle(
		          		color : Colors.red,
		          		)
		          	),
		          content: Text("No user exists..."),
		          actions : <Widget>[
		          	FlatButton(
		          		child : Text(
		          			"Ok",
		          			
		          			style : TextStyle(
		          					fontSize : 15.0,
		          				)
		          			),
				        onPressed: () {
                  setState((){isLoading=false;});
				      Navigator.of(context).pop();
				    },
		          	)
		          ],
		        );
		    }
		  );
	}

	void checkCredentials() async
	{
    FocusScope.of(context).unfocus();
    setState((){isLoading = true;});
		String usernametxt,passwordtxt,secretKeytxt;
        usernametxt = userController.text;
        passwordtxt = passwordController.text;
        if(skvisible){
          secretKeytxt = secretKeyController.text;
          var map = new Map<String,dynamic>();
          map['userName'] = usernametxt;
          map['password'] = passwordtxt;
          map['secretKey'] = secretKeytxt;

          var response = await ApiCall.createRecord(Uri.GET_OWNER+"/login",map,authorization : false);
          print(response);
                    
          if(response!="nothing"){
            CurrentUser.ACCESS_TOKEN = 'IVClient '+ response['accessToken'];
            print(CurrentUser.ACCESS_TOKEN);
            var r = await ApiCall.getDataFromApi(Uri.GET_OWNER+"/${response['ownerId']}");
            print(r);
            OwnerModel owner=  new OwnerModel.fromJson(r);
            CurrentUser.id = r['id'];
            List<String> ownerDetail = [r['id'].toString(),CurrentUser.ACCESS_TOKEN];
            CurrentUser.ownerName = r['ownerName'];
            CurrentUser.ownerPhone = r['ownerContact'];
            CurrentUser.ownerEmail = r['ownerEmail'];
            CurrentUser.ownerUsername = r['userName'];
            CurrentUser.createdOn = r['createdOn'];
            CurrentUser.lastEditOn = r['lastEditOn'];
            CurrentUser.ownerId = r['id'];
            CurrentUser.isOwner = true;
            sharedPref.save('owner', ownerDetail);
            setState((){isLoading = false;});
            Navigator.pushReplacementNamed(context,'/admin_home');
          }
          else 
          {
              showError();
          }

        }
        else{
          var map = new Map<String,dynamic>();
          map['loginId'] = usernametxt;
          map['password'] = passwordtxt;
          var re = await ApiCall.createRecord(Uri.GET_COMPANY_EXECUTIVE+'/login',map,authorization : false);
          print('response is $re');
          
          if(re!='nothing'){
            //print(re);
            CurrentUser.ACCESS_TOKEN = 'IVClient '+ re['accessToken'];
            var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_EXECUTIVE+'/${re['companyExecutivId']}');
            SharedPref sharedPref = SharedPref();
            CurrentUser.ownerId=re['ownerId'];
            CurrentUser.companyId = re['companyId'];
            CurrentUser.loginId = r['loginID'];
            //print(CurrentUser.loginId);
            CurrentUser.id = int.parse(r['executiveId']);
            CurrentUser.name = r['executiveName'];
            CurrentUser.username = r['loginID'];
            CurrentUser.companyName = r['companyName'];
            CurrentUser.phone = r['contactNumber'];
            CurrentUser.city = r['cityName'];
            CurrentUser.branchName = r['companyBranchName'];
            CurrentUser.notificationCount = re['notificationCountToBeRead'];
            CurrentUser.notificationCount = CurrentUser.notificationCount +re['notificationCountForNew'];
            CurrentUser.immediateTicketCount = re['immediateStatusTicketCount'];
            CurrentUser.highTicketCount = re['highStatusTicketCount'];
            CurrentUser.normalTicketCount = re['normalStatusTicketCount'];
            CurrentUser.lowTicketCount = re['lowStatusTicketCount'];
            CurrentUser.isOwner = false;
            print('done');
            List<String> executiveDetails = [re['companyExecutivId'].toString(),CurrentUser.ACCESS_TOKEN,re['ownerId'].toString(),
              re['companyId'].toString(),
              re['notificationCountToBeRead'].toString(),re['notificationCountForNew'].toString(),
              re['immediateStatusTicketCount'].toString(),re['highStatusTicketCount'].toString(),
              re['normalStatusTicketCount'].toString(),re['lowStatusTicketCount'].toString()
            ];
            sharedPref.save('executive',executiveDetails);
            setState((){isLoading = false;});
            Navigator.pushReplacementNamed(context,'/home');
            //EnterExitRoute(exitPage: widget, enterPage: Home()));
          }
          else{
            setState((){isLoading = false;});
            print('here');
            showError();
          }
          
        //   Navigator.of(context).push(_createRoute());
        }     
	}

	// Route _createRoute() 
	// {
	//   	return PageRouteBuilder(
	//   		transitionDuration: Duration(milliseconds: 800),
	//     pageBuilder: (context, animation, secondaryAnimation) => SidebarLayout(),
	//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
	//     var begin = Offset(1.0, 0.0);
	//     var end = Offset.zero;
	//     var curve = Curves.easeOut;

 //      	var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

 //      	return SlideTransition(
 //        position: animation.drive(tween),
 //        child: child,
 //      	);
 //    	},
 //  		);
	// }

	@override
	void initState()
	{
		password = true;
    fbKey = new GlobalKey<FormState>();
		icon = Icon(Icons.visibility_off,color : Color(0xff429dbe));
	}

  @override
  void dispose(){
    super.dispose();
    userController.dispose();
    passwordController.dispose(); 
    secretKeyController.dispose();
  }

	@override
	Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor : Colors.white,
    body : IgnorePointer(
    ignoring : isLoading, 
    child : Stack(
      children: <Widget>[
        Container(
          margin : EdgeInsets.only(top: 70), 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/Images/CRM1.jpg'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child : Form(
            key : fbKey,
            autovalidate : _autoValidate,
            child : ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top : 0),
                  child: Container(
                    color: Color(0xfff5f5f5),
                    child: TextFormField(
                    	controller : userController,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText : 'Username',
                        hintText : "Enter Username",
                        prefixIcon: Icon(Icons.person_outline),
                        labelStyle: TextStyle(
                          fontSize: 20,
                        )
                      ),
                      validator : (v) => v.isEmpty ? 'Username is required .' : null,
                    ),
                  ),
                ),
                Container(
                	padding : EdgeInsets.only(top : 20),
                  color: Color(0xfff5f5f5),
                  child: TextFormField(
                  	controller : passwordController,
                    obscureText: password,
                    style: TextStyle(
                      color: Colors.black,
                      //fontFamily: 'SFUIDisplay'
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText : "Enter password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon : GestureDetector(
                      	onTap : (){
                      		setState((){
              								//print("Here 3"+" "+password.toString());
              								password = !password;
              								if(password){
              									icon = Icon(Icons.visibility_off,color:Theme.of(context).primaryColor);
              								}
              								else
              								{
              									icon = Icon(Icons.visibility,color: Theme.of(context).primaryColor);	
              								}
              							}
              							);
                      		},
                      	child : icon,
                      ),
                      
                      labelStyle: TextStyle(
                          fontSize: 20,
                        ),

                    ),
                    validator : (v) => v.isEmpty ? 'Password is required .' : null,
                  ),
                ),
                AnimatedSwitcher(
                duration : Duration(milliseconds : 1000),
                child : myWidget,
                ) ,
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: (){
                      if(fbKey.currentState.validate()){
                        checkCredentials();
                      }
                      else{
                        setState((){_autoValidate = true ; });
                      }
                    },
                    child: Text('SIGN IN',
                    style: TextStyle(
                      fontSize: 20,
                      //fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    color: Theme.of(context).primaryColor,
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  height : 70,
                  width : 400,
                  child: OutlineButton(
                    borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                    onPressed: (){
                      setState((){
                        skvisible = ! skvisible;
                        //_autoValidate = false;
                        if(skvisible){
                          myWidget = Padding(
                              padding: EdgeInsets.only(top : 20),
                              child: Container(
                                color: Color(0xfff5f5f5),
                                child: TextFormField(
                                  controller : secretKeyController,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText : 'Secret Key',
                                    hintText : "Enter Secret key sent you to mail",
                                    prefixIcon: Icon(Icons.vpn_key),
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                    )
                                  ),
                                  validator : (v) => v.isEmpty ? 'Secret key is required .' : null,
                                ),
                              ),
                            );
                        }
                        else
                        {
                          myWidget = Container() ;
                        }
                        
                        });
                      },
                    child: Text(
                      skvisible ? 'LOG IN AS USER' : 'LOG IN AS OWNER',
                    style: TextStyle(
                      fontSize: 20,
                      //fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    color: Colors.white,
                    //elevation: 0,
                    //minWidth: 400,
                    //height: 50,
                    textColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Material(
                child : Padding(
                padding : const EdgeInsets.only(top : 20.0,left : 70.0),
                child : InkWell(
                  splashColor : Colors.grey,
                  onTap : (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreditCardPage()),
                  ).then((value){
                    if(value){
                      return showDialog(
                        barrierDismissible : false,
                        context : context,
                        builder : (c){
                          return AlertDialog(
                            title : Text('Owner Added',style : TextStyle(color : Theme.of(context).primaryColor)),
                            content : Text('Congratulations.You have successfully registered as a new Owner.\nNow Sign In as a owner(Secret key is been sent to you by Email).'
                            ),
                            actions : [
                              FlatButton(
                                child : Text('OK'),
                                onPressed : (){
                                  Navigator.of(c).pop();
                                },
                              ),
                            ]
                          );
                        }
                      );
                    }
                  });
                    },
                    child : Text(
                      "BECOME A NEW OWNER",
                      textDirection : TextDirection.rtl,
                      style : TextStyle(
                        color : Theme.of(context).primaryColor,
                        fontWeight : FontWeight.bold,
                        fontSize : 17.0,
                      ),
                      ),
                ))),
                Material(
                child : Padding(
                padding : const EdgeInsets.only(top : 20.0,left : 130.0),
                child : InkWell(
                  splashColor : Colors.grey,
                  onTap : (){
                    print("hi");
                    },
                    child : Text(
                      "Forgot Password ?",
                      textDirection : TextDirection.rtl,
                      style : TextStyle(
                        color : Theme.of(context).primaryColor,
                        fontWeight : FontWeight.bold,
                      ),
                      ),
                ))),
                /*Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              //fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontSize: 15,
                            )
                          ),
                          TextSpan(
                            text: "sign up",
                            style: TextStyle(
                              //fontFamily: 'SFUIDisplay',
                              color: Color(0xffff2d55),
                              fontSize: 15,
                            )
                          )
                        ]
                      ),
                    ),
                  ),
                )*/
              ],
            )
            ),
          ),
        ),
        isLoading ? Center(
          child : CircularProgressIndicator(),
        ) : Center(
          child : Text('')
        ),
      ],
    )));
  }
}
//289965337
//select * from owner."OwnerContact";

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
                children: <Widget>[
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(-1.0, 0.0),
                    ).animate(animation),
                    child: exitPage,
                  ),
                  SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: enterPage,
                  )
                ],
              ),
        );
}