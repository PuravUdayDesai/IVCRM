//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Models/Company/company_branch_model.dart';
import 'add_company_branch.dart';
import '../../Bloc/theme.dart';



class CompanyBranch extends StatefulWidget{
	@override
	_CompanyBranchState createState ()=> _CompanyBranchState();
}

List<CompanyBranchClass> companyBranches = [];

class _CompanyBranchState extends State<CompanyBranch>{
	
	bool isLoading = false;
	bool getNewData = true;
	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	bool getCompanyData = true;
	bool autoValidate = false;

	TextEditingController companyBranchCode = TextEditingController();
	TextEditingController companyBranchName = TextEditingController();

	List<DropdownMenuItem<int>> companyRegionMenuItems = [];
 	List<DropdownMenuItem<int>> companyAreaMenuItems = [];
 	List<DropdownMenuItem<int>> companyMenuItems = [];
 	List<DropdownMenuItem<int>> companyBranchTypeMenuItems = [];
 	List<DropdownMenuItem<int>> executiveMenuItems = [];

 	int companyBranchTypeValue = -1;
 	int companyRegionValue = -1;
 	int companyAreaValue = -1;
 	int companyValue = -1;
 	int executiveValue = -1;

 	bool companyBranchTypeAvail = false;
	bool companyRegionAvail = false;
	bool companyAreaAvail = false;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCompanyBranch(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_BRANCH + "/$id");
		if(response1 == 'nothing'){
			setState((){
				isLoading = false;
			});
			showMessage('Please delete all respective company executives before deleting branch.');
		}
		else{
			setState((){
				isLoading = false;
				getNewData = true;
			});
			showMessage('Record Successfully Deleted.!');	
		}
	}

	updateData(int id,int companyBranchAddressDetailsId)async{
		setState((){
			isLoading = true;
		});
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyBranchClass c1 = CompanyBranchClass.toPut(
			companyValue,
			companyRegionValue,
			companyAreaValue,
			companyBranchName.text,
			companyBranchCode.text,
			companyBranchTypeValue,
			executiveValue,
			companyBranchAddressDetailsId,
			lastEditOn,
			3,//last edit by
			4//last edit device type
		);

		var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_BRANCH+'/$id',c1.toMapPut());
		setState((){
			isLoading = true;
			getNewData = true;
			companyBranchTypeValue = -1;
		 	companyRegionValue = -1;
		 	companyAreaValue = -1;
		 	companyValue = -1;
		 	executiveValue = -1;

		 	companyBranchTypeAvail = false;
			companyRegionAvail = false;
			companyAreaAvail = false;
		});
	}

	Future<String> getRequiredData(id) async{
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

			var response2 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_EXECUTIVE+'/branch/$id');
			executiveMenuItems.clear();
			for(int i=0;i<response2.length;i++){
				executiveMenuItems.add(
					DropdownMenuItem<int>(
						value : response2[i]['executiveId"'],
						child : Text(response2[i]['executiveName'])
					),
				);
			}

			var r= await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$companyValue');
			companyRegionMenuItems.clear();
			for(int i=0;i<r.length;i++){
				companyRegionMenuItems.add(
					DropdownMenuItem<int>(
						value : r[i]['companyRegionID'],
						child : Text(r[i]['companyRegionName']),
					),
				);
			}
			var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH_TYPE+'/$companyValue');
			companyBranchTypeMenuItems.clear();
			for(int i=0;i<r1.length;i++){
				companyBranchTypeMenuItems.add(
					DropdownMenuItem<int>(
						value : r1[i]['companyBranchTypeId'],
						child : Text(r1[i]['companyBranchTypeName']),
					),
				);
			}

			companyAreaMenuItems.clear();
			var r2 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_AREA+'/region/$companyRegionValue');
			for(int i=0;i<r2.length;i++){
				companyAreaMenuItems.add(
					DropdownMenuItem<int>(
						value : r2[i]['companyAreaID'],
						child : Text(r2[i]['companyAreaName']),
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

	Future<List<CompanyBranchClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH+'/owner/${CurrentUser.id}');

			if(companyBranches.length!=0){
			  companyBranches.clear();
			}
			if(json=="nothing"){
			  return companyBranches;
			}
			for (int i = 0; i < json.length; i++) {
				int _companyBranchAddressDetailsId = json[i]['companyBranchAddressDetailsId'];
			  String _latitude = json[i]['latitude'];
			  String _longitude = json[i]['longitude'];
			  int _companyAreaID = json[i]['companyAreaID'];
			  String _pincode = json[i]['pincode'].toString();
			  String _addressLine1 = json[i]['addressLine1'];
			  String _addressLine2 = json[i]['addressLine2'];
			  String _addressLine3 = json[i]['addressLine3'];
			  String _executiveName = json[i]['executiveName'];
			  String _contactNumber = json[i]['contactNumber'];
			  String _companyAreaCode = json[i]['companyAreaCode'];
			  String _companyAreaName = json[i]['companyAreaName'];
			  int _companyRegionID = json[i]['companyRegionID'];
			  int _companyBranchID = json[i]['companyBranchID'];
			  int _executiveId = json[i]['executiveId'];
			  bool _isActive = json[i]['isActive'];
			  String _companyCode = json[i]['companyCode'];
			  int _companyId = json[i]['companyId'];
			  String _companyName = json[i]['companyName'];
			  int _stateID = json[i]['stateID'];
			  int _countryID = json[i]['countryID'];
			  int _cityID = json[i]['cityID'];
			  String _companyBranchName = json[i]['companyBranchName'];
			  String _companyBranchCode = json[i]['companyBranchCode'];
			  int _companyBranchType = json[i]['companyBranchType'];
			  String _companyRegionCode = json[i]['companyRegionCode'];
			  String _companyRegionName = json[i]['companyRegionName'];
			  String _cityName = json[i]['cityName'];

			  CompanyBranchClass obj = new CompanyBranchClass.retrieve(
			  	_companyBranchAddressDetailsId,
			    _latitude,
			    _longitude,
			    _companyAreaID,
			    _pincode,
			    _addressLine1,
			    _addressLine2,
			    _addressLine3,
			    _executiveName,
			    _contactNumber,
			    _companyAreaCode,
			    _companyAreaName,
			    _companyRegionID,
			    _companyBranchID,
			    _executiveId,
			    _isActive,
			    _companyCode,
			    _companyId,
			    _companyName,
			    _stateID,
			    _countryID,
			    _cityID,
			    _companyBranchName,
			    _companyBranchCode,
			    _companyBranchType,
			    _companyRegionCode,
			    _companyRegionName,
			    _cityName
			    );
			  
			  companyBranches.add(obj);
			}
			return companyBranches;
		}
		else{
			return companyBranches;	
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
		            contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
		            title: Text(obj.companyBranchName),
		            subtitle: Text(obj.companyBranchCode),
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
		                                color : Theme.of(context).accentColor,
		                              )),
		                          content: Text("Are you sure want to delete?All company executives will be deleted if you continue with this operation."),
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
		                                deleteCompanyBranch(obj.companyBranchID);
		                              },
		                            ),
		                          ],
		                        );
		                      });
		                }),

		                ],
		              ),
		            onTap: () {
		              updateCompanyBranch(obj);
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
	    						Center(child : Text('Comapny Branch Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Company branch name  : "+ obj.companyBranchName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company branch code  : "+ obj.companyBranchCode),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Comapny region name : "+obj.companyRegionName.toString()),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company area name  : "+obj.companyAreaName),
									onTap: () => {},          
								),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

	updateCompanyBranch(obj){

		companyBranchCode.text = obj.companyBranchCode;
		companyBranchName.text = obj.companyBranchName;

		companyValue = obj.companyId;
		companyRegionValue = obj.companyRegionID;
		companyAreaValue = obj.companyAreaID;
		companyBranchTypeValue = obj.companyBranchType;
		executiveValue = obj.executiveId;

		companyRegionAvail = true;
		companyAreaAvail = true;
		companyBranchTypeAvail =true;

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getRequiredData(obj.companyBranchID),
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
													Form(
														key : _formKey,
														autovalidate : autoValidate,
														child :StatefulBuilder(
															builder : (c,st){
																return ListView(
																	padding : const EdgeInsets.all(16.0),
																	children : <Widget>[
																		Center(
																			child : Text(
																				'Update Company Branch',
																				textScaleFactor : 1.5,
																				style : TextStyle(
																					color : Theme.of(context).primaryColor,
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
																			// DropdownButtonHideUnderline(
																			// 	child : DropdownButtonFormField<int>(
																			// 		validator : (v){
																						
																			// 				if(v==null){
																			// 					return 'Please Select Comapny executive.';
																			// 				}
																			// 				else{
																			// 					return null;
																			// 				}
																						
																						
																			// 		},
																			// 		decoration : InputDecoration(
																			// 			//labelText : 'Company executive',
																			// 			//hintText : 'Select Company executive',
																			// 		),
																			// 		isDense : true,
																			// 		autovalidate : autoValidate,
																			// 		items : executiveMenuItems,
																			// 		onChanged :(v){
																			// 			//FocusManager.instance.primaryFocus.unfocus();
																			// 			st((){
																			// 				executiveValue = v;
																			// 			});
																			// 		},
																			// 		value : executiveValue == -1 ? null : executiveValue,

																			// 	),
																			// ),
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
																			SizedBox(height : 20.0),
													                  		InkWell(
													                  			onTap : (){
													                  				
													                  				if(_formKey.currentState.validate()){
													                  					updateData(obj.companyBranchID,obj.companyBranchAddressDetailsId);
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
													                  				width : 120.0,
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
																);
															}
														),
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
											        				autoValidate= false;
											        				companyBranchTypeValue = -1;
																 	companyRegionValue = -1;
																 	companyAreaValue = -1;
																 	companyValue = -1;
																 	executiveValue = -1;

																 	companyBranchTypeAvail = false;
																	companyRegionAvail = false;
																	companyAreaAvail = false;
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
		_scaffoldKey = GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Company Branch Details'),
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
			drawer : CustomDrawer(companyBranchSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					//addEnquiryType();
					Navigator.push(context,MaterialPageRoute(builder : (context)=>AddCompanyBranch())).then((value){
						if(value!=null){
							showMessage('Record Successfully added.!');
							setState((){
								getNewData = true;
							});
						}
					});
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
	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	bool getCompanyData = true;
	bool autoValidate = false;

	TextEditingController companyBranchCode = TextEditingController();
	TextEditingController companyBranchName = TextEditingController();

	List<DropdownMenuItem<int>> companyRegionMenuItems = [];
 	List<DropdownMenuItem<int>> companyAreaMenuItems = [];
 	List<DropdownMenuItem<int>> companyMenuItems = [];
 	List<DropdownMenuItem<int>> companyBranchTypeMenuItems = [];
 	List<DropdownMenuItem<int>> executiveMenuItems = [];

 	int companyBranchTypeValue = -1;
 	int companyRegionValue = -1;
 	int companyAreaValue = -1;
 	int companyValue = -1;
 	int executiveValue = -1;

 	bool companyBranchTypeAvail = false;
	bool companyRegionAvail = false;
	bool companyAreaAvail = false;

	updateData(int id,int companyBranchAddressDetailsId,BuildContext context)async{
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyBranchClass c1 = CompanyBranchClass.toPut(
			companyValue,
			companyRegionValue,
			companyAreaValue,
			companyBranchName.text,
			companyBranchCode.text,
			companyBranchTypeValue,
			executiveValue,
			companyBranchAddressDetailsId,
			lastEditOn,
			3,//last edit by
			4//last edit device type
		);

		var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_BRANCH+'/$id',c1.toMapPut());
		close(context,'update');
	}

	Future<String> getRequiredData(id) async{
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

			var response2 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_EXECUTIVE+'/branch/$id');
			executiveMenuItems.clear();
			for(int i=0;i<response2.length;i++){
				executiveMenuItems.add(
					DropdownMenuItem<int>(
						value : response2[i]['executiveId"'],
						child : Text(response2[i]['executiveName'])
					),
				);
			}

			var r= await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$companyValue');
			companyRegionMenuItems.clear();
			for(int i=0;i<r.length;i++){
				companyRegionMenuItems.add(
					DropdownMenuItem<int>(
						value : r[i]['companyRegionID'],
						child : Text(r[i]['companyRegionName']),
					),
				);
			}
			var r1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH_TYPE+'/$companyValue');
			companyBranchTypeMenuItems.clear();
			for(int i=0;i<r1.length;i++){
				companyBranchTypeMenuItems.add(
					DropdownMenuItem<int>(
						value : r1[i]['companyBranchTypeId'],
						child : Text(r1[i]['companyBranchTypeName']),
					),
				);
			}

			companyAreaMenuItems.clear();
			var r2 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_AREA+'/region/$companyRegionValue');
			for(int i=0;i<r2.length;i++){
				companyAreaMenuItems.add(
					DropdownMenuItem<int>(
						value : r2[i]['companyAreaID'],
						child : Text(r2[i]['companyAreaName']),
					),
				);
			}


			return 'done';
		}
		else{
			return 'done';
		}
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
	    						Center(child : Text('Comapny Branch Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Company branch name  : "+ obj.companyBranchName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company branch code  : "+ obj.companyBranchCode),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Comapny region name : "+obj.companyRegionName.toString()),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company area name  : "+obj.companyAreaName),
									onTap: () => {},          
								),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

	updateCompanyBranch(obj,context){

		companyBranchCode.text = obj.companyBranchCode;
		companyBranchName.text = obj.companyBranchName;

		companyValue = obj.companyId;
		companyRegionValue = obj.companyRegionID;
		companyAreaValue = obj.companyAreaID;
		companyBranchTypeValue = obj.companyBranchType;
		executiveValue = obj.executiveId;

		companyRegionAvail = true;
		companyAreaAvail = true;
		companyBranchTypeAvail =true;

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getRequiredData(obj.companyBranchID),
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
													Form(
														key : _formKey,
														autovalidate : autoValidate,
														child :StatefulBuilder(
															builder : (c,st){
																return ListView(
																	padding : const EdgeInsets.all(16.0),
																	children : <Widget>[
																		Center(
																			child : Text(
																				'Update Company Branch',
																				textScaleFactor : 1.5,
																				style : TextStyle(
																					color : Theme.of(context).primaryColor,
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
																			DropdownButtonHideUnderline(
																				child : DropdownButtonFormField<int>(
																					validator : (v){
																						
																							if(v==null){
																								return 'Please Select Comapny executive.';
																							}
																							else{
																								return null;
																							}
																					},
																					decoration : InputDecoration(
																						labelText : 'Company executive',
																						hintText : 'Select Company executive',
																					),
																					isDense : true,
																					autovalidate : autoValidate,
																					items : executiveMenuItems,
																					onChanged :(v){
																						print(v.toString());
																						FocusManager.instance.primaryFocus.unfocus();
																						st((){
																							executiveValue = v;
																						});
																					},
																					value : executiveValue == -1 ? null : executiveValue,

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
																			SizedBox(height : 20.0),
													                  		InkWell(
													                  			onTap : (){
													                  				
													                  				if(_formKey.currentState.validate()){
													                  					updateData(obj.companyBranchID,obj.companyBranchAddressDetailsId,context);
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
													                  				width : 120.0,
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
																);
															}
														),
													),
													Positioned(
											        	right : -5.0,
											        	top : -5.0,
											        	child : IconButton(
											        		icon : Icon(Icons.clear),
											        		onPressed : (){
											        			Navigator.of(c).pop();
											        				companyValue = -1;
											        				autoValidate= false;
											        				companyBranchTypeValue = -1;
																 	companyRegionValue = -1;
																 	companyAreaValue = -1;
																 	companyValue = -1;
																 	executiveValue = -1;

																 	companyBranchTypeAvail = false;
																	companyRegionAvail = false;
																	companyAreaAvail = false;
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

  deleteCompanyBranch(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_BRANCH + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyBranchClass> suggestionList = query.isEmpty?companyBranches:companyBranches.where((p)=>p.addressLine1.startsWith(query)||
      p.addressLine2.startsWith(query)||p.addressLine3.startsWith(query)||p.executiveName.startsWith(query)||
      p.companyAreaCode.startsWith(query)||p.companyAreaName.startsWith(query)||p.companyCode.startsWith(query)||p.companyName.startsWith(query)
      ||p.companyBranchName.startsWith(query)||p.companyBranchCode.startsWith(query)||p.companyRegionCode.startsWith(query)
      ||p.companyRegionName.startsWith(query)||p.cityName.startsWith(query)
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
                        text : suggestionList[index].companyBranchName.substring(0,query.length>=suggestionList[index].companyBranchName.length ? suggestionList[index].companyBranchName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyBranchName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].companyBranchName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyBranchCode),
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
                                    deleteCompanyBranch(suggestionList[index].companyBranchID,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateCompanyBranch(suggestionList[index],context);
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
