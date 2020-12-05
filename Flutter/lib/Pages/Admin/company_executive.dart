//default
import 'package:flutter/material.dart';
import "dart:core";
import "package:flutter/services.dart";

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Models/Company/company_executive_model.dart';
import 'user_location.dart';
import 'report.dart';
import 'call_recording.dart';
import '../../Bloc/theme.dart';






class CompanyExecutive extends StatefulWidget{
	@override
	_CompanyExecutiveState createState ()=> _CompanyExecutiveState();
}
	
List<CompanyExecutiveClass> companyExecutives = [];

class _CompanyExecutiveState extends State<CompanyExecutive>{

	bool isLoading = false;
	bool getNewData = true;
	bool getNewCompanyData = true;
	bool autoValidate = false;
	bool companyBranchAvail = false;

	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState>_formKey;
	TextEditingController executiveName;
	TextEditingController loginId;
	TextEditingController password;
	TextEditingController contactNumber;

	List<DropdownMenuItem<int>> companyMenuItems = [];
	List<DropdownMenuItem<int>> cityMenuItems = [];
	List<DropdownMenuItem<int>> companyBranchMenuItems = [];
	List<DropdownMenuItem<int>> positionMenuItems = [];

	int companyValue = -1;
	int companyBranchValue = -1;
	int cityValue = -1;
	int positionValue = -1;


	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}

	deleteExecutive(id,companyId) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_EXECUTIVE + "?companyExecutiveId=$id&companyId=$companyId");
		if(response1 == 'nothing'){
			setState((){
				isLoading = false;
			});
			showMessage('Selected Executive is a primary contact for company branch therefore operation could not be completed.');
		}
		else{
			setState((){
				isLoading = false;
				getNewData = true;
			});
			showMessage('Record Successfully Deleted.!');	
		}
		
	}

	addData() async{
		setState((){isLoading = true;});
		String createdOn = DateTime.now().toString().substring(0,19);

		CompanyExecutiveClass c1 = new CompanyExecutiveClass.toPost(
			executiveName.text,
			loginId.text,
			password.text,
			companyBranchValue,
			cityValue,
			companyValue,
			contactNumber.text,
			createdOn,
			CurrentUser.id,
			positionValue
		);
		var c2 = await ApiCall.createRecord(Uri.GET_COMPANY_EXECUTIVE,c1.toMap());
		showMessage("Comapny executive Added with name ${c1.executiveName}");
		setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		companyBranchValue = -1;
    		cityValue = -1;
    		autoValidate = false;
    	});
	}

	updateData(executiveId) async{
		setState((){isLoading = true;});

		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyExecutiveClass c1 = new CompanyExecutiveClass.toPut(
			executiveName.text,
			loginId.text,
			companyBranchValue,
			cityValue,
			companyValue,
			contactNumber.text,
			lastEditOn,
			CurrentUser.id,
			positionValue
		);
		var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_EXECUTIVE+'/$executiveId',c1.toMapPut());
		showMessage("${c1.executiveName} company executive information updated..");
		setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		companyBranchValue = -1;
    		cityValue = -1;
    		autoValidate = false;
    	});
	}

	Future<String> getCompanyData({isUpdate = false})async{
		if(getNewCompanyData){
			getNewCompanyData = false;
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

			if(isUpdate){
				var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/company/$companyValue');
				companyBranchMenuItems.clear();
				for(int i=0;i<r.length;i++){
					companyBranchMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['companyBranchID'],
							child : Text(r[i]['companyBranchName'])
						),
					);
				}	
			}
			

			var r2 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+'/${CurrentUser.id}');
			cityMenuItems.clear();
			for(int i=0;i<r2.length;i++){
				cityMenuItems.add(
					DropdownMenuItem<int>(
						value : r2[i]['businessCityForCompanyID'],
						child : Text(r2[i]['cityName'])
					),
				);
			}

			return 'done';
		}
		else{
			return 'done';
		}
	}

	refresh(context){
		return FutureBuilder(
			future : getData(),
			builder : (c,s){
				if(s.data == null){
					return Center(child : CircularProgressIndicator());
				}
				else{
					if(s.data.length == 0){
						return Center(child : Text('No Data Exists.!!'));
					}
					else{
						return IgnorePointer(
							ignoring : isLoading,
							child : Stack(
								children : <Widget>[
									ListView.builder(
										itemCount : s.data.length,
										itemBuilder : (c,i){
											return makeCard(s.data[i]);
										}
									),
									isLoading ? Center(child : CircularProgressIndicator()) : Container(),
								]
							),
						);
					}
				}
			}
		);
	}

	Future<List<CompanyExecutiveClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY_EXECUTIVE+"/owner/${CurrentUser.id}");
			if(companyExecutives.length!=0){
			  companyExecutives.clear();
			}
			if(json=="nothing"){
			  return companyExecutives;
			}
			for (int i = 0; i < json.length; i++) {
			  String _executiveId = json[i]['executiveId'];
			  String _executiveName = json[i]['executiveName'];
			  String _loginID = json[i]['loginID'];
			  String _password = json[i]['password'];
			  int _companyBranchID = json[i]['companyBranchID'];
			  String _companyBranchName = json[i]['companyBranchName'];
			  String _companyBranchCode = json[i]['companyBranchCode'];
			  int _cityID = json[i]['cityID'];
			  String _cityName = json[i]['cityName'];
			  int _companyID = json[i]['companyID'];
			  String _companyName = json[i]['companyName'];
			  String _companyCode = json[i]['companyCode'];
			  String _contactNumber = json[i]['contactNumber'];
			  bool _isActive = json[i]['isActive'];
			  int _positionId = json[i]['position'];

			  CompanyExecutiveClass obj = new CompanyExecutiveClass.retrieve(_executiveId,
			    _executiveName,_loginID,_password,_companyBranchID,_companyBranchName,_companyBranchCode,_cityID,
			    _cityName,_companyID,_companyName,_companyCode,_contactNumber,_isActive,_positionId);
			  
			  companyExecutives.add(obj);
			}
			return companyExecutives;
		}
		else{
			return companyExecutives;	
		}
	}

	Widget makeCard(var obj) {

	      return Column(
			  children: [
			    Card(
			        elevation: 7,
			        child: ListTile(
			            dense: false,
			            isThreeLine: true,
			            title: Text(obj.executiveName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
			            subtitle: Text(obj.companyBranchName+"\n"+obj.cityName+"\n"+obj.companyName),
			            trailing: Row(
			              mainAxisSize : MainAxisSize.min,
			              children : [
			                IconButton(
			                  icon : Icon(Icons.info_outline,size : 25.0,color : Colors.grey),
			                  onPressed : (){
			                    _bottomSheet(context,obj);
			                  }
			                  ),
			                IconButton(
			                icon: Icon(Icons.delete,size : 25.0,color : Colors.grey),
			                onPressed: () {
			                  showDialog(
			                      context: context,
			                      builder: (BuildContext c) {
			                        return AlertDialog(
			                          title: Text("Sure?",
			                              style: TextStyle(
			                                color: Theme.of(context).accentColor,
			                              )),
			                          content: Text("Are you sure want to delete.?"),
			                          actions: <Widget>[
			                            FlatButton(
			                              color : Theme.of(context).primaryColor,
			                              child: Text("No",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(c).pop();
			                              },
			                            ),
			                            FlatButton(
			                              child: Text("Yes",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(c)
			                                    .pop();
			                                deleteExecutive(int.parse(obj.executiveId),obj.companyID);
			                              },
			                            ),
			                          ],
			                        );
			                      });
			                }),

			                ],
			              ),
			            onTap: () {
			              updateExecutive(obj);
			            })),
			    Divider(),
			  ],
		);
	  


	}


	void _bottomSheet(context,obj){

	    showModalBottomSheet(
	    	context : context,
	    	shape : RoundedRectangleBorder(
	    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
	    	),
	    	builder : (c){
	    		return Padding(
	    			padding : const EdgeInsets.all(16.0),
	    			child : SingleChildScrollView(
	    				child : Column(
	    					children : <Widget>[	
	    						Center(child : Text('Executive Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Executive name : "+obj.executiveName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Email Id  : "+obj.loginID),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company branch name  : "+obj.companyBranchName),
									onTap: () => {},          
								),
								ListTile(
						            //leading: new Icon(Icons.videocam),
						            title: new Text("Company branch code : "+obj.companyBranchCode),
						            onTap: () => {},          
						        ),
						        ListTile(
									title: new Text("City name : "+obj.cityName),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Company name : "+obj.companyName),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Company code : "+obj.companyCode),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Contact number : "+obj.contactNumber),
									onTap: () => {},          
								),

								InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> UserLocation(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
												image:AssetImage("Assets/Images/map2.jpg"), 
												fit:BoxFit.cover
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Goto Location',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> CallRecording(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
												image:AssetImage("Assets/Images/cr3.jpg"), 
												fit:BoxFit.fitWidth
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Call Log Details',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> Report(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
												image:AssetImage("Assets/Images/statistics2.jpg"), 
												fit:BoxFit.cover
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Reports',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

	addExecutive(){

	executiveName = new TextEditingController();
    loginId = new TextEditingController();
    password = new TextEditingController();
    contactNumber = new TextEditingController();

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
											          			child : Text('Add new executive',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select city.' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'City',
																					hintText : 'Select City',
																				),
																				autovalidate : autoValidate,
																				items : cityMenuItems,
																				onChanged : (v){
																					st((){
																						cityValue = v;
																					});
																					
																				},
																				value : cityValue == -1 ? null : cityValue,
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
																					companyBranchMenuItems.clear();
																					var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/company/$v');
																					print(r1);
																					for(int i=0;i<r1.length;i++){
																						print(r1[i]['companyBranchID'].runtimeType);
																						companyBranchMenuItems.add(
																							DropdownMenuItem<int>(
																								value : r1[i]['companyBranchID'],
																								child : Text(r1[i]['companyBranchName']),
																							),
																						);
																					}
																					st((){
																					
																						
																						companyBranchAvail = true;
																						
																						companyBranchValue = -1;
																						companyValue = v;

																						
																					});
																				},
																				value : companyValue == -1 ? null : companyValue,
																			),
																		),
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v){
																					if(companyBranchAvail){
																						if(v==null){
																							return 'Please Select Comapny branch .';
																						}
																						else{
																							return null;
																						}
																					}
																					else{
																						return null;
																					}
																				},
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company Branch',
																					hintText : 'Select Company Branch',
																				),
																				autovalidate : autoValidate,
																				items : companyBranchMenuItems,
																				onChanged :companyBranchAvail ?  (v){
																					st((){
																						companyBranchValue = v;
																					});
																					
																				} : null,
																				value : companyBranchValue == -1 ? null : companyBranchValue,
											          						),
											          					),
											          					DropdownButtonHideUnderline(
																			child : DropdownButtonFormField<int>(
																				validator : (v) => v == null ? 'Please Select any option.' : null,
																				isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Position',
																					hintText : 'Select Position.',
																				),
																				autovalidate : autoValidate,
																				items : positionMenuItems,
																				onChanged : (v){
																						st((){
																							positionValue = v;
																						});
																				},
																				value : positionValue == -1 ? null : positionValue,
																			),
																		),

											          					TextFormField(
												                  			controller : executiveName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Executive Name',
												                  				labelText : 'Executive Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Executive Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : loginId,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Email ID',
												                  				labelText : 'Email ID',
												                  			),
												                  			keyboardType: TextInputType.emailAddress,
																	          validator: (value) => isValidEmail(value)
																	              ? (isEmailContains(value)
																	                  ? null
																	                  : 'Email must contain @ and .')
																	              : 'Please enter a valid email address',
												                  			//validator  : (v)=> v.isEmpty ? 'Please Enter Email ID.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : password,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter password',
												                  				labelText : 'Password',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Password.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : contactNumber,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter contact number',
												                  				labelText : 'Conatct number',
												                  			),
												                  			keyboardType: TextInputType.phone,
																			inputFormatters: [
																				LengthLimitingTextInputFormatter(10),
																				WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
																			],
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Conatct number.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					addData();
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
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
											        				companyValue = -1;
											        				cityValue = -1;
											        				companyBranchValue = -1;
											        				autoValidate= false;
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
					}
				);
			}
		);
	}

	updateExecutive(obj){

	executiveName = new TextEditingController();
    loginId = new TextEditingController();
    password = new TextEditingController();
    contactNumber = new TextEditingController();

    executiveName.text = obj.executiveName;
    loginId.text = obj.loginID;
    password.text = obj.password;
    contactNumber.text = obj.contactNumber;

    companyValue = obj.companyID;
    companyBranchValue = obj.companyBranchID;
    cityValue = obj.cityID;
    positionValue = obj.positionId;

    companyBranchAvail = true;

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(isUpdate : true),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
											          			child : Text('Update executive',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select city.' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'City',
																					hintText : 'Select City',
																				),
																				autovalidate : autoValidate,
																				items : cityMenuItems,
																				onChanged : (v){
																					st((){
																						cityValue = v;
																					});
																					
																				},
																				value : cityValue == -1 ? null : cityValue,
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
																					companyBranchMenuItems.clear();
																					var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/company/$v');
																					for(int i=0;i<r1.length;i++){
																						companyBranchMenuItems.add(
																							DropdownMenuItem<int>(
																								value : r1[i]['companyBranchID'],
																								child : Text(r1[i]['companyBranchName']),
																							),
																						);
																					}
																					st((){
																					
																						
																						companyBranchAvail = true;
																						
																						companyBranchValue = -1;
																						companyValue = v;

																						
																					});
																				},
																				value : companyValue == -1 ? null : companyValue,
																			),
																		),
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v){
																					if(companyBranchAvail){
																						if(v==null){
																							return 'Please Select Comapny branch .';
																						}
																						else{
																							return null;
																						}
																					}
																					else{
																						return null;
																					}
																				},
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company Branch',
																					hintText : 'Select Company Branch',
																				),
																				autovalidate : autoValidate,
																				items : companyBranchMenuItems,
																				onChanged :companyBranchAvail ?  (v){
																					st((){
																						companyBranchValue = v;
																					});
																					
																				} : null,
																				value : companyBranchValue == -1 ? null : companyBranchValue,
											          						),
											          					),
											          					DropdownButtonHideUnderline(
																			child : DropdownButtonFormField<int>(
																				validator : (v) => v == null ? 'Please Select any option.' : null,
																				isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Position',
																					hintText : 'Select Position.',
																				),
																				autovalidate : autoValidate,
																				items : positionMenuItems,
																				onChanged : (v){
																						st((){
																							positionValue = v;
																						});
																				},
																				value : positionValue == -1 ? null : positionValue,
																			),
																		),

											          					TextFormField(
												                  			controller : executiveName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Executive Name',
												                  				labelText : 'Executive Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Executive Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : loginId,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Email ID',
												                  				labelText : 'Email ID',
												                  			),
												                  			keyboardType: TextInputType.emailAddress,
																	          validator: (value) => isValidEmail(value)
																	              ? (isEmailContains(value)
																	                  ? null
																	                  : 'Email must contain @ and .')
																	              : 'Please enter a valid email address',
												                  			//validator  : (v)=> v.isEmpty ? 'Please Enter Email ID.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : contactNumber,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter contact number',
												                  				labelText : 'Conatct number',
												                  			),
												                  			keyboardType: TextInputType.phone,
																			inputFormatters: [
																				LengthLimitingTextInputFormatter(10),
																				WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
																			],
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Conatct number.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.executiveId);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
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
												                  				child : Text('Update',textScaleFactor : 1.5,
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
											        				companyValue = -1;
											        				cityValue = -1;
											        				companyBranchValue = -1;
											        				autoValidate= false;
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
					}
				);
			}
		);
	}


	@override
	void initState() {
		super.initState();
		_formKey = GlobalKey<FormState>();
		_scaffoldKey = GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key :_scaffoldKey,
			appBar : AppBar(
				title : Text('Company Executive Details'),
				actions : <Widget>[
		          IconButton(
		            icon : Icon(Icons.search),
		            onPressed:(){
		              showSearch(context : context , delegate : DataSearch()).then((value){
		                if(value=='delete'){
		                  showMessage('Deleted Successfully.!!');
		                  setState((){
		                  getNewData = true;
		                });
		                }
	                   if(value=='update'){
	                    showMessage('Deleted Successfully.!!');
	                    setState((){
		                  getNewData = true;
		                });
	                  }
		                
		                
		                
		               });
		              },
		          )
		        ],
			),
			drawer : CustomDrawer(companyExecutiveSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addExecutive();
				},
				shape: RoundedRectangleBorder(
            		borderRadius: BorderRadius.all(Radius.circular(16.0))
            	),
			)
		);
	}
}

class DataSearch extends SearchDelegate<String>
{

	bool isLoading = false;
	bool getNewData = true;
	bool getNewCompanyData = true;
	bool autoValidate = false;
	bool companyBranchAvail = false;

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}

	
	GlobalKey<FormState>_formKey = GlobalKey<FormState>();
	TextEditingController executiveName = TextEditingController();
	TextEditingController loginId = TextEditingController();
	TextEditingController password = TextEditingController();
	TextEditingController contactNumber = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];
	List<DropdownMenuItem<int>> cityMenuItems = [];
	List<DropdownMenuItem<int>> companyBranchMenuItems = [];
	List<DropdownMenuItem<int>> positionMenuItems = [];

	int companyValue = -1;
	int companyBranchValue = -1;
	int cityValue = -1;
	int positionValue = -1;

	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	updateData(executiveId,context) async{

		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyExecutiveClass c1 = new CompanyExecutiveClass.toPut(
			executiveName.text,
			loginId.text,
			companyBranchValue,
			cityValue,
			companyValue,
			contactNumber.text,
			lastEditOn,
			CurrentUser.id,
			positionValue
		);
		var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_EXECUTIVE+'/$executiveId',c1.toMapPut());
		close(context,'update');
	}

	Future<String> getCompanyData({isUpdate = false})async{
		if(getNewCompanyData){
			getNewCompanyData = false;
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

			if(isUpdate){
				var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/company/$companyValue');
				companyBranchMenuItems.clear();
				for(int i=0;i<r.length;i++){
					companyBranchMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['companyBranchID'],
							child : Text(r[i]['companyBranchName'])
						),
					);
				}	
			}
			

			var r2 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+'/${CurrentUser.id}');
			cityMenuItems.clear();
			for(int i=0;i<r2.length;i++){
				cityMenuItems.add(
					DropdownMenuItem<int>(
						value : r2[i]['businessCityForCompanyID'],
						child : Text(r2[i]['cityName'])
					),
				);
			}

			return 'done';
		}
		else{
			return 'done';
		}
	}

	updateExecutive(obj,context){

	executiveName = new TextEditingController();
    loginId = new TextEditingController();
    password = new TextEditingController();
    contactNumber = new TextEditingController();

    executiveName.text = obj.executiveName;
    loginId.text = obj.loginID;
    password.text = obj.password;
    contactNumber.text = obj.contactNumber;

    companyValue = obj.companyID;
    companyBranchValue = obj.companyBranchID;
    cityValue = obj.cityID;
    positionValue = obj.positionId;

    companyBranchAvail = true;

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(isUpdate : true),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
											          			child : Text('Update executive',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select city.' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'City',
																					hintText : 'Select City',
																				),
																				autovalidate : autoValidate,
																				items : cityMenuItems,
																				onChanged : (v){
																					st((){
																						cityValue = v;
																					});
																					
																				},
																				value : cityValue == -1 ? null : cityValue,
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
																					companyBranchMenuItems.clear();
																					var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/company/$v');
																					for(int i=0;i<r1.length;i++){
																						companyBranchMenuItems.add(
																							DropdownMenuItem<int>(
																								value : r1[i]['companyBranchID'],
																								child : Text(r1[i]['companyBranchName']),
																							),
																						);
																					}
																					st((){
																					
																						
																						companyBranchAvail = true;
																						
																						companyBranchValue = -1;
																						companyValue = v;

																						
																					});
																				},
																				value : companyValue == -1 ? null : companyValue,
																			),
																		),
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v){
																					if(companyBranchAvail){
																						if(v==null){
																							return 'Please Select Comapny branch .';
																						}
																						else{
																							return null;
																						}
																					}
																					else{
																						return null;
																					}
																				},
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company Branch',
																					hintText : 'Select Company Branch',
																				),
																				autovalidate : autoValidate,
																				items : companyBranchMenuItems,
																				onChanged :companyBranchAvail ?  (v){
																					st((){
																						companyBranchValue = v;
																					});
																					
																				} : null,
																				value : companyBranchValue == -1 ? null : companyBranchValue,
											          						),
											          					),

											          					DropdownButtonHideUnderline(
																			child : DropdownButtonFormField<int>(
																				validator : (v) => v == null ? 'Please Select any option.' : null,
																				isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Position',
																					hintText : 'Select Position.',
																				),
																				autovalidate : autoValidate,
																				items : positionMenuItems,
																				onChanged : (v){
																						st((){
																							positionValue = v;
																						});
																				},
																				value : positionValue == -1 ? null : positionValue,
																			),
																		),

											          					TextFormField(
												                  			controller : executiveName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Executive Name',
												                  				labelText : 'Executive Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Executive Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : loginId,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Email-ID',
												                  				labelText : 'Email ID',
												                  			),
												                  			keyboardType: TextInputType.emailAddress,
																	          validator: (value) => isValidEmail(value)
																	              ? (isEmailContains(value)
																	                  ? null
																	                  : 'Email must contain @ and .')
																	              : 'Please enter a valid email address',
												                  			//validator  : (v)=> v.isEmpty ? 'Please Enter Email ID.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : contactNumber,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter contact number',
												                  				labelText : 'Conatct number',
												                  			),
												                  			keyboardType: TextInputType.phone,
																			inputFormatters: [
																				LengthLimitingTextInputFormatter(10),
																				WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
																			],
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Conatct number.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.executiveId,context);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
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
												                  				child : Text('Update',textScaleFactor : 1.5,
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
											        				companyValue = -1;
											        				cityValue = -1;
											        				companyBranchValue = -1;
											        				autoValidate= false;
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
					}
				);
			}
		);
	}

  void _bottomSheet(context,obj){

	    showModalBottomSheet(
	    	context : context,
	    	shape : RoundedRectangleBorder(
	    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
	    	),
	    	builder : (c){
	    		return Padding(
	    			padding : const EdgeInsets.all(16.0),
	    			child : SingleChildScrollView(
	    				child : Column(
	    					children : <Widget>[	
	    						Center(child : Text('Executive Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Executive name : "+obj.executiveName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Email Id  : "+obj.loginID),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Password : "+obj.password),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company branch name  : "+obj.companyBranchName),
									onTap: () => {},          
								),
								ListTile(
						            //leading: new Icon(Icons.videocam),
						            title: new Text("Company branch code : "+obj.companyBranchCode),
						            onTap: () => {},          
						        ),
						        ListTile(
									title: new Text("City name : "+obj.cityName),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Company name : "+obj.companyName),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Company code : "+obj.companyCode),
									onTap: () => {},          
								),
								new ListTile(
									//leading: new Icon(Icons.videocam),
									title: new Text("Contact number : "+obj.contactNumber),
									onTap: () => {},          
								),

								InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> UserLocation(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
												image:AssetImage("Assets/Images/map2.jpg"), 
												fit:BoxFit.cover
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Goto Location',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> CallRecording(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
												image:AssetImage("Assets/Images/cr2.jpg"), 
												fit:BoxFit.fill
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Call Log Details',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> Report(int.parse(obj.executiveId)))
						        		);
						        	},
						        	child : Container(
						        		height : 50,
						        		width : MediaQuery.of(context).size.width * .8,
						        		decoration : BoxDecoration(
						        			border: Border.all(
								    			width : 1.0,
								    			color : Theme.of(context).accentColor,
								    		),
						        			borderRadius : BorderRadius.circular(4.0),
						        			image: DecorationImage(
						        				colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
												image:AssetImage("Assets/Images/statistics2.jpg"), 
												fit:BoxFit.cover
											)
						        		),
						        		child : Row(
						        			mainAxisAlignment : MainAxisAlignment.spaceAround,
						        			children : <Widget>[
						        				Text('Reports',textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
						        				Icon(Icons.arrow_forward),
						        			]
						        		),
						        	),
						        ),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

  @override
   ThemeData appBarTheme(BuildContext context) => Theme.of(context);
  

  List<Widget> buildActions(BuildContext context)
  {
    return [
    IconButton(icon : Icon(Icons.clear),onPressed:(){
      query="";
      })
    ];
  }

  Widget buildLeading(BuildContext context)
  {
    return IconButton(
      icon : AnimatedIcon(
          icon : AnimatedIcons.menu_arrow,
          progress : transitionAnimation,
        ),
      onPressed : (){
        close(context,null);
      }
      );
  }

  Widget buildResults(BuildContext context)
  {
    return Center(
      child : Container(
        height : 100.0,
        width : 100.0,
        child : Card(
          color : Colors.red,
          child : Center(
            child : Text(query),
          ),
        )
      ),
    );
  }

  deleteExecutive(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_EXECUTIVE + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyExecutiveClass> suggestionList = query.isEmpty?companyExecutives:companyExecutives.where((p)=>p.executiveName.startsWith(query)||
      p.loginID.startsWith(query)||p.password.startsWith(query)||p.companyBranchName.startsWith(query)||
      p.companyBranchCode.startsWith(query)||p.cityName.startsWith(query)||p.companyName.startsWith(query)||p.contactNumber.startsWith(query)
      ||p.companyCode.startsWith(query)
      ).toList();
    return ListView.builder(
      itemCount : suggestionList.length,
      itemBuilder : (context,index){
        return Column(
      children: [
        Card(
            elevation: 7,
            child: ListTile(
                dense: false,
                isThreeLine: true,
                title : Consumer<ThemeNotifier>(
                  builder : (context,data,child){
                    return RichText(
                      text : TextSpan(
                        text : suggestionList[index].executiveName.substring(0,query.length>=suggestionList[index].executiveName.length ? suggestionList[index].executiveName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].executiveName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].executiveName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyBranchName+"\n"+suggestionList[index].cityName+"\n"+suggestionList[index].companyName),
                trailing: Row(
                  mainAxisSize : MainAxisSize.min,
                  children : [
                    IconButton(
                      icon : Icon(Icons.info_outline),
                      iconSize : 30.0,
                      onPressed : (){
                        _bottomSheet(context,suggestionList[index]);
                      }
                      ),
                    IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 30.0,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext c) {
                            return AlertDialog(
                              title: Text("Sure?",
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  )),
                              content: Text("Are you sure want to delete?"),
                              actions: <Widget>[
                                FlatButton(
                                  color : Theme.of(context).primaryColor,
                                  child: Text("No",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      )),
                                  onPressed: () {
                                    Navigator.of(c).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("Yes",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      )),
                                  onPressed: () {
                                    Navigator.of(c)
                                        .pop();
                                    deleteExecutive(suggestionList[index].executiveId,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateExecutive(suggestionList[index],context);
                })),
        Divider(),
      ],
    );
      }
    );
  }
}