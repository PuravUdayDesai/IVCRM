//default
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "dart:core";

//plugins
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

//custom
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Models/Company/company_branch_model.dart';
import '../../User/current_user.dart';

class AddCompanyBranch extends StatefulWidget{
	@override
	_AddCompanyBranchState createState ()=> _AddCompanyBranchState();
}

class _AddCompanyBranchState extends State<AddCompanyBranch>with SingleTickerProviderStateMixin{

	TabController tabController;
	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
	bool getCompanyData = true;
	bool getCountryData = true;
	bool getPositionData = true;
	bool autoValidate = false;
	bool autoValidate2 = false;
	bool autoValidate5 = false;
	bool isLoading = false;
	LatLng _center;

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);
	Icon thirdIcon = Icon(Icons.filter_3);

	TextEditingController companyBranchCode = TextEditingController();
	TextEditingController companyBranchName = TextEditingController();

	TextEditingController addressLine1 = TextEditingController();
	TextEditingController addressLine2 = TextEditingController();
	TextEditingController addressLine3 = TextEditingController();
	TextEditingController pincode = TextEditingController();

	TextEditingController executiveName= TextEditingController();
	TextEditingController loginId= TextEditingController();
	TextEditingController password= TextEditingController();
	TextEditingController contactNumber= TextEditingController();

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];
 	List<DropdownMenuItem<int>> areaMenuItems = [];
 	List<DropdownMenuItem<int>> companyBranchTypeMenuItems = [];
 	List<DropdownMenuItem<int>> positionMenuItems = [];
 	List<DropdownMenuItem<int>> companyRegionMenuItems = [];
 	List<DropdownMenuItem<int>> companyAreaMenuItems = [];
 	List<DropdownMenuItem<int>> companyMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;
 	int areaValue = -1;
 	int companyBranchTypeValue = -1;
 	int positionValue = -1;
 	int companyRegionValue = -1;
 	int companyAreaValue = -1;
 	int companyValue = -1;

 	bool stateAvail = false;
	bool cityAvail = false;
	bool areaAvail = false;
	bool companyBranchTypeAvail = false;
	bool companyRegionAvail = false;
	bool companyAreaAvail = false;

	List<bool> completed = [false,false,false];

	String page = '';
	bool allIndex = true;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	BoxDecoration boxDecoration() {
  		return BoxDecoration(
    		border: Border.all(
    			width : 1.0,
    			color : Theme.of(context).primaryColor,
    		),
    		borderRadius: BorderRadius.all(
        		Radius.circular(5.0) 
    		),
  		);
	}

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}

	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	

	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
	}

	Future<String> getRequiredData() async{
		if(getCompanyData){
			getCompanyData = false;
			var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY+'/owner/${CurrentUser.id}');
			companyMenuItems.clear();
			for(int i=0;i<response1.length;i++){
				companyMenuItems.add(
					DropdownMenuItem<int>(
						value : response1[i]['companyId'],
						child : Text(response1[i]['companyName'])
					),
				);
			}
			return 'done';
		}
		else{
			return 'done';
		}
	}

	Future<String> getCountries() async{
		if(getCountryData){
			getCountryData = false;
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
			return 'done';
		}
	}

	Future<String> getPositions() async{
		if(getPositionData){
			getPositionData = false;
			
			var response2 = await ApiCall.getDataFromApi(Uri.GET_POSITION+'/${CurrentUser.id}');
		    positionMenuItems.clear();
		    if(response2!='nothing'){
		    	for(int i=0;i<response2.length;i++){
			    	//companyBranchTypesMapping[response2[i]['companyBranchTypeId']] = response2[i]['companyBranchTypeName'];
			    	positionMenuItems.add(
			    		DropdownMenuItem<int>(
			    			value : response2[i]['positionId'],
			    			child : Text(response2[i]['positionName'])
			    		),
			    	);
		    	}	
		    }
		    return 'done';
		}
		else{
			return 'done';
		}
	}

	addData() async{
		String createdOn = DateTime.now().toString().substring(0,19);
		setState((){
			isLoading = true;
		});

		CompanyBranchClass c1 = CompanyBranchClass.toPost(
			addressLine1.text,
			addressLine2.text,
			addressLine3.text,
			pincode.text,
			cityValue,//city id
			stateValue,//state id
			countryValue,//country id
			_center.latitude.toString(),
            _center.longitude.toString(),
            companyValue,
            companyRegionValue,
            companyAreaValue,
            companyBranchName.text,
            companyBranchCode.text,
            companyBranchTypeValue,
            executiveName.text,
			loginId.text,
			password.text,
			contactNumber.text,
			createdOn,
			CurrentUser.id,
			2//device type
		);

		var c2 = await ApiCall.createRecord(Uri.GET_COMPANY_BRANCH,c1.toMap());
		setState((){
			isLoading = false;
		});
		Navigator.pop(context,true);
	}

	@override
	void initState() {
		super.initState();
		getCurrentLocation();
		tabController = TabController(vsync : this,initialIndex : 0,length : 3);
		_scaffoldKey = GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Add new company branch'),
				bottom : TabBar(
					controller : tabController,
					indicatorColor : Colors.white,
					tabs : <Widget>[
						Tab(icon : firstIcon),
						Tab(icon : secondIcon),
						Tab(icon : thirdIcon),
					],
				),
			),
			body : TabBarView(
				controller : tabController,
				children : <Widget>[
					FutureBuilder(
						future : getRequiredData(),
						builder : (c,s){
							if(s.data == null){
								return Center(child : CircularProgressIndicator());
							}
							else{
								return Container(
									margin : const EdgeInsets.all(15.0),
									padding : const EdgeInsets.all(10.0),
									decoration : boxDecoration(),
									child : Form(
										key : _formKey,
										autovalidate : autoValidate,
										child :StatefulBuilder(
											builder : (c,st){
												return ListView(
													children : <Widget>[
														Center(
															child : Text(
																'Company Branch Details',
																textScaleFactor : 1.5,
																style : TextStyle(
																	fontWeight : FontWeight.bold,
																),
															),
														),
														DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																		validator : (v) => v == null ? 'Please Select Company' : null,
																		isDense : true,
																		decoration : InputDecoration(
																			labelText : 'Company',
																			hintText : 'Select Company',
																		),
																		autovalidate : autoValidate,
																		items : companyMenuItems,
																		onChanged : (v)async{
																		print(v.toString());
																		FocusManager.instance.primaryFocus.unfocus();
																		companyRegionMenuItems.clear();
																		companyAreaMenuItems.clear();
																		companyBranchTypeMenuItems.clear();
																		var r= await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/${v.toString()}');
																		for(int i=0;i<r.length;i++){
																			companyRegionMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r[i]['companyRegionID'],
																					child : Text(r[i]['companyRegionName']),
																				),
																			);
																		}
																		var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH_TYPE+'/$v');
																		print(r1);
																		for(int i=0;i<r1.length;i++){
																			companyBranchTypeMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r1[i]['companyBranchTypeId'],
																					child : Text(r1[i]['companyBranchTypeName']),
																				),
																			);
																		}
																		st((){
																		
																			companyRegionAvail = true;
																			companyBranchTypeAvail = true;
																			companyAreaAvail = false;

																			companyRegionValue = -1;
																			companyAreaValue = -1;
																			companyBranchTypeValue = -1;
																			companyValue = v;

																			
																		});
																	},
																	value : companyValue == -1 ? null : companyValue,
																),
															),
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(companyBranchTypeAvail){
																			if(v==null){
																				return 'Please Select Comapny branch type.';
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
																		labelText : 'Company branch type',
																		hintText : 'Select Company branch type',
																	),
																	isDense : true,
																	autovalidate : autoValidate,
																	items : companyBranchTypeMenuItems,
																	onChanged : companyBranchTypeAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){
																			companyBranchTypeValue = v;
																		});
																	} : null,
																	value : companyBranchTypeValue == -1 ? null : companyBranchTypeValue,

																),
															),
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(companyRegionAvail){
																			if(v==null){
																				return 'Please Select Company region.';
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
																		labelText : 'Company region',
																		hintText : 'Please Company region.',
																	),
																	isDense : true,
																	autovalidate : autoValidate,
																	items : companyRegionMenuItems,
																	onChanged : companyRegionAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		companyAreaMenuItems.clear();
																		var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_AREA+'/region/${v.toString()}');
																		for(int i=0;i<r.length;i++){
																			companyAreaMenuItems.add(
																				DropdownMenuItem<int>(
																					value : r[i]['companyAreaID'],
																					child : Text(r[i]['companyAreaName']),
																				),
																			);
																		}
																		st((){

																			companyAreaAvail = true;

																			companyAreaValue = -1;
																			companyRegionValue = v;
																		});
																	} : null,
																	value : companyRegionValue == -1 ? null : companyRegionValue,
																),
															),

															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(companyRegionAvail && companyAreaAvail){
																			if(v==null){
																				return 'Please Select Comapny area.';
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
																		labelText : 'Company Area',
																		hintText : 'Select Company Area',
																	),
																	isDense : true,
																	autovalidate : autoValidate,
																	items : companyAreaMenuItems,
																	onChanged : companyAreaAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){
																			companyAreaValue = v;
																		});
																	} : null,
																	value : companyAreaValue == -1 ? null : companyAreaValue,

																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : companyBranchCode,
																	decoration : InputDecoration(
																		labelText : 'Code',
																		hintText : 'Enter Company Branch code.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter company branch code.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : companyBranchName,
																	decoration : InputDecoration(
																		labelText : 'Name',
																		hintText : 'Enter company branch name.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter company branch name.' : null,
																),
															),
															SizedBox(height : 60.0),
															Align(
								    							alignment: Alignment.bottomRight,
								    							child : RaisedButton(
																    onPressed: () {
																    	FocusManager.instance.primaryFocus.unfocus();
																    	FormState form = _formKey.currentState;
																    	if(form.validate()){
															    			setState((){
															    				firstIcon = Icon(Icons.check_circle);
															    				completed[0]=true;
															    			});
																    		tabController.animateTo(1);
																    	}
																    	else{
																    		setState((){
																    			autoValidate = true;
																    			firstIcon = Icon(Icons.error_outline);
																    		});
																    	}
																    },
																    color: Theme.of(context).accentColor,
																    child: Padding(
																      padding: EdgeInsets.fromLTRB(
																          0.5 * 5,
																          0,
																          0.5 * 5,
																          0),
																      child: Row(
																        mainAxisAlignment: MainAxisAlignment.end,
																        mainAxisSize: MainAxisSize.min,  
																        children: <Widget>[
																			Text(
																			'Submit (1/3) ',
																			style: TextStyle(
																					fontSize: 20,
																					fontWeight: FontWeight.w700,
																					color: Colors.white,
																				),
																			),
																            SizedBox(width : 10.0),
																            Icon(
																              Icons.arrow_forward,
																              color: Colors.white,
																          	),
																        ],
																      ),
																    ),
															    )
								    						),

													]
												);
											}
										),
									),
								);
							}
						}
					),
					FutureBuilder(
						future : getCountries(),
						builder : (c,s){
							if(s.data == null){
								return Center(child : CircularProgressIndicator());
							}
							else{
								return Container(
									margin : const EdgeInsets.all(15.0),
									padding : const EdgeInsets.all(10.0),
									decoration : boxDecoration(),
									child : Form(
										key : _formKey2,
										autovalidate : autoValidate2,
										child : StatefulBuilder(
											builder : (c1,st){
												return ListView(
													children : <Widget>[	
														Center(
															child : Text(
																'Location Details',
																textScaleFactor : 1.5,
																style : TextStyle(
																	fontWeight : FontWeight.bold,
																),
															),
														),
														
															 DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																		validator : (v) => v == null ? 'Please Select Country' : null,
																		isDense : true,
																		decoration : InputDecoration(
																			labelText : 'Country',
																			hintText : 'Select Country',
																		),
																		autovalidate : autoValidate,
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
																	autovalidate : autoValidate,
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
																	autovalidate : autoValidate,
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
																	autovalidate : autoValidate,
																	items : areaMenuItems,
																	onChanged : (v){
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){areaValue = v;});
																	},
																	value : areaValue == -1 ? null : areaValue,

																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : addressLine1,
																	decoration : InputDecoration(
																		labelText : 'Line-1',
																		hintText : 'Enter address line 1.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter address line 1.' : null,
																),
															),

															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : addressLine2,
																	decoration : InputDecoration(
																		labelText : 'Line-2',
																		hintText : 'Enter address line 2.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter address line 2.' : null,
																),
															),

															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : addressLine3,
																	decoration : InputDecoration(
																		labelText : 'Line-3',
																		hintText : 'Enter address line 3.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter address line 3.' : null,
																),
															),

															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : pincode,
																	decoration : InputDecoration(
																		labelText : 'Pincode',
																		hintText : 'Enter pincode.',
																		border : OutlineInputBorder(),
																	),
																	keyboardType: TextInputType.phone,
																	inputFormatters: [
																		LengthLimitingTextInputFormatter(6),
																		WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
																	],
																	validator : (v) => v.isEmpty ? 'Please enter pincode.' : null,
																),
															),

															SizedBox(height : 60.0),
															Align(
								    							alignment: Alignment.bottomRight,
								    							child : RaisedButton(
																    onPressed: () {
																    	FocusManager.instance.primaryFocus.unfocus();
																    	FormState form = _formKey2.currentState;
																    	if(form.validate()){
															    			setState((){
															    				secondIcon = Icon(Icons.check_circle);
															    				completed[1]=true;
															    			});
																    		tabController.animateTo(2);
																    	}
																    	else{
																    		setState((){
																    			autoValidate2 = true;
																    			secondIcon = Icon(Icons.error_outline);
																    		});
																    	}
																    },
																    color: Theme.of(context).accentColor,
																    child: Padding(
																      padding: EdgeInsets.fromLTRB(
																          0.5 * 5,
																          0,
																          0.5 * 5,
																          0),
																      child: Row(
																        mainAxisAlignment: MainAxisAlignment.end,
																        mainAxisSize: MainAxisSize.min,  
																        children: <Widget>[
																			Text(
																			'Submit (2/3) ',
																			style: TextStyle(
																					fontSize: 20,
																					fontWeight: FontWeight.w700,
																					color: Colors.white,
																				),
																			),
																            SizedBox(width : 10.0),
																            Icon(
																              Icons.arrow_forward,
																              color: Colors.white,
																          	),
																        ],
																      ),
																    ),
															    )
								    						),

														
													]
												);
											}
										),
									),
								);
							}
						}
					),
					IgnorePointer(
						ignoring : isLoading,
						child : Stack(
							children : <Widget>[	
								FutureBuilder(
									future : getPositions(),
									builder : (c,s){
										if(s.data == null){
											return Center(child : CircularProgressIndicator());
										}
										else{
											return Container(
												margin : const EdgeInsets.all(15.0),
												padding : const EdgeInsets.all(10.0),
												decoration : boxDecoration(),
												child : Form(
													key : _formKey5,
													autovalidate : autoValidate5,
													child : ListView(
														children : <Widget>[
															Center(
																child : Text(
																	'Company executive\'s branch details',
																	textScaleFactor : 1.5,
																	style : TextStyle(
																		fontWeight : FontWeight.bold
																	),
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : executiveName,
																	decoration : InputDecoration(
																		labelText : 'Name',
																		hintText : 'Enter executive name.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter executive name.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : loginId,
																	decoration : InputDecoration(
																		labelText : 'Login ID',
																		hintText : 'Enter Login ID.',
																		border : OutlineInputBorder(),
																	),
																	keyboardType: TextInputType.emailAddress,
															          validator: (value) => isValidEmail(value)
															              ? (isEmailContains(value)
															                  ? null
															                  : 'Email must contain @ and .')
															              : 'Please enter a valid email address',
																	//validator : (v) => v.isEmpty ? 'Please enter Login ID.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : password,
																	decoration : InputDecoration(
																		labelText : 'Password',
																		hintText : 'Enter password.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter password.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : contactNumber,
																	decoration : InputDecoration(
																		labelText : 'Contact Number',
																		hintText : 'Enter contact number.',
																		border : OutlineInputBorder(),
																	),
																	keyboardType: TextInputType.phone,
																	inputFormatters: [
																		LengthLimitingTextInputFormatter(10),
																		WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
																	],
																	validator : (v) => v.isEmpty ? 'Please enter contact number.' : null,
																),
															),
															StatefulBuilder(
																builder : (c,st){
																	return DropdownButtonHideUnderline(
																		child : DropdownButtonFormField<int>(
																			validator : (v) => v == null ? 'Please Select any option.' : null,
																			isDense : true,
																			decoration : InputDecoration(
																				labelText : 'Position',
																				hintText : 'Select Position.',
																			),
																			autovalidate : autoValidate5,
																			items : positionMenuItems,
																			onChanged : (v){
																					st((){
																						positionValue = v;
																					});
																			},
																			value : positionValue == -1 ? null : positionValue,
																		),
																	);
																}
															),
															SizedBox(height : 60.0),
															Align(
								    							alignment: Alignment.bottomRight,
								    							child : RaisedButton(
																    onPressed: () {
																    	FocusManager.instance.primaryFocus.unfocus();
																    	FormState form = _formKey5.currentState;
																    	if(form.validate()){
															    			setState((){
															    				thirdIcon = Icon(Icons.check_circle);
															    				completed[2]=true;
															    			});
																    		//tabController.animateTo(4);
																    		for(int i=0;i<completed.length;i++){
																    			if(!completed[i]){
																    				if(page == ''){
																    					page = page +(i+1).toString();
																    				}
																    				else{
																    					page = page + ' , '+(i+1).toString();
																    				}
																    				
																    				allIndex = false;
																    			}
																    		}
																    		if(allIndex){
																    			addData();
																    		}
																    		else{
																    			showMessage('Looks like some fields are missing.Please review page $page');
																    			allIndex = true;
																    		}
																    	}
																    	else{
																    		setState((){
																    			autoValidate5 = true;
																    			thirdIcon = Icon(Icons.error_outline);
																    		});
																    	}
																    },
																    color: Theme.of(context).accentColor,
																    child: Padding(
																      padding: EdgeInsets.fromLTRB(
																          0.5 * 5,
																          0,
																          0.5 * 5,
																          0),
																      child: Row(
																        mainAxisAlignment: MainAxisAlignment.end,
																        mainAxisSize: MainAxisSize.min,  
																        children: <Widget>[
																			Text(
																			'Submit (3/3) ',
																			style: TextStyle(
																					fontSize: 20,
																					fontWeight: FontWeight.w700,
																					color: Colors.white,
																				),
																			),
																            SizedBox(width : 10.0),
																            Icon(
																              Icons.arrow_forward,
																              color: Colors.white,
																          	),
																        ],
																      ),
																    ),
															    )
								    						),
														]
													),
												),
											);
										}
									}
								),
								isLoading ? Center(child : CircularProgressIndicator()) : Container(),
							]
						),
					),
				]
			),
		);
	}
}