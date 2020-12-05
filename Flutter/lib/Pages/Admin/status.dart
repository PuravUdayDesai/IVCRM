//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


//custom
import '../../Models/Company/status_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';


class Status extends StatefulWidget{
	@override
	_StatusState createState () => _StatusState();
}

List<StatusClass> statuses = [];

class _StatusState extends State<Status>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;
	TextEditingController statusName;
	TextEditingController statusColorCode;
	TextEditingController workProgress;

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;
	int colorValue = 0;


	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteStatus(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_STATUS + "/$id");
		setState((){
			isLoading = false;
			getNewData = true;
		});
		showMessage('Record Successfully Deleted.!');
	}

	addData() async{

		setState((){isLoading = true;});
		String createdOn = DateTime.now().toString().substring(0,19);

	    StatusClass c1 = new StatusClass.toPost(
		    statusName.text,
		    colorValue.toString(),
		    double.parse(workProgress.text),
		    companyValue,
		    CurrentUser.id,
		    createdOn
	    );
		var c2 = await ApiCall.createRecord(Uri.GET_STATUS,c1.toMap());
		showMessage("Status Added with name ${c1.statusName}");
		setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		autoValidate = false;
    	});
	}

	updateData(statusId) async{
		setState((){isLoading = true;});
		String lastEditOn = DateTime.now().toString().substring(0,19);
		StatusClass c1 = new StatusClass.toPut(
	        statusName.text,
	        colorValue.toString(),
	        double.parse(workProgress.text),
	        companyValue,
	        CurrentUser.id,
	        lastEditOn
	    );
	    var c2 = await ApiCall.updateRecord(Uri.GET_STATUS+'/$statusId',c1.toPut());
	    showMessage("${c1.statusName} status information updated..");
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

	Future<List<StatusClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_STATUS+'/owner/${CurrentUser.id}');

			if(statuses.length!=0){
			  statuses.clear();
			}
			if(json=="nothing"){
			  return statuses;
			}
			for (int i = 0; i < json.length; i++) {

			  int _statusId = json[i]['statusId'];
			  String _statusName = json[i]['statusName'];
			  String _statusColorCode = json[i]['statusColorCode'];
			  int _workProgress = json[i]['workProgress'];
			  int _companyId = json[i]['companyId'];
			  String _companyName = json[i]['companyName'];
			  int _createdBy = json[i]['createdBy'];
			  String _createdOn = json[i]['createdOn'];
			  int _lastEditBy = json[i]['lastEditBy'];
			  String _lastEditOn = json[i]['lastEditOn'];


			  StatusClass obj = new StatusClass.retrieve(
			    _statusId,
			    _statusName,
			    _statusColorCode,
			    double.parse(_workProgress.toString()),
			    _companyId,
			    _companyName,
			    _createdBy,
			    _createdOn,
			    _lastEditBy,
			    _lastEditOn
			  );
			  
			  statuses.add(obj);
			}
			return statuses;
		}
		else{
			return statuses;
		}
		
	}

	Widget makeCard(var obj) {

	      return Column(
				children: [
				Card(
				    elevation: 7,
				    child: ListTile(
				        dense: true,
				        title: Text(obj.statusName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight :FontWeight.bold )),
				        subtitle : Row(
				        	children : <Widget>[
				        		Container(
				        			width : obj.workProgress,
				        			height : 10.0,
				        			decoration : BoxDecoration(
				        				borderRadius : BorderRadius.circular(8.0),
				        				color : Color(int.parse(obj.statusColorCode)),
				        			),
				        			
				        		),
				        		SizedBox(width : 15.0),
				        		Text(obj.workProgress.toString()+' %'),
				        	]
				        ),
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
			                                deleteStatus(obj.statusId);
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
	    						Center(child : Text('Status Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Status name : "+obj.statusName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Work Progress  : "+obj.workProgress.toString()),
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

		statusName = TextEditingController();
		workProgress = TextEditingController();

		statusName.text = obj.statusName;
		workProgress.text = obj.workProgress.toString();

		companyValue = obj.companyId;

		colorValue = int.parse(obj.statusColorCode);


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
												                  			controller : statusName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Status Name',
												                  				labelText : 'Status Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Status Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : workProgress,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Work Progress',
												                  				labelText : 'Work Progress',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Work Progress.';
												                  				}
												                  				try{
												                  					double position = double.parse(v);
												                  					if(position > 100){
												                  						return 'Value should be less than 100%';
												                  					}
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
												                  		),
												                  		SizedBox(height : 5.0),
												                  		LayoutBuilder(
												                  			builder : (co1,constraints){
												                  				return Row(
														                  			children : <Widget>[
														                  				colorValue == 0 ? Text('') : Text('Color Code : '),
														                  				Expanded(
														                  					child : Container(
														                  						height : 40.0,
														                  						width : constraints.maxWidth - 50,
														                  						color : colorValue == 0 ? Colors.white : Color(colorValue),
														                  						child : colorValue == 0 ? Text('No Colors selected.') : Text('')
														                  					),
														                  				),
														                  				IconButton(
														                  					icon : Icon(Icons.more_vert),
														                  					onPressed : (){
														                  						return showDialog(
														                  							context : c,
														                  							builder :(c2){
														                  								return AlertDialog(
														                  									title : Text('Select a color',style : TextStyle(color : Theme.of(context).primaryColor)),
														                  									content: SingleChildScrollView(
																											child: BlockPicker(
																												pickerColor: Color(colorValue),
																												onColorChanged: (c){
																													st((){
																														colorValue = c.value;
																													});
																												},
																											),
																											
																											),
																											actions : [
																												FlatButton(
																													onPressed : (){
																														Navigator.of(c2).pop();
																													},
																													child : Text(
																														'OK',
																														style : TextStyle(
																															color : Theme.of(context).primaryColor,
																														),	
																													),
																												),
																											]
														                  								);
														                  							}
														                  						);
														                  					}
														                  				),
														                  			]
														                  		);		
												                  			}
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.statusId);
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

	addStatus(){

		statusName = TextEditingController();
		//statusColorCode  = TextEditingController();
		workProgress = TextEditingController();

		colorValue = 0;

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
														children : <Widget>[
															Center(
											          			child : Text('Add new Status',textScaleFactor : 2.0,
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
												                  			controller : statusName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Status Name',
												                  				labelText : 'Status Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Status Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : workProgress,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Work Progress',
												                  				labelText : 'Work Progress',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Work Progress.';
												                  				}
												                  				try{
												                  					double position = double.parse(v);
												                  					if(position > 100){
												                  						return 'Value should be less than 100%';
												                  					}
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
												                  		),
												                  		SizedBox(height : 5.0),
												                  		LayoutBuilder(
												                  			builder : (co1,constraints){
												                  				return Row(
														                  			children : <Widget>[
														                  				colorValue == 0 ? Text('') : Text('Color Code : '),
														                  				Expanded(
														                  					child : Container(
														                  						height : 40.0,
														                  						width : constraints.maxWidth - 50,
														                  						color : colorValue == 0 ? Colors.white : Color(colorValue),
														                  						child : colorValue == 0 ? Text('No Colors selected.') : Text('')
														                  					),
														                  				),
														                  				IconButton(
														                  					icon : Icon(Icons.more_vert),
														                  					onPressed : (){
														                  						return showDialog(
														                  							context : c,
														                  							builder :(c2){
														                  								return AlertDialog(
														                  									title : Text('Select a color',style : TextStyle(color : Theme.of(context).primaryColor)),
														                  									content: SingleChildScrollView(
																											child: BlockPicker(
																												pickerColor: Color(colorValue),
																												onColorChanged: (c){
																													st((){
																														colorValue = c.value;
																													});
																												},
																											),
																											
																											),
																											actions : [
																												FlatButton(
																													onPressed : (){
																														Navigator.of(c2).pop();
																													},
																													child : Text(
																														'OK',
																														style : TextStyle(
																															color : Theme.of(context).primaryColor,
																														),	
																													),
																												),
																											]
														                  								);
														                  							}
														                  						);
														                  					}
														                  				),
														                  			]
														                  		);		
												                  			}
												                  		),
												                  		
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					if(colorValue == 0){
												                  						showMessage('Please Choose color for status.');
												                  					}
												                  					else{
												                  						addData();
												                  						Navigator.of(c).pop();	
												                  					}
												                  					
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
				title : Text('Status Details'),
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
			drawer : CustomDrawer(statusSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addStatus();
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
	TextEditingController statusName = TextEditingController();
	TextEditingController statusColorCode = TextEditingController();
	TextEditingController workProgress = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;
	int colorValue =0;

	updateData(statusId,context) async{
		String lastEditOn = DateTime.now().toString().substring(0,19);
		StatusClass c1 = new StatusClass.toPut(
	        statusName.text,
	        colorValue.toString(),
	        double.parse(workProgress.text),
	        companyValue,
	        CurrentUser.id,
	        lastEditOn
	    );
	    var c2 = await ApiCall.updateRecord(Uri.GET_STATUS+'/$statusId',c1.toPut());
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
	    						Center(child : Text('Status Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Status name : "+obj.statusName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Work Progress  : "+obj.workProgress.toString()),
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

		statusName = TextEditingController();
		statusColorCode  = TextEditingController();
		workProgress = TextEditingController();

		statusName.text = obj.statusName;
		statusColorCode.text  = obj.statusColorCode;
		workProgress.text = obj.workProgress.toString();

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
												                  			controller : statusName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Status Name',
												                  				labelText : 'Status Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Status Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : workProgress,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Work Progress',
												                  				labelText : 'Work Progress',
												                  			),
												                  			validator : (v){
												                  				if(v.isEmpty){
												                  					return 'Please Enter Work Progress.';
												                  				}
												                  				try{
												                  					double position = double.parse(v);
												                  					if(position > 100){
												                  						return 'Value should be less than 100%';
												                  					}
												                  					return null;
												                  				}
												                  				catch(e){
												                  					return 'Please Enter Numeric value';
												                  				}
												                  			}
												                  		),
												                  		SizedBox(height : 5.0),
												                  		LayoutBuilder(
												                  			builder : (co1,constraints){
												                  				return Row(
														                  			children : <Widget>[
														                  				colorValue == 0 ? Text('') : Text('Color Code : '),
														                  				Expanded(
														                  					child : Container(
														                  						height : 40.0,
														                  						width : constraints.maxWidth - 50,
														                  						color : colorValue == 0 ? Colors.white : Color(colorValue),
														                  						child : colorValue == 0 ? Text('No Colors selected.') : Text('')
														                  					),
														                  				),
														                  				IconButton(
														                  					icon : Icon(Icons.more_vert),
														                  					onPressed : (){
														                  						return showDialog(
														                  							context : c,
														                  							builder :(c2){
														                  								return AlertDialog(
														                  									title : Text('Select a color',style : TextStyle(color : Theme.of(context).primaryColor)),
														                  									content: SingleChildScrollView(
																											child: BlockPicker(
																												pickerColor: Color(colorValue),
																												onColorChanged: (c){
																													st((){
																														colorValue = c.value;
																													});
																												},
																											),
																											
																											),
																											actions : [
																												FlatButton(
																													onPressed : (){
																														Navigator.of(c2).pop();
																													},
																													child : Text(
																														'OK',
																														style : TextStyle(
																															color : Theme.of(context).primaryColor,
																														),	
																													),
																												),
																											]
														                  								);
														                  							}
														                  						);
														                  					}
														                  				),
														                  			]
														                  		);		
												                  			}
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.statusId,context);
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
    var response1 = await ApiCall.deleteRecord(Uri.GET_STATUS + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<StatusClass> suggestionList = query.isEmpty?statuses:statuses.where((p)=>p.statusName.startsWith(query)||
      p.statusColorCode.startsWith(query)||p.companyName.startsWith(query)
      ).toList();
    return ListView.builder(
      itemCount : suggestionList.length,
      itemBuilder : (context,index){
        return Column(
      children: [
        Card(
            elevation: 7,
            child: ListTile(
                dense: true,
                title : Consumer<ThemeNotifier>(
                  builder : (context,data,child){
                    return RichText(
                      text : TextSpan(
                        text : suggestionList[index].statusName.substring(0,query.length>=suggestionList[index].statusName.length ? suggestionList[index].statusName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].statusName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].statusName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle : Row(
		        	children : <Widget>[
		        		Container(
		        			width : suggestionList[index].workProgress,
		        			height : 10.0,
		        			decoration : BoxDecoration(
		        				borderRadius : BorderRadius.circular(8.0),
		        				color : Color(int.parse(suggestionList[index].statusColorCode)),
		        			),
		        			
		        		),
		        		SizedBox(width : 15.0),
		        		Text(suggestionList[index].workProgress.toString()+' %'),
		        	]
		        ),
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
                                    deleteStatus(suggestionList[index].statusId,context);
                                    
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

