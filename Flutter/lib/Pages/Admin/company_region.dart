//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Models/Company/company_region_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';


class CompanyRegion extends StatefulWidget{
	@override
	_CompanyRegionState createState()=> _CompanyRegionState();
}
	
List<CompanyRegionClass> companyRegions = [];

class _CompanyRegionState extends State<CompanyRegion>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;
	TextEditingController companyRegionName;
	TextEditingController companyRegionCode;
	TextEditingController companyRegionDescription;

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCompanyRegion(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_REGION + "/$id");
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

	    CompanyRegionClass c1 = new CompanyRegionClass.toPost(
		    companyRegionName.text,
		    companyRegionCode.text,
		    companyRegionDescription.text,
		    companyValue,
		    createdOn,
		    CurrentUser.id,
		    1
	    );
		var c2 = await ApiCall.createRecord(Uri.GET_COMPANY_REGION,c1.toMap());
		showMessage("Comapny region Added with name ${c1.companyRegionName}");
		setState((){
			isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		autoValidate = false;
		});
	}

	updateData(companyRegionID) async{
		setState((){
			isLoading = true;
		});	
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyRegionClass c1 = new CompanyRegionClass.toPut(
	        companyRegionName.text,
	        companyRegionCode.text,
	        companyRegionDescription.text,
	        companyValue,
	        lastEditOn,
	        CurrentUser.id,
	        3
	    );
	    CompanyRegionClass c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_REGION+'/$companyRegionID',c1.toMapPut());
	    showMessage("${c1.companyRegionName} company region information updated..");
	    setState((){
	    	getNewData = true;
			companyValue = -1;
			autoValidate = false;
			isLoading = false;
	    });
	}

	Future<String> getCompanyData()async{
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

	Future<List<CompanyRegionClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY_REGION+'/owner/${CurrentUser.id}');

			if(companyRegions.length!=0){
			  companyRegions.clear();
			}
			if(json=="nothing"){
			  return companyRegions;
			}
			//print(json.length);
			for (int i = 0; i < json.length; i++) {

			  int _companyRegionID = json[i]['companyRegionID'];
			  String _companyRegionName = json[i]['companyRegionName'];
			  String _companyRegionCode = json[i]['companyRegionCode'];
			  String _companyRegionDescription = json[i]['companyRegionDescription'];
			  int _companyID = json[i]['companyID'];
			  String _companyName = json[i]['companyName'];
			  String _companyCode = json[i]['companyCode'];
			  bool _isActive = json[i]['isActive'];
			  CompanyRegionClass obj = new CompanyRegionClass.retrieve(_companyRegionID,
			    _companyRegionName,_companyRegionCode,_companyRegionDescription,_companyID,_companyName,_companyCode,_isActive);
			  
			  companyRegions.add(obj);
			}
			return companyRegions;
		}
		else{
			return companyRegions;
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
			            title: Text(obj.companyRegionName,style : TextStyle(color : Theme.of(context).primaryColor)),
			            subtitle: Text(obj.companyRegionDescription+"\n"+obj.companyName),
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
			                                deleteCompanyRegion(obj.companyRegionID);
			                              },
			                            ),
			                          ],
			                        );
			                      });
			                }),

			                ],
			              ),
			            onTap: () {
			              updateCompanyRegion(obj);
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
	    						Center(child : Text('Company region Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Comapny region name : "+obj.companyRegionName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region code  : "+obj.companyRegionCode),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
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

	addCompanyRegion(){

		companyRegionName = TextEditingController();
		companyRegionCode  = TextEditingController();
		companyRegionDescription = TextEditingController();

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
											          			child : Text('Add new company region',textScaleFactor : 2.0,
											          				textAlign : TextAlign.center,
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
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : companyRegionName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region name.',
												                  				labelText : 'Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionCode,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region code',
												                  				labelText : 'Code',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region code.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region description',
												                  				labelText : 'Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region description.' : null,
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

	updateCompanyRegion(obj){

		companyRegionName = TextEditingController();
		companyRegionCode  = TextEditingController();
		companyRegionDescription = TextEditingController();

		companyRegionName.text = obj.companyRegionName;
		companyRegionCode.text  = obj.companyRegionCode;
		companyRegionDescription.text = obj.companyRegionDescription;

		companyValue = obj.companyID;

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
											          			child : Text('Update company region',textScaleFactor : 2.0,
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
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : companyRegionName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region name.',
												                  				labelText : 'Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionCode,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region code',
												                  				labelText : 'Code',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region code.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region description',
												                  				labelText : 'Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region description.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.companyRegionID);
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
		_scaffoldKey = new GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				title : Text('Company Region details'),
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
			drawer : CustomDrawer(companyRegionSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addCompanyRegion();
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
	TextEditingController companyRegionName = TextEditingController();
	TextEditingController companyRegionCode = TextEditingController();
	TextEditingController companyRegionDescription = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;

	updateData(companyRegionID,context) async{
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyRegionClass c1 = new CompanyRegionClass.toPut(
	        companyRegionName.text,
	        companyRegionCode.text,
	        companyRegionDescription.text,
	        companyValue,
	        lastEditOn,
	        CurrentUser.id,
	        3
	    );
	    CompanyRegionClass c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_REGION+'/$companyRegionID',c1.toMapPut());
	    close(context,'update');
	}


	Future<String> getCompanyData()async{
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
	    						Center(child : Text('Company region Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: new Text("Comapny region name : "+obj.companyRegionName),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Company region code  : "+obj.companyRegionCode),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
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

	updateCompanyRegion(obj,context){

		companyRegionName = TextEditingController();
		companyRegionCode  = TextEditingController();
		companyRegionDescription = TextEditingController();

		companyRegionName.text = obj.companyRegionName;
		companyRegionCode.text  = obj.companyRegionCode;
		companyRegionDescription.text = obj.companyRegionDescription;

		companyValue = obj.companyID;

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
											          			child : Text('Update company region',textScaleFactor : 2.0,
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
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : companyRegionName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region name.',
												                  				labelText : 'Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionCode,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region code',
												                  				labelText : 'Code',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region code.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyRegionDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company region description',
												                  				labelText : 'Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company region description.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.companyRegionID,context);
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

  deleteCompanyRegion(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_REGION + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyRegionClass> suggestionList = query.isEmpty?companyRegions:companyRegions.where((p)=>p.companyRegionName.startsWith(query)||
      p.companyRegionCode.startsWith(query)||p.companyRegionDescription.startsWith(query)||p.companyName.startsWith(query)||
      p.companyCode.startsWith(query)
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
                        text : suggestionList[index].companyRegionName.substring(0,query.length>=suggestionList[index].companyRegionName.length ? suggestionList[index].companyRegionName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyRegionName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].companyRegionName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyRegionDescription+"\n"+suggestionList[index].companyName),
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
                                    deleteCompanyRegion(suggestionList[index].companyRegionID,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateCompanyRegion(suggestionList[index],context);
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}