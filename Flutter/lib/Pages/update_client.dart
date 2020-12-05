//default
import "package:flutter/services.dart";
import "dart:core";
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


class UpdateClient extends StatefulWidget{

	final ClientClass obj;
	bool companyOptions;
	UpdateClient(this.obj,{this.companyOptions = false});
	@override
	UpdateClientState createState() => UpdateClientState();
}

class UpdateClientState extends State<UpdateClient>{

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

 	bool stateAvail = true;
	bool cityAvail = true;
	bool areaAvail = true;
	bool getNewCountryData = true;


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
		
		countryValue = widget.obj.countryId;
		stateValue = widget.obj.stateId;
		cityValue = widget.obj.cityId;
		areaValue = widget.obj.areaId;
		getCurrentLocation();
		_fbKey  = new GlobalKey<FormState>();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
		if(widget.companyOptions){
	 		companyValue = widget.obj.companyId;
	 	}
	 	else{
	 		companyName = new TextEditingController();
			companyName.text = CurrentUser.companyName;	
	 	}

	}

	Future<String> getAllData() async{

		if(getNewCountryData){
			getNewCountryData = false;

			var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY);
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

			var response3 = await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/${widget.obj.countryId.toString()}');
			stateMenuItems.clear();
			for(int i=0;i<response3.length;i++){
				stateMenuItems.add(
					DropdownMenuItem<int>(
						value : response3[i]['stateID'],
						child : Text(response3[i]['stateName']),
					)
				);
			}

			var response4 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/${widget.obj.stateId.toString()}?ownerID=${CurrentUser.ownerId}');
			cityMenuItems.clear();
			for(int i=0;i<response4.length;i++){
				cityMenuItems.add(
					DropdownMenuItem<int>(
						value : response4[i]['businessCityForCompanyID'],
						child : Text(response4[i]['businessCityForCompanyName']),
					)
				);
			}

			var response5 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA_FROM_BUSINESS_CITY+'/${widget.obj.cityId.toString()}?ownerID=${CurrentUser.ownerId}');
			areaMenuItems.clear();
			for(int i=0;i<response5.length;i++){
				areaMenuItems.add(
					DropdownMenuItem<int>(
						value : response5[i]['businessAreaForCompanyID'],
						child : Text(response5[i]['businessAreaForCompanyName']),
					)
				);
			}

			return 'done';

		}	
		else{
			return 'done';
		}
		

		
		
	}

	updateRecord(dataa, int id) async {
		var response1 = await ApiCall.updateRecord(Uri.GET_CLIENT + "/$id", dataa);
	}
	void showMessage(String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color,
        content: new Text(message, style: TextStyle(color: Colors.white))));
  	}

	updateData() async{
		setState((){
			isLoading = true;
		});
		String lastEditOn = DateTime.now().toString().substring(0,19);

		ClientClass c1 = new ClientClass.toPut(
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
            lastEditOn,
            CurrentUser.id//edit by

		);
		ClientClass c2 = await updateRecord(c1.toPut(),widget.obj.clientId);
		setState((){
			isLoading = false;
		});
		Navigator.pop(context,true);
	}

	makeForm(context1){
		nameController = new TextEditingController();
	 	contactPersonController = new TextEditingController();
	 	emailController = new TextEditingController();
	 	contactNumberController = new TextEditingController();
	 	al1Controller = new TextEditingController();
	 	al2Controller = new TextEditingController();
	 	al3Controller = new TextEditingController();
	 	pincodeController = new TextEditingController();
	 	nameController.text = widget.obj.contactName;
	 	contactPersonController.text = widget.obj.contactPerson;
	 	emailController.text = widget.obj.emailId;
	 	contactNumberController.text = widget.obj.contactNumber;
	 	al1Controller.text = widget.obj.addressLine1;
	 	al2Controller.text = widget.obj.addressLine2;
	 	al3Controller.text = widget.obj.addressLine3;
	 	pincodeController.text = widget.obj.pincode;

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
																		FocusScope.of(context).unfocus();
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
																		FocusScope.of(context).unfocus();
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
																		FocusScope.of(context).unfocus();
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
																	items : areaMenuItems,
																	autovalidate : _autoValidate,
																	onChanged : (v){
																		FocusScope.of(context).unfocus();
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
														"Update",
														style: TextStyle(
														fontWeight: FontWeight.bold,
														fontSize: 20.0,
														),
													),
													onPressed: () async{
													if (_fbKey.currentState.validate()) {
														updateData();
														//Navigator.pop(context);
														//Navigator.pop(context);
														} else {
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
					isLoading ? Center(child : CircularProgressIndicator()) : Container(),
	 			]
	 		),
	 	);

	}





	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Update Client Details'),
			),
			body : makeForm(context),
		);
	}
}