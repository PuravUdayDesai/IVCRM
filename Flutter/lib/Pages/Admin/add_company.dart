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

class AddCompany extends StatefulWidget{
	@override
	_AddCompanyState createState()=> _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> with SingleTickerProviderStateMixin {

	bool autoValidate = false;
	bool autoValidate2 = false;
	bool autoValidate3 = false;
	bool autoValidate4 = false;
	bool autoValidate5 = false;
	bool autoValidate6 = false;
	bool autoValidate7 = false;	
	bool getCountryData = true;
	bool getBranchData = true;
	bool getPositionData = true;
	bool isLoading = false;
	LatLng _center;

	TabController tabController;
	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey6 = GlobalKey<FormState>();
	GlobalKey<FormState> _formKey7 = GlobalKey<FormState>();

	TextEditingController companyCode = TextEditingController();
	TextEditingController companyName = TextEditingController();
	TextEditingController ownerContactId = TextEditingController();

	TextEditingController addressLine1 = TextEditingController();
	TextEditingController addressLine2 = TextEditingController();
	TextEditingController addressLine3 = TextEditingController();
	TextEditingController pincode = TextEditingController();

	TextEditingController regionCode= TextEditingController();
	TextEditingController regionName= TextEditingController();
	TextEditingController regionDescription= TextEditingController();
	TextEditingController areaCode= TextEditingController();
	TextEditingController areaName= TextEditingController();
	TextEditingController areaDescription= TextEditingController();

	TextEditingController branchName= TextEditingController();
	TextEditingController branchCode= TextEditingController();
	TextEditingController companyBranchTypeName= TextEditingController();
  	TextEditingController companyBranchPosition= TextEditingController();

  	TextEditingController executiveName= TextEditingController();
	TextEditingController loginId= TextEditingController();
	TextEditingController password= TextEditingController();
	TextEditingController contactNumber= TextEditingController();
	TextEditingController positionName = TextEditingController();
	TextEditingController positionPriority = TextEditingController();

  	bool newBranchType = false;
  	bool newPosition = false;

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);
	Icon thirdIcon = Icon(Icons.filter_3);
	Icon fourthIcon = Icon(Icons.filter_4);
	Icon fifthIcon = Icon(Icons.filter_5);

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];
 	List<DropdownMenuItem<int>> areaMenuItems = [];
 	List<DropdownMenuItem<int>> companyBranchTypesMenuItems = [];
 	List<DropdownMenuItem<int>> positionMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;
 	int areaValue = -1;
 	int companyBranchValue = -1;
 	int positionValue = -1;

 	bool stateAvail = false;
	bool cityAvail = false;
	bool areaAvail = false;
	bool companyBranchAvail = true;
	bool positionAvail = true;

	List<bool> company = [false,true,false,false];//[C,R,U,D]
	List<bool> companyBranch = [false,true,false,false];
	List<bool> companyExecutive = [false,true,false,false];
	List<bool> client = [false,true,false,false];
	List<bool> product = [false,true,false,false];
	List<bool> location = [false,true,false,false];
	List<bool> enquiry = [true,true,true,true];
	List<bool> ticket = [false,true,false,false];
	List<bool> position = [false,true,false,false];
	List<bool> completed = [false,false,false,false,false];

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

	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
	}
	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}


	Future<String> getCompanyBranches() async{
		if(getBranchData){
			getBranchData = false;
			
			var response2 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH_TYPE);
		    companyBranchTypesMenuItems.clear();
		    if(response2!='nothing'){
		    	for(int i=0;i<response2.length;i++){
			    	//companyBranchTypesMapping[response2[i]['companyBranchTypeId']] = response2[i]['companyBranchTypeName'];
			    	companyBranchTypesMenuItems.add(
			    		DropdownMenuItem<int>(
			    			value : response2[i]['companyBranchTypeId'],
			    			child : Text(response2[i]['companyBranchTypeName'])
			    		),
			    	);
		    	}	
		    }
		    companyBranchTypesMenuItems.add(
	    		DropdownMenuItem<int>(
	    			value : -99,
	    			child : Text('Add New'),
	    		),
	    	);
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
		    positionMenuItems.add(
	    		DropdownMenuItem<int>(
	    			value : -99,
	    			child : Text('Add New'),
	    		),
	    	);
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

	bool checkPositionPriority(String value){
		try{
			int a = int.parse(value);
			bool b = a>=2&&a<=25 ? true : false;
			return b;
		}
		catch(e){
			return false;
		}
	}

	String createString(List<bool> values){
		String temp='';
		if(values[0]){
			temp='C';
		}
		if(values[1]){
			temp = temp + 'R';
		}
		if(values[2]){
			temp = temp + 'U';
		}
		if(values[3]){
			temp = temp + 'D';
		}
		return temp;
	}

	addData()async{
		String createdOn = DateTime.now().toString().substring(0,19);
		setState((){
			isLoading = true;
		});
		if(newBranchType && newPosition){
			String companyString = createString(company);
			String companyBranchString = createString(companyBranch);
			String companyExecutiveString = createString(companyExecutive);
			String clientString = createString(client);
			String productString = createString(product);
			String locationString = createString(location);
			String enquiryString = createString(enquiry);
			String ticketString = createString(ticket);
			String positionString = createString(position);
			

			CompanyClass c1 = CompanyClass.toPostWithNewPositionAndCompanyBranchType(
				addressLine1.text,
				addressLine2.text,
				addressLine3.text,
				pincode.text,
				cityValue,//city id
				stateValue,//state id
				countryValue,//country id
				_center.latitude.toString(),
	            _center.longitude.toString(),//longitude
	            companyCode.text,
				companyName.text,
				CurrentUser.id,
				regionName.text,
				regionCode.text,
				regionDescription.text,
				areaName.text,
				areaCode.text,
				areaDescription.text,
				branchName.text,
				branchCode.text,
				companyBranchTypeName.text,
				int.parse(companyBranchPosition.text),
				executiveName.text,
				loginId.text,
				password.text,
				contactNumber.text,
				positionName.text,
				int.parse(positionPriority.text),
				companyString,
				companyBranchString,
				companyExecutiveString,
				clientString,
				productString,
				locationString,
				enquiryString,
				ticketString,
				positionString,
				createdOn,
				CurrentUser.id,
				27,//device type

			);
			var c2 = await ApiCall.createRecord(Uri.GET_COMPANY+"/companyBranchTypeAndExecutivePosition",c1.toMapWithNewPositionAndCompanyBranchType());
		}
		else if(newBranchType){
			CompanyClass c1 = CompanyClass.toPostWithNewCompanyBranchType(
				addressLine1.text,
				addressLine2.text,
				addressLine3.text,
				pincode.text,
				cityValue,//city id
				stateValue,//state id
				countryValue,//country id
				_center.latitude.toString(),
	            _center.longitude.toString(),
	            companyCode.text,
				companyName.text,
				int.parse(ownerContactId.text),
				regionName.text,
				regionCode.text,
				regionDescription.text,
				areaName.text,
				areaCode.text,
				areaDescription.text,
				branchName.text,
				branchCode.text,
				companyBranchTypeName.text,
				int.parse(companyBranchPosition.text),
				executiveName.text,
				loginId.text,
				password.text,
				contactNumber.text,
				createdOn,
				CurrentUser.id,
				positionValue,
			);
			var c2 = await ApiCall.createRecord(Uri.GET_COMPANY+"/companyBranchType",c1.toMapWithNewCompanyBranchType());
		}
		else if(newPosition){
			String companyString = createString(company);
			String companyBranchString = createString(companyBranch);
			String companyExecutiveString = createString(companyExecutive);
			String clientString = createString(client);
			String productString = createString(product);
			String locationString = createString(location);
			String enquiryString = createString(enquiry);
			String ticketString = createString(ticket);
			String positionString = createString(position);

			CompanyClass c1 = CompanyClass.toPostWithNewPosition(
				addressLine1.text,
				addressLine2.text,
				addressLine3.text,
				pincode.text,
				cityValue,//city id
				stateValue,//state id
				countryValue,//country id
				_center.latitude.toString(),
	            _center.longitude.toString(),
	            companyCode.text,
				companyName.text,
				int.parse(ownerContactId.text),
				regionName.text,
				regionCode.text,
				regionDescription.text,
				areaName.text,
				areaCode.text,
				areaDescription.text,
				branchName.text,
				branchCode.text,
				companyBranchValue,
				executiveName.text,
				loginId.text,
				password.text,
				contactNumber.text,
				positionName.text,
				int.parse(positionPriority.text),
				companyString,
				companyBranchString,
				companyExecutiveString,
				clientString,
				productString,
				locationString,
				enquiryString,
				ticketString,
				positionString,
				createdOn,
				CurrentUser.id,
				1,//device type
			);

			var c2 = await ApiCall.createRecord(Uri.GET_COMPANY,c1.toMapWithNewPosition());
		}	
		else{
			CompanyClass c1 = CompanyClass.toPost(
				addressLine1.text,
				addressLine2.text,
				addressLine3.text,
				pincode.text,
				cityValue,//city id
				stateValue,//state id
				countryValue,//country id
				_center.latitude.toString(),
	            _center.longitude.toString(),
	            companyCode.text,
				companyName.text,
				int.parse(ownerContactId.text),
				regionName.text,
				regionCode.text,
				regionDescription.text,
				areaName.text,
				areaCode.text,
				areaDescription.text,
				branchName.text,
				branchCode.text,
				companyBranchValue,
				executiveName.text,
				loginId.text,
				password.text,
				contactNumber.text,
				createdOn,
				CurrentUser.id,
				positionValue
			);

			var c2 = await ApiCall.createRecord(Uri.GET_COMPANY,c1.toMap3());
		}
		setState((){
			isLoading = false;
		});
		Navigator.pop(context,true);
	}

	addPositionData(){
		setState((){
			newPosition = true;
			
			positionMenuItems.add(
				DropdownMenuItem<int>(
					value : -98,
					child : Text(positionName.text)
				)
			);
			positionAvail = false;
			positionValue = -98;
		});	
	}

	Future<bool> addNewPosition(){
		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c1){
				return StatefulBuilder(
					builder : (c,st){
						return Dialog(
							shape : RoundedRectangleBorder(
								borderRadius : BorderRadius.circular(8.0),
							),
							child : Container(
								width : 250.0,
								constraints : BoxConstraints(
									maxHeight : 350.0,
								),
								child : Stack(
									children : <Widget>[
										ListView(
											padding : const EdgeInsets.all(16.0),
											children : <Widget>[
												Center(
													child : Text(
														'Add new position',
														textScaleFactor : 2.0,
														style : TextStyle(
															color : Theme.of(context).primaryColor,
														),
													),
												),
												Form(
													key : _formKey7,
													autovalidate : autoValidate7,
													child : Column(
														children : <Widget>[
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : positionName,
																	decoration : InputDecoration(
																		labelText : 'Position Name',
																		hintText : 'Enter Position Name',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter Position Name.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : positionPriority,
																	decoration : InputDecoration(
																		labelText : 'Priority',
																		hintText : 'Enter Position Priority',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => checkPositionPriority(v) ? null : 'Position Priority should be between 1 to 25',
																),
															),
															ExpansionTile(
														        title : Text('Company'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : company[0],
														                onChanged : (bool value){
														                	st((){company[0] = !company[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : company[2],
														                onChanged : (bool value){
														                	st((){company[2] = !company[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : company[1],
														                onChanged : (bool value){
														                	//st((){company[1] = !company[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : company[3],
														                onChanged : (bool value){
														                	st((){company[3] = !company[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Company Branch'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : companyBranch[0],
														                onChanged : (bool value){
														                	st((){companyBranch[0] = !companyBranch[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : companyBranch[2],
														                onChanged : (bool value){
														                	st((){companyBranch[2] = !companyBranch[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : companyBranch[1],
														                onChanged : (bool value){
														                	//st((){companyBranch[1] = !companyBranch[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : companyBranch[3],
														                onChanged : (bool value){
														                	st((){companyBranch[3] = !companyBranch[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Company Executive'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : companyExecutive[0],
														                onChanged : (bool value){
														                	st((){companyExecutive[0] = !companyExecutive[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : companyExecutive[2],
														                onChanged : (bool value){
														                	st((){companyExecutive[2] = !companyExecutive[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : companyExecutive[1],
														                onChanged : (bool value){
														                	//st((){companyExecutive[1] = !companyExecutive[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : companyExecutive[3],
														                onChanged : (bool value){
														                	st((){companyExecutive[3] = !companyExecutive[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Client'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : client[0],
														                onChanged : (bool value){
														                	st((){client[0] = !client[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : client[2],
														                onChanged : (bool value){
														                	st((){client[2] = !client[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : client[1],
														                onChanged : (bool value){
														                	//st((){client[1] = !client[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : client[3],
														                onChanged : (bool value){
														                	st((){client[3] = !client[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Product'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : product[0],
														                onChanged : (bool value){
														                	st((){product[0] = !product[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : product[2],
														                onChanged : (bool value){
														                	st((){product[2] = !product[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : product[1],
														                onChanged : (bool value){
														                	//st((){product[1] = !product[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : product[3],
														                onChanged : (bool value){
														                	st((){product[3] = !product[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Location'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : location[0],
														                onChanged : (bool value){
														                	st((){location[0] = !location[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : location[2],
														                onChanged : (bool value){
														                	st((){location[2] = !location[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : location[1],
														                onChanged : (bool value){
														                	//st((){location[1] = !location[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : location[3],
														                onChanged : (bool value){
														                	st((){location[3] = !location[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Enquiry'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : enquiry[0],
														                onChanged : (bool value){
														                	st((){enquiry[0] = !enquiry[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : enquiry[2],
														                onChanged : (bool value){
														                	st((){enquiry[2] = !enquiry[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : enquiry[1],
														                onChanged : (bool value){
														                	//st((){enquiry[1] = !enquiry[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : enquiry[3],
														                onChanged : (bool value){
														                	st((){enquiry[3] = !enquiry[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Ticket'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : ticket[0],
														                onChanged : (bool value){
														                	st((){ticket[0] = !ticket[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : ticket[2],
														                onChanged : (bool value){
														                	st((){ticket[2] = !ticket[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : ticket[1],
														                onChanged : (bool value){
														                	//st((){ticket[1] = !ticket[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : ticket[3],
														                onChanged : (bool value){
														                	st((){ticket[3] = !ticket[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    ExpansionTile(
														        title : Text('Position'),
														        children : <Widget>[
														          Row(
														            children : <Widget>[
														            
														              
														              Checkbox(
														                value : position[0],
														                onChanged : (bool value){
														                	st((){position[0] = !position[0];});
														                }
														              ),
														              Text('Create'),
														              SizedBox(width : 50.0),
														              Checkbox(
														              	value : position[2],
														                onChanged : (bool value){
														                	st((){position[2] = !position[2];});
														                }
														              ),
														              Text('Update'),
														              
														            ]
														          ),
														          Row(
														            children : <Widget>[
														              
														              Checkbox(
														                value : position[1],
														                onChanged : (bool value){
														                	//st((){position[1] = !position[1];});
														                }
														              ),
														              Text('Read'),
														              SizedBox(width : 58.0),
														              Checkbox(
														                value : position[3],
														                onChanged : (bool value){
														                	st((){position[3] = !position[3];});
														                }
														              ),
														              Text('Delete'),
														              
														            ]
														          ),
														        ]
														    ),
														    SizedBox(height : 20.0),
															InkWell(
									                  			onTap : (){
									                  				
									                  				if(_formKey7.currentState.validate()){
									                  					Navigator.of(c).pop();
									                  					addPositionData();
									                  				}
									                  				else{
									                  					st((){
									                  						autoValidate7 = true;
									                  					});
									                  				}
									                  			},
									                  			child : Container(
									                  				height : 50.0,
									                  				width : 175.0,
									                  				decoration : BoxDecoration(
									                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
									                  					color : Theme.of(context).accentColor,
									                  				),
									                  				alignment : Alignment.center,
									                  				child : Text('Add',textScaleFactor : 1.5,
									                  					style : TextStyle(
									                  						color : Colors.white,
									                  					),
									                  				),
									                  			),
									                  		),
														]
													),
												),
											]
										),
										Positioned(
								        	right : -5.0,
								        	top : -5.0,
								        	child : IconButton(
								        		icon : Icon(Icons.clear),
								        		onPressed : (){
								        			Navigator.of(c).pop();
								        			setState((){
								        				autoValidate7= false;
								        				company = [false,true,false,false];//[C,R,U,D]
														companyBranch = [false,true,false,false];
														companyExecutive = [false,true,false,false];
														client = [false,true,false,false];
														product = [false,true,false,false];
														location = [false,true,false,false];
														enquiry = [false,true,false,false];
														ticket = [false,true,false,false];
														position = [false,true,false,false];
								        			});
								        		}
								        	),
								        ),
									]
								),
							),
						);
					}
				);
			}
		);
	}

	addCompanyBranchTypeData(){
		setState((){
			newBranchType = true;
			companyBranchTypesMenuItems.clear();
			companyBranchTypesMenuItems.add(
				DropdownMenuItem<int>(
					value : -98,
					child : Text(companyBranchTypeName.text)
				)
			);
			companyBranchAvail = false;
			companyBranchValue = -98;
		});	
	}
	

	Future<bool> addCompanyBranchType(){
		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c1){
				return StatefulBuilder(
					builder : (c,st){
						return Dialog(
							shape : RoundedRectangleBorder(
								borderRadius : BorderRadius.circular(8.0),
							),
							child : Container(
								width : 250.0,
								constraints : BoxConstraints(
									maxHeight : 350.0,
								),
								child : Stack(
									children : <Widget>[
										ListView(
											padding : const EdgeInsets.all(16.0),
											children : <Widget>[
												Center(
													child : Text(
														'Add company branch type',
														textScaleFactor : 2.0,
														style : TextStyle(
															color : Theme.of(context).primaryColor,
														),
													),
												),
												Form(
													key : _formKey6,
													autovalidate : autoValidate6,
													child : Column(
														children : <Widget>[
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : companyBranchTypeName,
																	decoration : InputDecoration(
																		labelText : 'Name',
																		hintText : 'Enter name of company branch type.',
																		border : OutlineInputBorder(),
																	),
																	validator : (v) => v.isEmpty ? 'Please enter name of company branch type.' : null,
																),
															),
															Padding(
																padding : const EdgeInsets.only(top : 20.0),
																child : TextFormField(
																	controller : companyBranchPosition,
																	decoration : InputDecoration(
																		labelText : 'Position',
																		hintText : 'Enter branch position of company branch.',
																		border : OutlineInputBorder(),
																	),
																	//validator : (v) => v.isEmpty ? 'Please enter branch position of company branch.' : null,
																	validator : (v){
																		try{
																			int a= int.parse(v);
																			return null;
																		}
																		catch(e){
																			return 'Please enter numeric value';
																		}
																	}
																),
															),
															SizedBox(height : 20.0),
															InkWell(
									                  			onTap : (){
									                  				
									                  				if(_formKey6.currentState.validate()){
									                  					addCompanyBranchTypeData();
									                  					Navigator.of(c).pop();

									                  				}
									                  				else{
									                  					st((){
									                  						autoValidate6 = true;
									                  					});
									                  				}
									                  			},
									                  			child : Container(
									                  				height : 50.0,
									                  				width : 175.0,
									                  				decoration : BoxDecoration(
									                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
									                  					color : Theme.of(context).accentColor,
									                  				),
									                  				alignment : Alignment.center,
									                  				child : Text('Add',textScaleFactor : 1.5,
									                  					style : TextStyle(
									                  						color : Colors.white,
									                  					),
									                  				),
									                  			),
									                  		),
														]
													),
												),
											]
										),
										Positioned(
								        	right : -5.0,
								        	top : -5.0,
								        	child : IconButton(
								        		icon : Icon(Icons.clear),
								        		onPressed : (){
								        			Navigator.of(c).pop();
								        			setState((){
								        				autoValidate6= false;
								        			});
								        		}
								        	),
								        ),
									]
								),
							),
						);
					}
				);
			}
		);

	}

	@override
	void initState() {
		super.initState();
		getCurrentLocation();
		tabController = TabController(vsync : this,initialIndex : 0,length : 5);
		_scaffoldKey = GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Add new company'),
				bottom : TabBar(
					controller : tabController,
					indicatorColor : Colors.white,
					tabs : <Widget>[
						Tab(icon : firstIcon),
						Tab(icon : secondIcon),
						Tab(icon : thirdIcon),
						Tab(icon : fourthIcon),
						Tab(icon : fifthIcon),
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
													'Submit (1/5) ',
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
																			'Submit (2/5) ',
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
					Container(
						margin : const EdgeInsets.all(15.0),
						padding : const EdgeInsets.all(10.0),
						decoration : boxDecoration(),
						child : Form(
							key : _formKey3,
							autovalidate : autoValidate3,
							child : ListView(
								children : <Widget>[
									Center(
										child : Text(
											'Company Region Details',
											textScaleFactor : 1.5,
											style : TextStyle(
												fontWeight : FontWeight.bold,
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : regionCode,
											decoration : InputDecoration(
												labelText : 'Region Code',
												hintText : 'Enter region code.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter region code.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : regionName,
											decoration : InputDecoration(
												labelText : 'Name',
												hintText : 'Enter region name.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter region name.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : regionDescription,
											decoration : InputDecoration(
												labelText : 'Description',
												hintText : 'Enter region description.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter region description.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : areaCode,
											decoration : InputDecoration(
												labelText : 'Area Code',
												hintText : 'Enter area code.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter area code.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : areaName,
											decoration : InputDecoration(
												labelText : 'Name',
												hintText : 'Enter area name.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter area name.' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : areaDescription,
											decoration : InputDecoration(
												labelText : 'Description',
												hintText : 'Enter area description.',
												border : OutlineInputBorder(),
											),
											validator : (v) => v.isEmpty ? 'Please enter area description.' : null,
										),
									),
									SizedBox(height : 60.0),
									Align(
		    							alignment: Alignment.bottomRight,
		    							child : RaisedButton(
										    onPressed: () {
										    	FocusManager.instance.primaryFocus.unfocus();
										    	FormState form = _formKey3.currentState;
										    	if(form.validate()){
									    			setState((){
									    				thirdIcon = Icon(Icons.check_circle);
									    				completed[2]=true;
									    			});
										    		tabController.animateTo(3);
										    	}
										    	else{
										    		setState((){
										    			autoValidate3 = true;
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
													'Submit (3/5) ',
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
					FutureBuilder(
						future : getCompanyBranches(),
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
										key : _formKey4,
										autovalidate : autoValidate4,
										child : ListView(
											children : <Widget>[
												Center(
													child : Text(
														'Company \'s branch details',
														textScaleFactor : 1.5,
														style : TextStyle(
															fontWeight : FontWeight.bold
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : branchName,
														decoration : InputDecoration(
															labelText : 'Name',
															hintText : 'Enter branch name.',
															border : OutlineInputBorder(),
														),
														validator : (v) => v.isEmpty ? 'Please enter branch name.' : null,
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : branchCode,
														decoration : InputDecoration(
															labelText : 'Branch code',
															hintText : 'Enter branch code.',
															border : OutlineInputBorder(),
														),
														validator : (v) => v.isEmpty ? 'Please enter branch code.' : null,
													),
												),
												StatefulBuilder(
													builder : (c,st){
														return DropdownButtonHideUnderline(
															child : DropdownButtonFormField<int>(
																validator : (v) => v == null ? 'Please Select any option.' : null,
																isDense : true,
																decoration : InputDecoration(
																	labelText : 'Branch type',
																	hintText : 'Select Company branch type.',
																),
																disabledHint: Text(companyBranchTypeName.text),
																autovalidate : autoValidate4,
																items : companyBranchTypesMenuItems,
																onChanged : companyBranchAvail ? (v){
																	if(v == -99){
																		addCompanyBranchType();
																	}
																	else{
																		st((){
																			companyBranchValue = v;
																		});
																	}
																} : null,
																value : companyBranchValue == -1 ? null : companyBranchValue,
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
													    	FormState form = _formKey4.currentState;
													    	if(form.validate()){
												    			setState((){
												    				fourthIcon = Icon(Icons.check_circle);
												    				completed[3]=true;
												    			});
													    		tabController.animateTo(4);
													    	}
													    	else{
													    		setState((){
													    			autoValidate4 = true;
													    			fourthIcon = Icon(Icons.error_outline);
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
																'Submit (4/5) ',
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
																			disabledHint: Text(positionName.text),
																			autovalidate : autoValidate5,
																			items : positionMenuItems,
																			onChanged : positionAvail ? (v){
																				if(v == -99){
																					addNewPosition();
																				}
																				else{
																					st((){
																						positionValue = v;
																					});
																				}
																			} : null,
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
															    				fifthIcon = Icon(Icons.check_circle);
															    				completed[4]=true;
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
																    			fifthIcon = Icon(Icons.error_outline);
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
																			'Submit (5/5) ',
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

// Padding(
// 	padding : const EdgeInsets.only(top : 20.0),
// 	child : TextFormField(
// 		controller : ,
// 		decoration : InputDecoration(
// 			labelText : '',
// 			hintText : '',
// 			border : OutlineInputBorder(),
// 		),
// 		validator : (v) => v.isEmpty ? 'Please enter .' : null,
// 	),
// ),