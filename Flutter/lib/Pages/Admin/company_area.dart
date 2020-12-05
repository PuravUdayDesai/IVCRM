//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Models/Company/company_area_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';


class CompanyArea extends StatefulWidget{
	@override
	_CompanyAreaState createState()=> _CompanyAreaState();
}
	
List<CompanyAreaClass> companyAreas = [];

class _CompanyAreaState extends State<CompanyArea>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;
	TextEditingController companyAreaName;
	TextEditingController companyAreaCode;
	TextEditingController companyAreaDescription;

	List<DropdownMenuItem<int>> companyMenuItems = [];
	List<DropdownMenuItem<int>> companyRegionMenuItems = [];

	int companyValue = -1;
	int companyRegionValue = -1;

	bool companyRegionAvail = false;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCompanyArea(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_AREA + "/$id");
		if(response1 == 'nothing'){
			setState((){
				isLoading = false;
			});
			showMessage('Selected region is prime location for some company therefore operaion could not be completed.');
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
		setState((){
			isLoading = true;
		});
		String createdOn = DateTime.now().toString().substring(0,19);

        CompanyAreaClass c1 = new CompanyAreaClass.toPost(
	        companyAreaName.text,
	        companyAreaCode.text,
	        companyAreaDescription.text,
	        companyValue,
	        companyRegionValue,
	        createdOn,
	        CurrentUser.id,
	        1
        );
    	var c2 = await ApiCall.createRecord(Uri.GET_COMPANY_AREA,c1.toMap());
    	showMessage("Comapny area Added with name ${c1.companyAreaName}");
    	setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		companyRegionValue = -1;
    		companyRegionAvail = false;
    		autoValidate = false;
    	});
	}

	updateData(companyAreaID) async{
		setState((){
			isLoading = true;
		});
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyAreaClass c1 = new CompanyAreaClass.toPut(
	        companyAreaName.text,
	        companyAreaCode.text,
	        companyAreaDescription.text,
		    companyValue,
		    companyRegionValue,
	        lastEditOn,
	        CurrentUser.id,
	        2
        );
    	var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_AREA+'/$companyAreaID',c1.toMapPut());
    	showMessage("${c1.companyAreaName} company region information updated..");
    	setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		companyRegionValue = -1;
    		companyRegionAvail = false;
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

			if(isUpdate){
				var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$companyValue');
				companyRegionMenuItems.clear();
				for(int i=0;i<r.length;i++){
					companyRegionMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['companyRegionID'],
							child : Text(r[i]['companyRegionName'])
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

	Future<List<CompanyAreaClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY_AREA+'/owner/${CurrentUser.id}');

			if(companyAreas.length!=0){
			  companyAreas.clear();
			}
			if(json=="nothing"){
			  return companyAreas;
			}
			for (int i = 0; i < json.length; i++) {
			  int _companyAreaID = json[i]['companyAreaID'];
			  String _companyAreaName = json[i]['companyAreaName'];
			  String _companyAreaCode = json[i]['companyAreaCode'];
			  String _companyAreaDescription = json[i]['companyAreaDescription'];
			  int _companyID = json[i]['companyID'];
			  String _companyName = json[i]['companyName'];
			  String _companyCode = json[i]['companyCode'];
			  int _companyRegionId = json[i]['companyRegionId'];
			  String _companyRegionName = json[i]['companyRegionName'];
			  String _companyRegionCode = json[i]['companyRegionCode'];
			  bool _isActive = json[i]['isActive'];

			  CompanyAreaClass obj = new CompanyAreaClass.retrieve(_companyAreaID,
			    _companyAreaName,_companyAreaCode,_companyAreaDescription,_companyID,_companyName,_companyCode,_companyRegionId,
			    _companyRegionName,_companyRegionCode,_isActive);
			  
			  companyAreas.add(obj);
			}
			return companyAreas;
		}
		else{
			return companyAreas;	
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
			            title: Text(obj.companyAreaName,style : TextStyle(color : Theme.of(context).primaryColor)),
			            subtitle: Text(obj.companyAreaDescription+"\n"+obj.companyName),
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
			                                deleteCompanyArea(obj.companyAreaID);
			                              },
			                            ),
			                          ],
			                        );
			                      });
			                }),

			                ],
			              ),
			            onTap: () {
			              updateCompanyArea(obj);
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
	    						Center(child : Text('Company Area Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Comapny area name : "+obj.companyAreaName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company area code  : "+obj.companyAreaCode),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region name : "+obj.companyRegionName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region code : "+obj.companyRegionCode),
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

	addCompanyArea(){
    companyAreaName =TextEditingController();
    companyAreaCode = TextEditingController();
    companyAreaDescription = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible : false,
      builder: (c){
      	return FutureBuilder(
      		future : getCompanyData(),
      		builder : (c,s){
      			if(s.data == null){
      				return Center(child : CircularProgressIndicator());
      			}
      			else{
      				return StatefulBuilder(
      					builder : (c1,st){
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
							        	children  : <Widget>[
							        		Center(
							          			child : Text('Add new company area',textScaleFactor : 2.0,
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
																	validator : (v) => v == null ? 'Please Select Company.' : null,
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
																	var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$v');
																	companyRegionMenuItems.clear();
																	for(int i=0;i<response1.length;i++){
																		companyRegionMenuItems.add(
																			DropdownMenuItem<int>(
																				value : response1[i]['companyRegionID'],
																				child : Text(response1[i]['companyRegionName'])
																			),
																		);
																	}
																	st((){
																	
																		companyRegionAvail = true;

																		companyRegionValue = -1;
																		companyValue = v;

																		
																	});
																},
																value : companyValue == -1 ? null : companyValue,
															),
														),
														DropdownButtonHideUnderline(
															child : DropdownButtonFormField<int>(
																validator : (v){
																	if(companyRegionAvail){
																		if(v==null){
																			return 'Please Select company region.';
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
																	labelText : 'Company Region',
																	hintText : 'Please Select Company Region',
																),
																isDense : true,
																autovalidate : autoValidate,
																items : companyRegionMenuItems,
																onChanged : companyRegionAvail ? (v)async{
																	FocusManager.instance.primaryFocus.unfocus();
																	st((){
																		companyRegionValue = v;
																	});
																} : null,
																value : companyRegionValue == -1 ? null : companyRegionValue,
															),
														),
							          					TextFormField(
								                  			controller : companyAreaName,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Company area name.',
								                  				labelText : 'Name',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area name.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : companyAreaCode,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Company area code.',
								                  				labelText : 'Code',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area code.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : companyAreaDescription,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Company area decsription.',
								                  				labelText : 'Decsription',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area decsription.' : null,
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
							        	right : 0.0,
							        	top : 0.0,
							        	child : IconButton(
							        		icon : Icon(Icons.clear),
							        		onPressed : (){
							        			Navigator.of(c).pop();
							        			setState((){
							        				companyRegionValue = -1;
							        				companyRegionAvail = false;
							        				companyValue = -1;
							        				autoValidate= false;
							        			});
							        		}
							        	),
							        ),
								]
							),
							)

							);
      					}
      				);
      			}
      		}
      	);
          },
        );
    }

    updateCompanyArea(obj){
	    companyAreaName =TextEditingController();
	    companyAreaCode = TextEditingController();
	    companyAreaDescription = TextEditingController();

	    companyAreaName.text = obj.companyAreaName;
	    companyAreaCode.text = obj.companyAreaCode;
	    companyAreaDescription.text = obj.companyAreaDescription;

	    companyValue = obj.companyID;
	    companyRegionValue = obj.companyRegionId;
	    companyRegionAvail = true;

	    return showDialog(
	      context: context,
	      barrierDismissible : false,
	      builder: (c){
	      	return FutureBuilder(
	      		future : getCompanyData(isUpdate : true),
	      		builder : (c,s){
	      			if(s.data == null){
	      				return Center(child : CircularProgressIndicator());
	      			}
	      			else{
	      				return StatefulBuilder(
	      					builder : (c1,st){
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
								        	children  : <Widget>[
								        		Center(
								          			child : Text('Add new company area',textScaleFactor : 2.0,
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
																		validator : (v) => v == null ? 'Please Select Company.' : null,
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
																		var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$v');
																		companyRegionMenuItems.clear();
																		for(int i=0;i<response1.length;i++){
																			companyRegionMenuItems.add(
																				DropdownMenuItem<int>(
																					value : response1[i]['companyRegionID'],
																					child : Text(response1[i]['companyRegionName'])
																				),
																			);
																		}
																		st((){
																		
																			companyRegionAvail = true;

																			companyRegionValue = -1;
																			companyValue = v;

																			
																		});
																	},
																	value : companyValue == -1 ? null : companyValue,
																),
															),
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(companyRegionAvail){
																			if(v==null){
																				return 'Please Select company region.';
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
																		labelText : 'Company Region',
																		hintText : 'Please Select Company Region',
																	),
																	isDense : true,
																	autovalidate : autoValidate,
																	items : companyRegionMenuItems,
																	onChanged : companyRegionAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){
																			companyRegionValue = v;
																		});
																	} : null,
																	value : companyRegionValue == -1 ? null : companyRegionValue,
																),
															),
								          					TextFormField(
									                  			controller : companyAreaName,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area name.',
									                  				labelText : 'Name',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area name.' : null,
									                  		),
									                  		TextFormField(
									                  			controller : companyAreaCode,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area code.',
									                  				labelText : 'Code',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area code.' : null,
									                  		),
									                  		TextFormField(
									                  			controller : companyAreaDescription,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area decsription.',
									                  				labelText : 'Decsription',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area decsription.' : null,
									                  		),
									                  		SizedBox(height : 20.0),
									                  		InkWell(
									                  			onTap : (){
									                  				
									                  				if(_formKey.currentState.validate()){
									                  					updateData(obj.companyAreaID);
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
								        	right : 0.0,
								        	top : 0.0,
								        	child : IconButton(
								        		icon : Icon(Icons.clear),
								        		onPressed : (){
								        			Navigator.of(c).pop();
								        			setState((){
								        				companyRegionValue = -1;
								        				companyRegionAvail = false;
								        				companyValue = -1;
								        				autoValidate= false;
								        			});
								        		}
								        	),
								        ),
									]
								),
								)

								);
	      					}
	      				);
	      			}
	      		}
	      	);
	          },
	        );
    }

	@override
	void initState() {
		super.initState();
		_formKey = GlobalKey<FormState>();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				title : Text('Company area details'),
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
			drawer : CustomDrawer(companyAreaSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addCompanyArea();
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

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	TextEditingController companyAreaName =TextEditingController();
	TextEditingController companyAreaCode = TextEditingController();
	TextEditingController companyAreaDescription = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];
	List<DropdownMenuItem<int>> companyRegionMenuItems = [];

	int companyValue = -1;
	int companyRegionValue = -1;

	bool companyRegionAvail = false;

	updateData(companyAreaID,context) async{
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyAreaClass c1 = new CompanyAreaClass.toPut(
	        companyAreaName.text,
	        companyAreaCode.text,
	        companyAreaDescription.text,
		    companyValue,
		    companyRegionValue,
	        lastEditOn,
	        CurrentUser.id,
	        2
        );
    	var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_AREA+'$companyAreaID',c1.toMapPut());
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

			if(isUpdate){
				var r = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$companyValue');
				companyRegionMenuItems.clear();
				for(int i=0;i<r.length;i++){
					companyRegionMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['companyRegionID'],
							child : Text(r[i]['companyRegionName'])
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

	updateCompanyArea(obj,context){
	    companyAreaName =TextEditingController();
	    companyAreaCode = TextEditingController();
	    companyAreaDescription = TextEditingController();

	    companyAreaName.text = obj.companyAreaName;
	    companyAreaCode.text = obj.companyAreaCode;
	    companyAreaDescription.text = obj.companyAreaDescription;

	    companyValue = obj.companyID;
	    companyRegionValue = obj.companyRegionId;
	    companyRegionAvail = true;

	    return showDialog(
	      context: context,
	      barrierDismissible : false,
	      builder: (c){
	      	return FutureBuilder(
	      		future : getCompanyData(isUpdate : true),
	      		builder : (c,s){
	      			if(s.data == null){
	      				return Center(child : CircularProgressIndicator());
	      			}
	      			else{
	      				return StatefulBuilder(
	      					builder : (c1,st){
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
								        	children  : <Widget>[
								        		Center(
								          			child : Text('Add new company area',textScaleFactor : 2.0,
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
																		validator : (v) => v == null ? 'Please Select Company.' : null,
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
																		var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/company/$v');
																		companyRegionMenuItems.clear();
																		for(int i=0;i<response1.length;i++){
																			companyRegionMenuItems.add(
																				DropdownMenuItem<int>(
																					value : response1[i]['companyRegionID'],
																					child : Text(response1[i]['companyRegionName'])
																				),
																			);
																		}
																		st((){
																		
																			companyRegionAvail = true;

																			companyRegionValue = -1;
																			companyValue = v;

																			
																		});
																	},
																	value : companyValue == -1 ? null : companyValue,
																),
															),
															DropdownButtonHideUnderline(
																child : DropdownButtonFormField<int>(
																	validator : (v){
																		if(companyRegionAvail){
																			if(v==null){
																				return 'Please Select company region.';
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
																		labelText : 'Company Region',
																		hintText : 'Please Select Company Region',
																	),
																	isDense : true,
																	autovalidate : autoValidate,
																	items : companyRegionMenuItems,
																	onChanged : companyRegionAvail ? (v)async{
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){
																			companyRegionValue = v;
																		});
																	} : null,
																	value : companyRegionValue == -1 ? null : companyRegionValue,
																),
															),
								          					TextFormField(
									                  			controller : companyAreaName,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area name.',
									                  				labelText : 'Name',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area name.' : null,
									                  		),
									                  		TextFormField(
									                  			controller : companyAreaCode,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area code.',
									                  				labelText : 'Code',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area code.' : null,
									                  		),
									                  		TextFormField(
									                  			controller : companyAreaDescription,
									                  			decoration : InputDecoration(
									                  				hintText : 'Enter Company area decsription.',
									                  				labelText : 'Decsription',
									                  			),
									                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company area decsription.' : null,
									                  		),
									                  		SizedBox(height : 20.0),
									                  		InkWell(
									                  			onTap : (){
									                  				
									                  				if(_formKey.currentState.validate()){
									                  					updateData(obj.companyAreaID,context);
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
								        	right : 0.0,
								        	top : 0.0,
								        	child : IconButton(
								        		icon : Icon(Icons.clear),
								        		onPressed : (){
								        			Navigator.of(c).pop();
								        				companyRegionValue = -1;
								        				companyRegionAvail = false;
								        				companyValue = -1;
								        				autoValidate= false;
								        		}
								        	),
								        ),
									]
								),
								)

								);
	      					}
	      				);
	      			}
	      		}
	      	);
	          },
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
	    						Center(child : Text('Company Area Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Comapny area name : "+obj.companyAreaName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company area code  : "+obj.companyAreaCode),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region name : "+obj.companyRegionName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region code : "+obj.companyRegionCode),
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

  deleteCompanyArea(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_AREA + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyAreaClass> suggestionList = query.isEmpty?companyAreas:companyAreas.where((p)=>p.companyAreaName.startsWith(query)||
      p.companyAreaCode.startsWith(query)||p.companyAreaDescription.startsWith(query)||p.companyName.startsWith(query)||
      p.companyCode.startsWith(query)||p.companyRegionName.startsWith(query)||p.companyRegionCode.startsWith(query)
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
                        text : suggestionList[index].companyAreaName.substring(0,query.length>=suggestionList[index].companyAreaName.length ? suggestionList[index].companyAreaName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyAreaName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].companyAreaName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyAreaDescription+"\n"+suggestionList[index].companyName),
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
                                    deleteCompanyArea(suggestionList[index].companyAreaID,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateCompanyArea(suggestionList[index],context);
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
