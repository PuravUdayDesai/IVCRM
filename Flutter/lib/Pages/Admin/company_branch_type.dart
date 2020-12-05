//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Models/Company/company_branch_type_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';

class CompanyBranchType extends StatefulWidget{
	@override
	_CompanyBranchTypeState createState () => _CompanyBranchTypeState();
}

List<CompanyBranchTypeClass> companyBranchTypes = [];

class _CompanyBranchTypeState extends State<CompanyBranchType>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;
	TextEditingController companyBranchTypeName;
	TextEditingController companyBranchPosition;

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;


	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCompanyBranchType(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_BRANCH_TYPE + "/$id");
		setState((){
			isLoading = false;
			getNewData = true;
		});
		showMessage('Record Successfully Deleted.!');
	}

	addData() async{

		setState((){isLoading = true;});
		String createdOn = DateTime.now().toString().substring(0,19);

	    CompanyBranchTypeClass c1 = new CompanyBranchTypeClass.toPost(
		    companyBranchTypeName.text,
		    companyValue,
		    int.parse(companyBranchPosition.text),
		    CurrentUser.id,
		    createdOn
	    );
		var c2 = await ApiCall.createRecord(Uri.GET_COMPANY_BRANCH_TYPE,c1.toMap());
		showMessage("Branch Type Added with name ${c1.companyBranchTypeName}");
		setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		autoValidate = false;
    	});
	}

	updateData(id) async{
		setState((){isLoading = true;});
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyBranchTypeClass c1 = new CompanyBranchTypeClass.toPut(
	        companyBranchTypeName.text,
	        companyValue,
	        int.parse(companyBranchPosition.text),
	        CurrentUser.id,
	        lastEditOn
	    );
	    var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_BRANCH_TYPE+'/$id',c1.toPut());
	    showMessage("${c1.companyBranchTypeName} branch type information updated..");
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

	Future<List<CompanyBranchTypeClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY_BRANCH_TYPE+'/owner/${CurrentUser.id}');

			if(companyBranchTypes.length!=0){
			  companyBranchTypes.clear();
			}
			if(json=="nothing"){
			  return companyBranchTypes;
			}
			for (int i = 0; i < json.length; i++) {

			  	int _companyBranchTypeId = json[i]['companyBranchTypeId'];
				String _companyBranchTypeName = json[i]['companyBranchTypeName'];
				int _companyId = json[i]['companyId'];
				String _companyName = json[i]['companyName'];
				int _companyBranchPosition = json[i]['companyBranchPosition'];
				int _createdBy = json[i]['createdBy'];
				String _createdOn = json[i]['createdOn'];
				String _lastEditOn = json[i]['lastEditOn'];
				int _lastEditBy = json[i]['lastEditBy'];


				CompanyBranchTypeClass obj = new CompanyBranchTypeClass.retrieve(
				_companyBranchTypeId,
				_companyBranchTypeName,
				_companyId,
				_companyName,
				_companyBranchPosition,
				_createdBy,
				_createdOn,
				_lastEditOn,
				_lastEditBy
				);
			  
			  companyBranchTypes.add(obj);
			}
			return companyBranchTypes;
		}
		else{
			return companyBranchTypes;
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
				        title: Text(obj.companyBranchTypeName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight :FontWeight.bold )),
				        subtitle: Text(obj.companyName),
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
			                                deleteCompanyBranchType(obj.companyBranchTypeId);
			                              },
			                            ),
			                          ],
			                        );
			                      }
			                      );
				            }),

				            ],
				          ),
				        onTap: () {
				          updateStatus(obj);
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
	    						Center(child : Text('Company Branch Type Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Comapny branch type  : "+obj.companyBranchTypeName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Company branch position  : "+obj.companyBranchPosition.toString()),
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

	updateStatus(obj){

		companyBranchTypeName = TextEditingController();
		companyBranchPosition = TextEditingController();

		companyBranchTypeName.text = obj.companyBranchTypeName;
		companyBranchPosition.text = obj.companyBranchPosition.toString();

		companyValue = obj.companyId;


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
											          			child : Text('Update Status',textScaleFactor : 2.0,
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
												                  			controller : companyBranchTypeName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter branch type Name',
												                  				labelText : 'Branch Type',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company Branch Type Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyBranchPosition,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company branch type position',
												                  				labelText : 'Position',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Company Branch Type Position.';
												                  				}
												                  				try{
												                  					int position = int.parse(v);
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.companyBranchTypeId);
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

	addCompanyBranchType(){

		companyBranchTypeName = TextEditingController();
		companyBranchPosition = TextEditingController();

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
											          			child : Text('Add new branch type',textScaleFactor : 2.0,
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
												                  			controller : companyBranchTypeName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter branch type Name',
												                  				labelText : 'Branch Type',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company Branch Type Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyBranchPosition,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company branch type position',
												                  				labelText : 'Position',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Company Branch Type Position.';
												                  				}
												                  				try{
												                  					int position = int.parse(v);
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
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
				title : Text('Company Branch Type Details'),
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
	                    showMessage('Updated Successfully.!!');
	                    setState((){
		                  getNewData = true;
		                });
	                  }
		                
		                
		                
		               });
		              },
		          )
		        ],
			),
			drawer : CustomDrawer(companyBranchTypeSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addCompanyBranchType();
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
	TextEditingController companyBranchTypeName = TextEditingController();
	TextEditingController companyBranchPosition = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;

	updateData(id,context) async{
		String lastEditOn = DateTime.now().toString().substring(0,19);
		CompanyBranchTypeClass c1 = new CompanyBranchTypeClass.toPut(
	        companyBranchTypeName.text,
	        companyValue,
	        int.parse(companyBranchPosition.text),
	        CurrentUser.id,
	        lastEditOn
	    );
	    var c2 = await ApiCall.updateRecord(Uri.GET_COMPANY_BRANCH_TYPE+'/$id',c1.toPut());
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
	    						Center(child : Text('Company Branch Type Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Comapny branch type  : "+obj.companyBranchTypeName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Company branch position  : "+obj.companyBranchPosition.toString()),
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

	updateStatus(obj,context){

		companyBranchTypeName = TextEditingController();
		companyBranchPosition = TextEditingController();

		companyBranchTypeName.text = obj.companyBranchTypeName;
		companyBranchPosition.text = obj.companyBranchPosition.toString();

		companyValue = obj.companyId;


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
											          			child : Text('Update Status',textScaleFactor : 2.0,
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
												                  			controller : companyBranchTypeName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter branch type Name',
												                  				labelText : 'Branch Type',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Company Branch Type Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : companyBranchPosition,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Company branch type position',
												                  				labelText : 'Position',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Company Branch Type Position.';
												                  				}
												                  				try{
												                  					int position = int.parse(v);
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.companyBranchTypeId,context);
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

  deleteStatus(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY_BRANCH_TYPE + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyBranchTypeClass> suggestionList = query.isEmpty?companyBranchTypes:companyBranchTypes.where((p)=>p.companyBranchTypeName.startsWith(query)||
      p.companyName.startsWith(query)||p.companyBranchPosition.toString().startsWith(query)
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
                        text : suggestionList[index].companyBranchTypeName.substring(0,query.length>=suggestionList[index].companyBranchTypeName.length ? suggestionList[index].companyBranchTypeName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyBranchTypeName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].companyBranchTypeName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyName),
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
                                    deleteStatus(suggestionList[index].companyBranchTypeId,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateStatus(suggestionList[index],context);
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}