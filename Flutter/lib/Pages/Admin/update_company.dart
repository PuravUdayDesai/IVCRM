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
import '../../Models/Company/company_model.dart';
import '../../User/current_user.dart';

class UpdateCompany extends StatefulWidget{

	final CompanyClass obj;
	UpdateCompany(this.obj);

	_UpdateCompanyState createState ()=> _UpdateCompanyState();
}

class _UpdateCompanyState extends State<UpdateCompany> with SingleTickerProviderStateMixin{

	LatLng _center;
	bool autoValidate = false;
	bool autoValidate2 = false;
	bool isLoading = false;
	bool getCountryData = true;

	TabController tabController;
	GlobalKey<ScaffoldState> _scaffoldKey;

	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

	TextEditingController companyCode = TextEditingController();
	TextEditingController companyName = TextEditingController();
	TextEditingController ownerContactId = TextEditingController();

	TextEditingController addressLine1 = TextEditingController();
	TextEditingController addressLine2 = TextEditingController();
	TextEditingController addressLine3 = TextEditingController();
	TextEditingController pincode = TextEditingController();

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];
 	List<DropdownMenuItem<int>> areaMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;
 	int areaValue = -1;

 	bool stateAvail ;
	bool cityAvail ;
	bool areaAvail = false;

	String page = '';
	bool allIndex = true;
	List<bool> completed = [false,false];

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);


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

	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
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
			var r= await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/${widget.obj.countryId}');
			for(int i=0;i<r.length;i++){
				stateMenuItems.add(
					DropdownMenuItem<int>(
						value : r[i]['stateID'],
						child : Text(r[i]['stateName']),
					),
				);
			}
			var r1 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/${widget.obj.stateId}?ownerID=${CurrentUser.ownerId}');
			for(int i=0;i<r1.length;i++){
				cityMenuItems.add(
					DropdownMenuItem<int>(
						value : r1[i]['businessCityForCompanyID'],
						child : Text(r1[i]['businessCityForCompanyName']),
					),
				);
			}

			return 'done';
		}
		else{
			return 'done';
		}
	}

	updateData() async{

		setState((){
			isLoading = true;
		});

		String lastEditedOn = DateTime.now().toString().substring(0,19);
		String lastEditOn2 = DateTime.now().toString().substring(0,19);
		CompanyClass c1 = new CompanyClass.toPut(
		    cityValue,//city id
		    companyCode.text,
		    companyName.text,
		    widget.obj.ownerContactId,
		    true,
		    lastEditedOn,
		    CurrentUser.id,//last edit by
		    2//last edit device type
		);
		CompanyClass c3 = new CompanyClass.toPut2(
	          addressLine1.text,
	          addressLine2.text,
	          addressLine3.text,
	          pincode.text,
	          countryValue,//country id
	          stateValue,//state id
	          cityValue,//city id
	          lastEditOn2,
	          CurrentUser.id,
	          27
	    );
    	var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY+'/${widget.obj.companyId}' ,c1.toMap());
    	var c4 = await ApiCall.updateRecord(Uri.GET_COMPANY_ADDRESS+'/${widget.obj.companyAddressId}',c3.toMap2());
    	setState((){
    		isLoading = false;
    	});
    	Navigator.pop(context,true);
	}



	@override
	void initState() {
		super.initState();
		getCurrentLocation();
		tabController = TabController(vsync : this,initialIndex : 0,length : 2);
		_scaffoldKey = GlobalKey<ScaffoldState>();

		companyCode.text = widget.obj.companyCode;
		companyName.text = widget.obj.companyName;
		ownerContactId.text = widget.obj.ownerContactId.toString();
		addressLine1.text = widget.obj.addressLine1;
		addressLine2.text = widget.obj.addressLine2;
		addressLine3.text = widget.obj.addressLine3;
		pincode.text = widget.obj.pincode;

		stateAvail = true;
		cityAvail = true;

		countryValue = widget.obj.countryId;
		stateValue = widget.obj.stateId;
		cityValue = widget.obj.cityId;

	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Update company'),
				bottom : TabBar(
					controller : tabController,
					indicatorColor : Colors.white,
					tabs : <Widget>[
						Tab(icon : firstIcon),
						Tab(icon : secondIcon),
					],
				),
			),
			body : TabBarView(
				controller : tabController,
				children : <Widget>[
					Container(
						margin : const EdgeInsets.all(15.0),
						padding : const EdgeInsets.all(10.0),
						decoration : boxDecoration(),
						child : Form(
							key : _formKey,
							autovalidate : autoValidate,
							child : ListView(
								children : <Widget>[
									Center(
										child : Text(
											'Company Details',
											textScaleFactor : 1.5,
											style : TextStyle(
												fontWeight : FontWeight.bold,
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : companyCode,
											decoration : InputDecoration(
												labelText : 'Company code',
												hintText : 'Enter Company code.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter company code.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : companyName,
											decoration : InputDecoration(
												labelText : 'Name',
												hintText : 'Enter company name.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter company name.' : null,
										),
									),
									// Padding(
									// 	padding : const EdgeInsets.only(top : 20.0),
									// 	child : TextFormField(
									// 		controller : ownerContactId,
									// 		decoration : InputDecoration(
									// 			labelText : 'Conatct ID',
									// 			hintText : 'Enter Owner Contact ID.',
									// 			border : OutlineInputBorder(),
									// 		),
									// 		validator : (v) => v.isEmpty ? 'Please enter Owner Contact ID.' : null,
									// 	),
									// ),
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
													'Update (1/2) ',
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
					),
					IgnorePointer(
						ignoring : isLoading,
						child : Stack(
							children : <Widget>[
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
																			    		//tabController.animateTo(2);
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
																			    			updateData();
																			    		}
																			    		else{
																			    			showMessage('Looks like some fields are missing.Please review page $page');
																			    			allIndex = true;
																			    		}
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
																						'Update (2/2) ',
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
								isLoading ? Center(child : CircularProgressIndicator()) : Container(),
							]
						),
					),
				] 
			),
		);
	}
}