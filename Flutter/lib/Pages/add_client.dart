//default
import "dart:core";
import "package:flutter/services.dart";
import 'package:flutter/material.dart';

//plugins
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//custom
import '../Models/Company/client_model.dart';
import "../Api_Services/ApiCall.dart";
import "../Api_Services/Uri.dart";
import '../User/current_user.dart';

class AddClient extends StatefulWidget{

	bool companyOptions;
	AddClient({this.companyOptions=false});

	@override
	AddClientState createState() => AddClientState();
}

class AddClientState extends State<AddClient>{

	bool _autoValidate = false;
	bool isLoading = false;
	LatLng _center;

	GlobalKey<FormState> _fbKey;
 	GlobalKey<ScaffoldState> _scaffoldKey;
 	TextEditingController nameController;
 	TextEditingController contactPersonController;
 	TextEditingController emailController;
 	TextEditingController contactNumberController;
 	TextEditingController al1Controller;
 	TextEditingController al2Controller;
 	TextEditingController al3Controller;
 	TextEditingController pincodeController;
 	TextEditingController companyName;

 	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];
 	List<DropdownMenuItem<int>> areaMenuItems = [];
 	List<DropdownMenuItem<int>> companyMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;
 	int areaValue = -1;
 	int companyValue = -1;

 	bool stateAvail = false;
	bool cityAvail = false;
	bool areaAvail = false;
	bool getNewData = true;


	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}

	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	bool isValidPhoneNumber(String input) {
		final RegExp regex = new RegExp(r'^\d\d\d\d\d\d\d\d\d\d$');
		return regex.hasMatch(input);
	}
	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
	}

	@override
	void initState() {
		super.initState();
		//_cityController = new TextEditingController();
		getCurrentLocation();
		_fbKey  = new GlobalKey<FormState>();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
		nameController = new TextEditingController();
	 	contactPersonController = new TextEditingController();
	 	emailController = new TextEditingController();
	 	contactNumberController = new TextEditingController();
	 	al1Controller = new TextEditingController();
	 	al2Controller = new TextEditingController();
	 	al3Controller = new TextEditingController();
	 	pincodeController = new TextEditingController();
	 	companyName = new TextEditingController();
	 	if(!widget.companyOptions){
	 		companyName.text = CurrentUser.companyName;
	 	}
	 	

	}

	Future<String> getAllData() async{
		if(getNewData){
			getNewData = false;
			
			String tmpId = CurrentUser.isOwner ? CurrentUser.id.toString() : CurrentUser.ownerId.toString();
			var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY+'/owner/${tmpId}');
			companyMenuItems.clear();
			for(int i=0;i<response1.length;i++){
				companyMenuItems.add(
					DropdownMenuItem<int>(
						value : response1[i]['companyId'],
						child : Text(response1[i]['companyName'])
					),
				);
			}

			var response2 = await ApiCall.getDataFromApi(Uri.GET_COUNTRY);
			countryMenuItems.clear();
			for(int i=0;i<response2.length;i++){
				countryMenuItems.add(
					DropdownMenuItem<int>(
						value : response2[i]['countryID'],
						child : Text(response2[i]['countryName'])
					),
				);
			}
			return 'done';
		}
		else{
			return 'Done';
		}
		
	}

	createRecord(data) async{
		var response1 = await ApiCall.createRecord(Uri.GET_CLIENT, data);
	}
	void showMessage(String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color,
        content: new Text(message, style: TextStyle(color: Colors.white))));
  	}

	addData() async{
		//print('here');
		setState((){
			isLoading = true;
		});
		String createdOn = DateTime.now().toString().substring(0,19);

		ClientClass c1 = new ClientClass.toPost(
			nameController.text,
			contactPersonController.text,
			emailController.text,
			contactNumberController.text,
			widget.companyOptions ? companyValue : CurrentUser.companyId,
			countryValue,
			stateValue,
			cityValue,
			areaValue,
			al1Controller.text,
			al2Controller.text,
			al3Controller.text,
			pincodeController.text,
			_center.latitude.toString(),
            _center.longitude.toString(),
            createdOn,
            CurrentUser.id

		);
		print(c1.toMap());
		ClientClass c2 = await createRecord(c1.toMap());
		setState((){isLoading = false;});
		Navigator.pop(context,true);
	}

	makeForm(context1){

		return IgnorePointer(
			ignoring : isLoading,
			child : Stack(
				children : <Widget>[
					FutureBuilder(
						future : getAllData(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								return Form(
								key: _fbKey,
								autovalidate : _autoValidate,
									child : ListView(
										children : <Widget>[
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : nameController,
													decoration : InputDecoration(
														icon : Icon(Icons.person_add),
														hintText : 'Enter name',
														labelText : 'Name',
													),
													validator : (v)=>v.isEmpty ? 'Name is required .' : null,
												),
											),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : contactPersonController,
													decoration : InputDecoration(
														icon : Icon(Icons.account_circle),
														hintText : 'Enter contact person',
														labelText : 'Contact Person',
													),
													validator : (v)=>v.isEmpty ? 'Contact person is required .' : null,
												),
											),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : emailController,
													decoration : InputDecoration(
														icon : Icon(Icons.email),
														hintText : 'Enter Email ID',
														labelText : 'Email ID',
													),
													keyboardType: TextInputType.emailAddress,
												          validator: (value) => isValidEmail(value)
												              ? (isEmailContains(value)
												                  ? null
												                  : 'Email must contain @ and .')
												              : 'Please enter a valid email address',
												          //onSaved : (val) => newEnquiry.email=val,
												        ),
												),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
												controller : contactNumberController,
												decoration: InputDecoration(
													icon: Icon(Icons.phone),
													hintText: 'Enter a phone number',
													labelText: 'Phone',
												),
												keyboardType: TextInputType.phone,
												inputFormatters: [
													LengthLimitingTextInputFormatter(10),
													WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
												],
												validator: (value) => isValidPhoneNumber(value)
												  ? null
												  : 'Phone number must be of 10 numbers',
												),
											),
											widget.companyOptions ? Padding(
												padding : const EdgeInsets.only(left : 16.0,right : 16.0),
												child : DropdownButtonHideUnderline(
													child : DropdownButtonFormField(
														validator : (v) => v == null ? 'Please Select Company' : null,
														isDense : true,
														decoration : InputDecoration(
															labelText : 'Company',
															hintText : 'Select Company',
														),
														autovalidate : _autoValidate,
														items : companyMenuItems,
														onChanged : (v){
															FocusManager.instance.primaryFocus.unfocus();
															setState((){
																companyValue = v;
															});
														},
														value : companyValue == -1 ? null : companyValue,
													),
												) 
											) : Padding(
												padding: EdgeInsets.only(left: 10.0 ,right : 16.0),
												child: TextFormField(
													enabled : false,
													decoration : InputDecoration(
														icon : Icon(FontAwesomeIcons.building),
														labelText : 'Company Name',
													),
													controller : companyName,
												),
											), 

											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : al1Controller,
													decoration : InputDecoration(
														icon : Icon(Icons.place),
														hintText : 'Enter Address Line 1',
														labelText : 'Address Line 1',
													),
													validator : (v)=>v.isEmpty ? 'Address Line 1 is required .' : null,
												),
											),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : al2Controller,
													decoration : InputDecoration(
														icon : Icon(Icons.place),
														hintText : 'Enter Address Line 2',
														labelText : 'Address Line 2',
													),
													validator : (v)=>v.isEmpty ? 'Address Line 2 is required .' : null,
												),
											),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : al3Controller,
													decoration : InputDecoration(
														icon : Icon(Icons.place),
														hintText : 'Enter Address Line 3',
														labelText : 'Address Line 3',
													),
													validator : (v)=>v.isEmpty ? 'Address Line 3 is required .' : null,
												),
											),
											Padding(
												padding : const EdgeInsets.only(left : 10.0,right : 16.0),
												child : TextFormField(
													controller : pincodeController,
													decoration : InputDecoration(
														icon : Icon(Icons.fiber_pin),
														hintText : 'Enter Pincode',
														labelText : 'Pincode',
													),
													keyboardType: TextInputType.phone,
													inputFormatters: [
														LengthLimitingTextInputFormatter(6),
														WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
													],
													validator : (v)=>v.isEmpty ? 'Pincode is required .' : null,
												),
											),
											
											Padding(
											padding : const EdgeInsets.only(left : 16.0,right : 16.0),
											child : StatefulBuilder(
												builder : (c,st){
													return Column(
														crossAxisAlignment : CrossAxisAlignment.start,
														children : <Widget>[
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																		validator : (v) => v == null ? 'Please Select Country' : null,
																		isDense : true,
																		decoration : InputDecoration(
																			labelText : 'Country',
																			hintText : 'Select Country',
																		),
																		autovalidate : _autoValidate,
																		items : countryMenuItems,
																		onChanged : (v)async{
																		print(v.toString());
																		FocusManager.instance.primaryFocus.unfocus();
																		stateMenuItems.clear();
																		cityMenuItems.clear();
																		areaMenuItems.clear();
																		var r= await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/${v.toString()}');
																			for(int i=0;i<r.length;i++){
																			stateMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r[i]['stateID'],
																					child : Text(r[i]['stateName']),
																				),
																			);
																		}
																		st((){
																		
																			stateAvail = true;
																			cityAvail = false;
																			areaAvail = false;

																			stateValue = -1;
																			cityValue = -1;
																			areaValue = -1;
																			countryValue = v;

																			
																		});
																	},
																	value : countryValue == -1 ? null : countryValue,
																),
															),
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(stateAvail){
																			if(v==null){
																				return 'Please Select State';
																			}
																			else{
																				return null;
																			}
																		}
																		else{
																			return null;
																		}
																	},
																	decoration : InputDecoration(
																		labelText : 'State',
																		hintText : 'Please Select State',
																	),
																	isDense : true,
																	autovalidate : _autoValidate,
																	items : stateMenuItems,
																	onChanged : stateAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		cityMenuItems.clear();
																		areaMenuItems.clear();
																		var r = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/${v.toString()}?ownerID=${CurrentUser.ownerId}');
																		for(int i=0;i<r.length;i++){
																			cityMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r[i]['businessCityForCompanyID'],
																					child : Text(r[i]['businessCityForCompanyName']),
																				),
																			);
																		}
																		st((){

																			cityAvail = true;
																			areaAvail = false;

																			cityValue = -1;
																			areaValue = -1;
																			stateValue = v;
																		});
																	} : null,
																	value : stateValue == -1 ? null : stateValue,
																),
															),

															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(stateAvail && cityAvail){
																			if(v==null){
																				return 'Please Select City';
																			}
																			else{
																				return null;
																			}
																		}
																		else{
																			return null;
																		}
																	},
																	decoration : InputDecoration(
																		labelText : 'City',
																		hintText : 'Select City',
																	),
																	isDense : true,
																	autovalidate : _autoValidate,
																	items : cityMenuItems,
																	onChanged : cityAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		areaMenuItems.clear();
																		var r = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA_FROM_BUSINESS_CITY+'/${v.toString()}?ownerID=${CurrentUser.ownerId}');
																		for(int i=0;i<r.length;i++){
																			areaMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r[i]['businessAreaForCompanyID'],
																					child : Text(r[i]['businessAreaForCompanyName'])
																				),
																			);
																		}
																		st((){
																			areaAvail = true;

																			areaValue = -1;
																			cityValue = v;
																		});
																	} : null,
																	value : cityValue == -1 ? null : cityValue,

																),
															),

															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(stateAvail && cityAvail && areaAvail){
																			if(v==null){
																				return 'Please Select Area.';
																			}
																			else{
																				return null;
																			}
																		}
																		else{
																			return null;
																		}
																	},
																	decoration : InputDecoration(
																		labelText : 'Area',
																		hintText : 'Please Select Area',
																	),
																	isDense : true,
																	autovalidate : _autoValidate,
																	items : areaMenuItems,
																	onChanged : (v){
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){areaValue = v;});
																	},
																	value : areaValue == -1 ? null : areaValue,

																),
															),

															

															

														]
													);
												}
											)
											),
											Container(
												padding: EdgeInsets.only(left: 60.0, top: 40.0, right: 60.0),
												height: 85.0,
												child: FlatButton(
													textColor: Theme.of(context).primaryColor,
													color: Colors.white,
													shape: RoundedRectangleBorder(
														borderRadius: new BorderRadius.circular(4.0),
														side: BorderSide(color: Theme.of(context).accentColor),
													),
													padding: const EdgeInsets.all(8.0),
													child: Text(
														"Submit",
														style: TextStyle(
														fontWeight: FontWeight.bold,
														fontSize: 20.0,
														),
													),
													onPressed: () {
														//print('hi');
													if (_fbKey.currentState.validate()) {
														//print('here baba');
														addData();
														//Navigator.pop(context);
														//Navigator.pop(context);
														} else {
															//print('here baba2');
														setState(() {
														_autoValidate = true;
														});
														}
													}
												),
											),
											Container(
												height: 20.0,
											),
										]
									),
								);
							}
						}
					),
					isLoading ? Center(child : CircularProgressIndicator())	: Container(),
				]
			),
		);
		
		
	}





	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Add New Client'),
			),
			body : makeForm(context),
		);
	}
}