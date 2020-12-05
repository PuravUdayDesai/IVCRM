//default
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "dart:core";

//plugin
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//custom
import "../Api_Services/ApiCall.dart";
import "../Api_Services/Uri.dart";
import '../Models/Company/enquiry_model.dart';
import '../User/current_user.dart';

class Temp {
  
  static Icon firstIcon = Icon(Icons.filter_1);
  static Icon secondIcon = Icon(Icons.filter_2);
  static Icon thirdIcon = Icon(Icons.filter_3);
  static bool firstCompleted=false;
  static bool secondCompleted=false;
  static bool thirdCompleted=false;
  
  static var completed=[false,false,false];
}

class AddEnquiry extends StatefulWidget{
	final bool companyOptions;
	AddEnquiry({this.companyOptions = false});
	@override
	_AddEnquiryState createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> with SingleTickerProviderStateMixin{
	
	TabController tabController;
	String page="";
	bool index=true;
	LatLng _center;
	bool isVisible = true;
	String companyBranchTypeValue = 'New';
	String positionValue = 'New';
	bool once = true;

	bool _autoValidate = false;
	bool _autoValidate2 = false;
	bool _autoValidate3 = false;

	String enquiryValue = '';
	String clientValue = '';
	String statusValue = '';
	String priorityValue = '';
	String productValue = '';
	String companyValue = '';
	String startDateString = '';
	String endDateString = '';
	//int countryValue = -1;

	//List<DropdownMenuItem<int>> countryMenuItems = [];
	List<DropdownMenuItem<String>> enquiryTypeMenuItems = [];
	List<DropdownMenuItem<String>> clientMenuItems = [];
	List<DropdownMenuItem<String>> statusMenuItems = [];
	List<DropdownMenuItem<String>> priorityMenuItems = [];
	List<DropdownMenuItem<int>> companyMenuItems = [];
	List<String> productMenuItems = [];
	List<dynamic> selectedProducts = [];

	Map<int,String> productsMapping = new Map<int,String>();

	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	GlobalKey<FormState> _formKey=GlobalKey<FormState>();
	GlobalKey<FormState> _formKey2=GlobalKey<FormState>();
	GlobalKey<FormState> _formKey3=GlobalKey<FormState>();

	TextEditingController addressLine1;
	TextEditingController addressLine2;
	TextEditingController addressLine3;
	TextEditingController pincode;
	TextEditingController enquiryRemarks;
	TextEditingController startDate;
	TextEditingController endDate;
	TextEditingController companyName;

	List<DropdownMenuItem<int>> stateMenuItems = [];
	List<DropdownMenuItem<int>> cityMenuItems = [];
	List<DropdownMenuItem<int>> areaMenuItems = [];

	int countryValue = -1;
	int stateValue = -1;
	int cityValue = -1;
	int areaValue = -1;

	bool stateAvail = false;
	bool cityAvail = false;
	bool areaAvail = false;

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);
	Icon thirdIcon = Icon(Icons.filter_3);
	bool firstCompleted=false;
	bool secondCompleted=false;
	bool thirdCompleted=false;

	var completed=[false,false,false];
	bool getNewLocationData = true;
	bool getNewProductData = true;

	List<DropdownMenuItem<int>> tempItems = [];


	Future chooseStartDate(BuildContext context) async {
		var now = new DateTime.now();
		

		var result = await showDatePicker(
		context: context,
		initialDate: now,
		firstDate: now,
		lastDate: new DateTime(2021)
		);

		if (result == null) return;

		setState(() {
		startDateString = result.toString();
		startDate.text = new DateFormat("dd/M/yyyy").format(result);
		});
	}

	Future chooseEndDate(BuildContext context) async {
		var now = new DateTime.now();
		

		var result = await showDatePicker(
		context: context,
		initialDate: now,
		firstDate: now,
		lastDate: new DateTime(2021)
		);

		if (result == null) return;

		setState(() {
		endDateString = result.toString();
		endDate.text = new DateFormat("dd/M/yyyy").format(result);
		});
	}

	bool isValidStartDate(String d1){
		if (d1.isEmpty) return false;
		var d = convertToDate(d1);
		return d != null ;
	}

	bool isValidEndDate(String d1){
		if (d1.isEmpty) return false;
		var d = convertToDate(d1);
		return d != null ;
	}

	DateTime convertToDate(String input) {
		try 
		{

		  var d = new DateFormat.yMd().parse(input);
		  return d;
		} catch (e) {
		  return null;
		}    
	}

	Future<List<DropdownMenuItem<int>>> getLocationData() async{

		if(getNewLocationData){
			getNewLocationData = false;


			var r1 = await ApiCall.getDataFromApi(Uri.GET_COUNTRY);
			for(int i=0;i<r1.length;i++){
				tempItems.add(
					DropdownMenuItem<int>(
						value : r1[i]['countryID'],
						child : Text(r1[i]['countryName']),
					),
				);
			}
			print('here');
			return tempItems;
		}
		else{
			return tempItems;
		}
		
	}


	Future<String> getCountries() async {

		if(once){
		once = false;
    	// var r1 = await ApiCall.getDataFromApi(Uri.GET_COUNTRY);

    	// // countryMenuItems.clear();
    	// // for(int i=0;i<r1.length;i++){
    	// // 	countryMenuItems.add(
    	// // 		DropdownMenuItem<int>(
    	// // 			value : r1[i]['countryId'],
    	// // 			child : Text(r1[i]['countryName']),
    	// // 		),
    	// // 	);
    	// // }
    	// var r2 = await ApiCall.getDataFromApi(Uri.GET_STATE);
    	// var r3 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+"/${CurrentUser.ownerId}");
    	// var r4 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA+"/${CurrentUser.ownerId}");
    	var r5 = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY_TYPE+"/${CurrentUser.companyId}");
    	var r6 = await ApiCall.getDataFromApi(Uri.GET_CLIENT+"/company/${CurrentUser.companyId}");
    	var r7 = await ApiCall.getDataFromApi(Uri.GET_STATUS+"/${CurrentUser.companyId}");
    	
    	if(r5 == 'nothing'){
    		showMessage('You must have to add ENQUIRY TYPE before creating any Enquiry.',Color(0xffff2d55));
    		//Navigator.pop(context);
    	}
    	else{
    		enquiryTypeMenuItems.clear();
    		for(int i=0;i<r5.length;i++){
    				enquiryTypeMenuItems.add(
    					DropdownMenuItem<String>(
    						value : r5[i]['enquiryTypeId'].toString(),
    						child : Text(r5[i]['enquiryTypeName']),
    					),
    				);	
    		}
    		
    	}
    	if(r6 == 'nothing'){
    		showMessage('You must have to add CLIENT before creating any Enquiry.',Color(0xffff2d55));
    		//Navigator.pop(context);
    	}
    	else{
    		clientMenuItems.clear();
    		for(int i=0;i<r6.length;i++){
    				clientMenuItems.add(
    					DropdownMenuItem<String>(
    						value : r6[i]['clientId'].toString(),
    						child : Text(r6[i]['contactName']),
    					),
    				);	
    		}
    		
    	}
    	if(r7 == 'nothing'){
    		showMessage('You must have to add STATUS before creating any Enquiry.',Color(0xffff2d55));
    		//Navigator.pop(context);
    	}
    	else{
    		statusMenuItems.clear();
    		for(int i=0;i<r7.length;i++){
    				statusMenuItems.add(
    					DropdownMenuItem<String>(
    						value : r7[i]['statusId'].toString(),
    						child : Text(r7[i]['statusName']),
    					),
    				);	
    		}
    		
    	}
    	
    	
    	}

    	return 'done';
  	}

  	Future<String> getProducts()async{


  		if(getNewProductData){
  			getNewProductData = false;
  			var r8 = await ApiCall.getDataFromApi(Uri.GET_PRODUCT+"/company/${CurrentUser.companyId}");
  			productMenuItems.clear();
    		productsMapping.clear();
    		for(int i=0;i<r8.length;i++){
    			//print(i);
    				productMenuItems.add(
    					r8[i]['productName']
    				);	
    				productsMapping[r8[i]['id']] = r8[i]['productName'];
    				
    		}
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
    		return 'done';

  		}
  		else{
  			return 'done';
  		}
  	}

  	

	void showMessage(String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color,
        content: new Text(message, style: TextStyle(color: Colors.white))));
  	}

  	

	@override
	void initState()
	{

		super.initState();
		getCurrentLocation();
		addressLine1 = new TextEditingController();
		addressLine2 = new TextEditingController();
		addressLine3 = new TextEditingController();
		pincode = new TextEditingController();
		enquiryRemarks = new TextEditingController();
		startDate = new TextEditingController();
		endDate = new TextEditingController();
		companyName = new TextEditingController();
		companyName.text = CurrentUser.companyName;
		tabController = TabController(vsync : this,initialIndex : 0,length : 3);
		//_scaffoldKey = new GlobalKey<ScaffoldState>();


		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '1',
				child : Text('Low'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '2',
				child : Text('Normal'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '3',
				child : Text('High'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '4',
				child : Text('Immediate'),
			),
		);
	}

	BoxDecoration myBoxDecoration() {
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

	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
	}

	addData() async
	{
		String createdOn = DateTime.now().toString().substring(0,19);
		List<int> productss = [];

		for(int i=0;i<selectedProducts.length;i++){
			int id1 = productsMapping.keys.firstWhere((k) => productsMapping[k] == selectedProducts[i],orElse : () =>null);
			productss.add(id1);
		}
		
		//print(productss);

		EnquiryClass c1 = EnquiryClass.toPost(
			widget.companyOptions ? companyValue : CurrentUser.companyId,
			enquiryRemarks.text,
			int.parse(enquiryValue),
			int.parse(clientValue),
			countryValue,//country
			stateValue,//State
			cityValue,//city
			areaValue,//area
			addressLine1.text,
			addressLine2.text,
			addressLine3.text,
			pincode.text,
			_center.latitude.toString(),
            _center.longitude.toString(),//longitude
            int.parse(statusValue),
            startDateString,
            endDateString,
            int.parse(priorityValue),
            productss,
            CurrentUser.id,
            createdOn
		);


		EnquiryClass c2 = await createRecord(c1.toMap());
		setState((){
			firstIcon = Icon(Icons.filter_1);
			secondIcon = Icon(Icons.filter_2);
			thirdIcon = Icon(Icons.filter_3);

			page = "";
			index = true;
			firstCompleted=false;
			secondCompleted=false;
			thirdCompleted=false;			
			});
		Navigator.pop(context,true);
	}

	Future<EnquiryClass> createRecord(dataa) async {
	    var response1 = await ApiCall.createRecord(Uri.GET_ENQUIRY, dataa);
	    //return CompanyClass.fromJson(response1);
  	}

	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				title : Text("Create Enquiry"),
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
									      future : getCountries(),
									      builder : (BuildContext context,AsyncSnapshot snapshot){
									        if(snapshot.data==null)
									        {
									          return Center(
									            child : CircularProgressIndicator(),
									          );
									        }
									        else
									        {
									         	return Container(
					    			margin: const EdgeInsets.all(15.0),
					    			padding: const EdgeInsets.all(10.0),
					    			decoration: myBoxDecoration(), 
					    			child: Form(
					    			key : _formKey,
					    			autovalidate : _autoValidate,
					    				child : ListView(
					    					children : <Widget>[
					    						Center(
					    							child : Text(
					    								"Enquiry Details",
					    								style : TextStyle(
					    									fontSize : 25.0,
					    									fontWeight : FontWeight.bold,
					    									//color : Theme.of(context).primaryColor,
					    								),
					    								),
					    						),
					    						
					    						Padding(
					    						padding : const EdgeInsets.only(top : 20.0),
					    						child : TextFormField(
					    							controller : enquiryRemarks,
					    							decoration : InputDecoration(
					    								//errorStyle : TextStyle(color : Colors.black),
					    								labelText : "Enquiry Remarks",
					    								hintText : "Enter enquiry remarks",
					    								border : OutlineInputBorder(borderSide :BorderSide(color : Colors.black)),
					    								focusedBorder: OutlineInputBorder(
					              							borderRadius: BorderRadius.all(Radius.circular(5.0)),	
					              							borderSide: BorderSide(color: Theme.of(context).primaryColor),
					    								),
					    								),
					    							validator: (val) => val.isEmpty ? 'enquiry remarks is required' : null,
					    						)),

					    						Padding(
					    							padding : const EdgeInsets.only(top : 20.0),
					    							child : DropdownButtonHideUnderline(
					    								child : DropdownButtonFormField<String>(
					    									validator : (v) => v == null ? 'Please Select Enquiry Type' : null,
					    									decoration : InputDecoration(
					    										labelText : 'Enquiry Type',
					    										hintText : 'Select Enquiry Type',
					    									),
					    									isDense : true,
					    									autovalidate : _autoValidate,
					    									items : enquiryTypeMenuItems,
					    									onChanged : (v){
					    										 FocusManager.instance.primaryFocus.unfocus();
						    									setState((){
						    										enquiryValue = v;
						    									});
					    									},
					    									value : enquiryValue == '' ? null : enquiryValue,
					    								),
					    							),
					    						),


					    						Padding(
					    							padding : const EdgeInsets.only(top : 20.0),
					    							child : DropdownButtonHideUnderline(
					    								child : DropdownButtonFormField<String>(
					    									validator : (v) => v == null ? 'Please Select Client' : null,
					    									decoration : InputDecoration(
					    										labelText : 'Client',
					    										hintText : 'Select Client',
					    									),
					    									isDense : true,
					    									autovalidate : _autoValidate,
					    									items : clientMenuItems,
					    									onChanged : (v){
					    										FocusManager.instance.primaryFocus.unfocus();
						    									setState((){
						    										clientValue = v;
						    									});
					    									},
					    									value : clientValue == '' ? null : clientValue,
					    								),
					    							),
					    						),

					    						

					    						Padding(
					    							padding : const EdgeInsets.only(top : 20.0),
					    							child : DropdownButtonHideUnderline(
					    								child : DropdownButtonFormField<String>(
					    									validator : (v) => v == null ? 'Please Select Status' : null,
					    									decoration : InputDecoration(
					    										labelText : 'Status',
					    										hintText : 'Select Status',
					    									),
					    									isDense : true,
					    									autovalidate : _autoValidate,
					    									items : statusMenuItems,
					    									onChanged : (v){
					    										FocusManager.instance.primaryFocus.unfocus();
						    									setState((){
						    										statusValue = v;
						    									});
					    									},
					    									value : statusValue == '' ? null : statusValue,
					    								),
					    							),
					    						),

					    						

					    						Padding(
					    							padding : const EdgeInsets.only(top : 20.0),
					    							child : DropdownButtonHideUnderline(
					    								child : DropdownButtonFormField<String>(
					    									validator : (v) => v == null ? 'Please Select Priority' : null,
					    									decoration : InputDecoration(
					    										labelText : 'Priority',
					    										hintText : 'Select Priority',
					    									),
					    									isDense : true,
					    									autovalidate : _autoValidate,
					    									items : priorityMenuItems,
					    									onChanged : (v){
					    										FocusManager.instance.primaryFocus.unfocus();
						    									setState((){
						    										priorityValue = v;
						    									});
					    									},
					    									value : priorityValue == '' ? null : priorityValue,
					    								),
					    							),
					    						),

					    						
					    						
					    						
					    						Container(
					    							height : 60.0,
					    						),
					    						Align(
					    							alignment: Alignment.bottomRight,
					    						child : RaisedButton(
												    onPressed: () {
												    	FocusManager.instance.primaryFocus.unfocus();
												    	FormState form = _formKey.currentState;
												    	if(form.validate())
												    	{
											    			setState((){
											    				firstIcon = Icon(Icons.check_circle);
											    				completed[0]=true;
											    			});
												    		
												    		tabController.animateTo(1);
												    		
												    	}
												    	else
												    	{
												    		
												    		setState((){
												    			_autoValidate = true;
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
												          Container(width : 10.0),
												          Icon(
												            Icons.arrow_forward,
												            color: Colors.white,
												          ),
												          
												        ],
												      ),
												    ),
												    )
					    						),

					    						
					    						
					    					],
					    				),
					    			),
					  			);	//AddComapnyAddress(), 
									        }
									      }
									    ),
										
								
								Container(
						    			margin: const EdgeInsets.all(15.0),
						    			padding: const EdgeInsets.all(10.0),
						    			decoration: myBoxDecoration(), 
						    			child: Form(
						    			key : _formKey2,
						    			autovalidate : _autoValidate2,
						    				child : ListView(
						    					children : <Widget>[
						    						Center(
						    							child : Text(
						    								"Enquiry Address",
						    								style : TextStyle(
						    									fontSize : 25.0,
						    									fontWeight : FontWeight.bold,
						    								),
						    								),
						    						),

						    						Padding(
						    						padding : const EdgeInsets.only(top : 20.0),
						    						child : TextFormField(
						    							controller : addressLine1,
						    							decoration : InputDecoration(
						    								//errorStyle : TextStyle(color : Colors.black),
						    								labelText : "Address Line 1",
						    								hintText : "Enter address line 1",
						    								border : OutlineInputBorder(borderSide :BorderSide(color : Colors.black)),
						    								focusedBorder: OutlineInputBorder(
						              							borderRadius: BorderRadius.all(Radius.circular(5.0)),	
						              							borderSide: BorderSide(color: Theme.of(context).primaryColor),
						    								),
						    								),
						    							validator: (val) => val.isEmpty ? 'Address line 1 is required' : null,
						    						)),
						    						Padding(
						    						padding : const EdgeInsets.only(top : 20.0),
						    						child : TextFormField(
						    							controller : addressLine2,
						    							decoration : InputDecoration(
						    								//errorStyle : TextStyle(color : Colors.black),
						    								labelText : "Address Line 2",
						    								hintText : "Enter address Line 2 ",
						    								border : OutlineInputBorder(),
						    								focusedBorder: OutlineInputBorder(
						              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
						              							borderSide: BorderSide(color: Theme.of(context).primaryColor),
						    								),
						    								),
						    							validator: (val) => val.isEmpty ? 'address Line 2 is required' : null,
						    						)),
						    						Padding(
						    						padding : const EdgeInsets.only(top : 20.0),
						    						child : TextFormField(
						    							controller : addressLine3,
						    							decoration : InputDecoration(
						    								//errorStyle : TextStyle(color : Colors.black),
						    								labelText : "Address Line 3",
						    								hintText : "Enter address Line 3 ",
						    								border : OutlineInputBorder(),
						    								focusedBorder: OutlineInputBorder(
						              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
						              							borderSide: BorderSide(color: Theme.of(context).primaryColor),
						    								),
						    								),
						    							validator: (val) => val.isEmpty ? 'address Line 3 is required' : null,
						    						)),
						    						Padding(
						    						padding : const EdgeInsets.only(top : 20.0),
						    						child : TextFormField(
						    							controller : pincode,
						    							decoration : InputDecoration(
						    								//errorStyle : TextStyle(color : Colors.black),
						    								labelText : "Pincode",
						    								hintText : "Enter pincode ",
						    								border : OutlineInputBorder(),
						    								focusedBorder: OutlineInputBorder(
						              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
						              							borderSide: BorderSide(color: Theme.of(context).primaryColor),
						    								),
						    								),
						    							keyboardType: TextInputType.phone,
											              inputFormatters: [
											                LengthLimitingTextInputFormatter(6),
											                WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
											              ],
						    							validator: (val) => val.isEmpty ? 'Pincode is required' : null,
						    						)),
						    								


						    								FutureBuilder(
						    									future : getLocationData(),
						    									builder : (c,s){
						    										if(s.data==null){
						    											return Center(
						    												child : CircularProgressIndicator(),
						    											);
						    										}
						    										else{
						    											return StatefulBuilder(
						    												

																			builder : (c,st){
																				
																				//print('hi $stateMenuItems');
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
																									autovalidate : _autoValidate2,
																									items : s.data,
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
																								autovalidate : _autoValidate2,
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
																								autovalidate : _autoValidate2,
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
																								autovalidate : _autoValidate2,
																								isDense : true,
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
						    											);
						    										}
						    									}
						    								

						    								
						    							
						    						),
						    						Container(
						    							height : 60.0,
						    						),
						    						Align(
						    							alignment: Alignment.bottomRight,
						    						child : RaisedButton(
													    onPressed: () {
													    	FormState form = _formKey2.currentState;
													    	if(form.validate())
													    	{
													    		_formKey2.currentState.save();
												    		
												    			setState((){secondIcon = Icon(Icons.check_circle);completed[1]=true;});
												    		
												    			tabController.animateTo(2);
													    		
													    	}
													    	else
													    	{
													    		setState((){
												    				_autoValidate2 = true;
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
													          Container(width : 10.0),
													          Icon(
													            Icons.arrow_forward,
													            color: Colors.white,
													          ),
													          
													        ],
													      ),
													    ),
													    )),

						    						
						    						
						    					],
						    				),
						    			),
						  			),//AddCompanyRegionArea(),
						
									
									
									
									FutureBuilder(
										future : getProducts(),
										builder : (c,s){
											if(s.data==null){
												return Center(
													child : CircularProgressIndicator(),
												);
											}
											else{
												return Container(
										    			margin: const EdgeInsets.all(15.0),
										    			padding: const EdgeInsets.all(10.0),
										    			decoration: myBoxDecoration(), 
										    			child: Form(
										    			key : _formKey3,
										    			autovalidate : _autoValidate3,
										    				child : ListView(
										    					children : <Widget>[
										    						Center(
										    							child : Text(
										    								"Product And Time",
										    								style : TextStyle(
										    									fontSize : 25.0,
										    									fontWeight : FontWeight.bold,
										    								),
										    								),
										    						),
										    						// Padding(
										    						// 	padding : const EdgeInsets.only(top : 20.0),
										    						// 	child : TextFormField(
										    						// 		enabled : false,
										    						// 		decoration : InputDecoration(
										    						// 			labelText : 'Company Name',
										    						// 		),
										    						// 		controller : companyName,
										    						// 	),
										    						// ),
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
										    							padding : const EdgeInsets.only(top : 20.0),
										    							child : MultiSelectFormField(
										    								//fillColor : Colors.green,
										    								autovalidate: false,
										    								titleText: 'Products',
										    								validator: (value) {
														                    if (value == null || value.length == 0) {
														                      return 'Please select one or more options';
														                    }
														                    return null;
														                  	},
														                  	dataSource : productMenuItems.map((s){
														                         return {'display': '$s', 'value': s};
														                    }).toList(),
														                    textField: 'display',
														                    valueField: 'value',
														                    okButtonLabel: 'OK',
														                    cancelButtonLabel: 'CANCEL',
														                    hintText: 'Please choose one or more',
														                    onSaved : (value){
														                    	//print('value = $value');
														                    	setState((){
														                    		selectedProducts = value;
														                    	});
														                    }
										    							),
										    						),
										    						Row(children: <Widget>[
																		    new Expanded(
																		        child: new TextFormField(
																		      decoration: new InputDecoration(
																		        icon: const Icon(Icons.calendar_today),
																		        hintText: 'Enter Start Date',
																		        labelText: 'Start date',
																		      ),
																		      controller: startDate,
																		      keyboardType: TextInputType.datetime,
																		      validator: (val) => isValidStartDate(val) ? null : 'Not a valid date',
																		      //onSaved: (val) => newEnquiry.dob=convertToDate(val),
																		    )),
																		    new IconButton(
																		      icon: new Icon(Icons.more_horiz),
																		      tooltip: 'Choose date',
																		      onPressed: (() {
																		       chooseStartDate(context);
																		      }),
																		    )
																		  ]
														          ),


										    						Row(children: <Widget>[
																		    new Expanded(
																		        child: new TextFormField(
																		      decoration: new InputDecoration(
																		        icon: const Icon(Icons.calendar_today),
																		        hintText: 'Enter End Date',
																		        labelText: 'End date',
																		      ),
																		      controller: endDate,
																		      keyboardType: TextInputType.datetime,
																		      validator: (val) => isValidEndDate(val) ? null : 'Not a valid date',
																		      //onSaved: (val) => newEnquiry.dob=convertToDate(val),
																		    )),
																		    new IconButton(
																		      icon: new Icon(Icons.more_horiz),
																		      tooltip: 'Choose date',
																		      onPressed: (() {
																		       chooseEndDate(context);
																		      }),
																		    )
																		  ]
														          ),
										    						
										    						Container(
										    							height : 60.0,
										    						),
										    						Align(
										    							alignment: Alignment.bottomRight,
										    						child : RaisedButton(
																	    onPressed: () {
																	    	FormState form = _formKey3.currentState;
																	    	if(form.validate())
																	    	{
																	    			
																	    				setState((){
																	    			thirdIcon = Icon(Icons.check_circle);
																	    			//print("name = ${firstIcon}");
																	    			completed[2]=true;
																	    			//print(completed.toString());
																	    			for(int i=0;i<completed.length;i++)
																	    			{
																	    				if(!completed[i])
																	    				{
																	    					int ii=i+1;
																	    					String ii2=ii.toString();
																	    					if(page == ''){
																	    						page = page+ii2;
																	    					}
																	    					else{
																	    						page = page+' , '+ii2;	
																	    					}
																	    					
																	    					index=false;
																	    				}
																	    			}
																	    			if(index)
																	    			{
																	    				//print("Add data");
																	    				addData();
																	    			}
																	    			else
																	    			{
																	    				showMessage("Looks like some fields are missing please review page no. ${page}",Theme.of(context).primaryColor);
																	    				page="";
																	    				index =true;
																	    			}
																	    			});		
																	    			
																	    		
																	    			
																	    		
																	    		
																	    		
																	    		//tabController.animateTo(4);
																	    		
																	    	}
																	    	else
																	    	{
																	    		
																	    		setState((){
																	    			_autoValidate3 = true;
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
																	          Container(width : 10.0),
																	          Icon(
																	            Icons.arrow_forward,
																	            color: Colors.white,
																	          ),
																	          
																	        ],
																	      ),
																	    ),
																	    )),

										    						
										    						
										    					],
										    				),
										    			),
										  			);
											}
										}
									),
				

											
				],
			),
		);
	}	
}