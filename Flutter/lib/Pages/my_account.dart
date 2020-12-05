//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../User/current_user.dart';
import '../Bloc/theme.dart';
import '../Utils/theme.dart';
import '../Widgets/custom_drawer.dart';
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
import 'login_screen.dart';
import '../Utils/shared_prefs.dart';


//name,loginid,password,phone 

class MyAccount extends StatefulWidget{
	final bool isOwner;
	MyAccount({this.isOwner = false});
	@override
	MyAccountState createState () => MyAccountState();
}

class MyAccountState extends State<MyAccount>{

	bool isLoading = false;
	bool enabled = false;
	bool autoValidate = false;

	TextEditingController name ;
	TextEditingController email ;
	TextEditingController password ;
	TextEditingController phone ;

	Widget button = Container();
	GlobalKey<FormState> fbKey = GlobalKey<FormState>();

	updateData()async{
		setState((){
			FocusManager.instance.primaryFocus.unfocus();

			isLoading = true;
		});
		if(widget.isOwner){

			var map = Map<String,dynamic>();
			map['ownerName'] = name.text;
			map['ownerContact'] = phone.text;
			map['ownerEmail'] = email.text;
			map['isActive'] = true;
			map['lastEditOn'] = DateTime.now().toString().substring(0,19);

			var c = await ApiCall.updateRecord(Uri.GET_OWNER+'/${CurrentUser.id}',map);

			CurrentUser.ownerName = name.text;
			CurrentUser.ownerPhone = phone.text;
			CurrentUser.ownerEmail = email.text;

		}
		else{
			var map = Map<String,dynamic>();
			map['executiveName'] = name.text;
			map['contactNumber'] = phone.text;
			map['lastEditBy'] = CurrentUser.id;
			map["lastEditDeviceType"] = 4;
			map['lastEditOn'] = DateTime.now().toString().substring(0,19);

			var c = await ApiCall.updateRecord(Uri.GET_COMPANY_EXECUTIVE+'/${CurrentUser.id}',map);

			CurrentUser.name = name.text;
			CurrentUser.phone = phone.text;
		}

		setState((){
			enabled = ! enabled;
			isLoading = false;
			button = Container();
		});
	}

	@override
	void initState(){
		name = TextEditingController();
		email = TextEditingController();
		password = TextEditingController();
		phone = TextEditingController();
		if(widget.isOwner){
			name.text = CurrentUser.ownerName;
			email.text = CurrentUser.ownerEmail;
			phone.text = CurrentUser.ownerPhone;
		}
		else{
			name.text = CurrentUser.name;
			email.text = CurrentUser.loginId;
			phone.text = CurrentUser.phone;	
		}
		
	}

	

	@override
	Widget build(BuildContext context){
		var topPad = MediaQuery.of(context).size.height * 0.09;
    	var leftpad = MediaQuery.of(context).size.width * 0.35;
		return IgnorePointer(
			ignoring : isLoading,
			child : Scaffold(
				drawer : widget.isOwner ? CustomDrawer(settingsSelected : true) : null,
				//appBar : widget.isOwner ? AppBar(title : Text('My Account')) : null,
				body : ListView(
					children : <Widget>[
						Stack(
							children : <Widget>[
								Consumer<ThemeNotifier>(
								builder : (context,data,child){
									return GestureDetector(
								onTap : (){
									//var themeNotifier = Provider.of<ThemeNotifier>(context,listen : true);
									var theme = data.getTheme();
									//var newTheme = theme.brightness == Brightness.dark ? themeNotifier.setTheme(lightTheme) : themeNotifier.setTheme(darkTheme);
									if(theme.brightness == Brightness.dark){
										data.setTheme(lightTheme);
									}
									else{
										data.setTheme(darkTheme);
									}

								},
								child : Padding(
									padding : EdgeInsets.only(top : topPad , left : leftpad),
									child : CircleAvatar(
										//backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.white : null,
										child : ClipOval(
										child : Text(
												//CurrentUser.ownerName.substring(0,1).toUpperCase(),
												CurrentUser.isOwner ? CurrentUser.ownerName.substring(0,1).toUpperCase() : CurrentUser.name.substring(0,1).toUpperCase(),
												style : TextStyle(
													fontSize : 40.0,
												),
											),
										),
										radius : 60.0,
									),
								)
								);
								}
								),
								
								Container(
									margin : EdgeInsets.only(top : MediaQuery.of(context).size.height * 0.35),
									padding : const EdgeInsets.all(25.0),
									child : Text(
										'Personal Information',
										style : TextStyle(
										fontSize : 25.0,
										fontWeight : FontWeight.w800,
										),
									),
								),
								Container(
									margin : EdgeInsets.only(top : MediaQuery.of(context).size.height * 0.4),
									padding : const EdgeInsets.all(25.0),
									child : Divider(
										color : Color(0xffff2d55),
										height : 5.0,
										endIndent : MediaQuery.of(context).size.width * 0.30,
									),
								),
								Container(
									margin : EdgeInsets.only(top : MediaQuery.of(context).size.height * 0.45),
									padding : const EdgeInsets.fromLTRB(25.0,0.0,25.0,25.0),
									child : Form(
										key : fbKey,
										autovalidate : autoValidate,
										child : Column(
											children : <Widget>[
												Padding(
													padding : const EdgeInsets.only(left : 0.0),
													child : TextFormField(
														enabled : enabled,
														controller : name,
														decoration : InputDecoration(
															labelText : 'Name',
															hintText : 'Enter Name',
														),
														validator : (val) => val.isEmpty ? 'Please enter Name' : null,
													),
												),
												Padding(
													padding : const EdgeInsets.only(left : 0.0),
													child : TextFormField(
														enabled : enabled,
														controller : email,
														decoration : InputDecoration(
															labelText : 'Login ID',
															hintText : 'Enter Login ID',
														),
														validator : (val) => val.isEmpty ? 'Please enter Login ID' : null,
													),
												),
												Padding(
													padding : const EdgeInsets.only(left : 0.0),
													child : TextFormField(
														enabled : enabled,
														controller : phone,
														decoration : InputDecoration(
															labelText : 'Phone Number',
															hintText : 'Enter Phone Number',
														),
														validator : (val) => val.isEmpty ? 'Please enter Phone Number' : null,
													),
												),
												AnimatedSwitcher(
													duration : Duration(milliseconds : 500),
													child : button,
												),
											]
										),
									),
								),
								widget.isOwner ? Container() : Positioned(
									top : 10.0,
									right : 1.0,
									child : Tooltip(
										message : 'Logout',
										child : MaterialButton(
											color : Theme.of(context).accentColor,
											shape : CircleBorder(),
											elevation : 2.0,
											child : Icon(Icons.power_settings_new,color : Colors.white),
											onPressed : ()async{
												var themeNotifier = Provider.of<ThemeNotifier>(context,listen : false);
												//print(themeNotifier);
												themeNotifier.setTheme(lightTheme);
												SharedPref sharedPref = SharedPref();
                  								await sharedPref.remove('executive');
                  								Navigator.pushReplacement(
							                    context,
							                    MaterialPageRoute(
							                      builder : (context){
							                        return LoginScreen();
							                      }
							                    )
							                  );
											},
										),
									),
									
								),
								Positioned(
									right : widget.isOwner ? 10.0 : 50.0,
									top : 10.0,
									child : Tooltip(
										message : 'Edit',
										child : MaterialButton(
											color : Theme.of(context).accentColor,
											shape : CircleBorder(),
											elevation : 2.0,
											child : Icon(Icons.edit,color : Colors.white),
											onPressed : (){
												
												setState((){
													enabled = !enabled;
													if(enabled){
														button = Padding(
															padding : const EdgeInsets.only(top : 20.0),
															child : ButtonTheme(
																minWidth : 250.0,
																height : 50.0,
																child : RaisedButton(
																	onPressed : (){
																		if(fbKey.currentState.validate()){
																			
																			button = Container();
																			updateData();
																		}
																		else{
																			setState((){
																				autoValidate = false;
																			});
																		}
																	},
																	color : Theme.of(context).accentColor,
																	splashColor : Colors.white,
																	child : Text(
																		'Update',
																		style : TextStyle(
																			color : Colors.white,
																			fontSize : 20.0,
																		),
																	),
																),
															),
														);
													}
													else{
														button = Container();
													}
												});
											},
										),
									),
								),
								isLoading ? Positioned(
									left : MediaQuery.of(context).size.width / 2,
									top : MediaQuery.of(context).size.width / 1.25,
									child : CircularProgressIndicator(),
								) : Container(),
								//isLoading ? Center(child : CircularProgressIndicator()) : Container(),
							]
						),
					]
				),
			),
		);
	}
}

