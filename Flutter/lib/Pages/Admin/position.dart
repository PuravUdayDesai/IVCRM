//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';



//custom
import '../../Models/Company/position_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import 'add_position.dart';
import 'update_position.dart';
import '../../Bloc/theme.dart';



class Position extends StatefulWidget{
	@override
	_PositionState createState ()=> _PositionState();
}

List<PositionClass> positions = [];

class _PositionState extends State<Position>{

	bool isLoading = false;
	bool getNewData = true;
	GlobalKey<ScaffoldState> _scaffoldKey;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deletePosition(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_POSITION + "/$id");
		if(response1 == 'nothing'){
			setState((){
				isLoading = false;
			});
			showMessage('Selcted position is primary position in company therefore opertaion could not be completed.');
		}
		else{
			setState((){
				isLoading = false;
				getNewData = true;
			});
			showMessage('Record Successfully Deleted.!');	
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
						return Center(child : Text('No Data Exists'));
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

	Future<List<PositionClass>> getData() async {
		if(getNewData){
			getNewData = false;

			var json = await ApiCall.getDataFromApi(Uri.GET_POSITION+"/${CurrentUser.id}");
			if(positions.length!=0){
			  positions.clear();
			}
			if(json=="nothing"){
			  return positions;
			}


			for (int i = 0; i < json.length; i++) {

			  int _positionId = json[i]['positionId'];
			  String _positionName = json[i]['positionName'];
			  int _positionPriority = json[i]['positionPriority'];
			  int _companyId = json[i]['companyId'];
			  String _companyName = json[i]['companyName'];
			  int _createdBy = json[i]['createdBy'];
			  String _createdOn = json[i]['createdOn'];
			  int _lastEditBy = json[i]['lastEditBy'];
			  String _lastEditOn = json[i]['lastEditOn'];
			  bool _isActive = json[i]['isActive'];
			  String _company = json[i]['company'];
			  String _companyBranch = json[i]['companyBranch'];
			  String _companyExecutive = json[i]['companyExecutive'];
			  String _client = json[i]['client'];
			  String _product = json[i]['product'];
			  String _location = json[i]['location'];
			  String _enquiry = json[i]['enquiry'];
			  String _ticket = json[i]['ticket'];
			  String _position = json[i]['position'];

			  PositionClass obj = new PositionClass.retrieve(
			    _positionId,
			    _positionName,
			    _positionPriority,
			    _companyId,
			    _companyName,
			    _createdBy,
			    _createdOn,
			    _lastEditBy,
			    _lastEditOn,
			    _isActive,
			    _company,
			    _companyBranch,
			    _companyExecutive,
			    _client,
			    _product,
			    _location,
			    _enquiry,
			    _ticket,
			    _position
			  );
			  positions.add(obj);
			}
			return positions;
		}
		else{
			return positions;
		}
	}

	Widget makeCard(var obj){
		return Column(
		  children: [
		    Card(
		        elevation: 7,
		        child: ListTile(
		            dense: false,
		            isThreeLine: true,
		            title: Text(obj.positionName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
		            subtitle: Text(obj.positionPriority.toString()),
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
		                                color: Colors.red,
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
		                                deletePosition(obj.positionId);
		                              },
		                            ),
		                          ],
		                        );
		                      });
		                }),

		                ],
		              ),
		            onTap: () {
		              Navigator.push(
		              context,
		              MaterialPageRoute(builder: (context) => UpdatePosition(obj)
		              )
		              ).then((value){
		              	if(value!=null){
		              		setState((){
		              			getNewData = true;
		              		});
		              		showMessage('Record Successfully Updated.!');
		              	}
		              });
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
	    						Center(child : Text('Position Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: Text("Position Name : "+obj.positionName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Position Priority  : "+ obj.positionPriority.toString()),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title : Text('Company'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.company.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.company.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.company.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.company.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Company Branch'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.companyBranch.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.companyBranch.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.companyBranch.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.companyBranch.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Company  Executive'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.companyExecutive.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.companyExecutive.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.companyExecutive.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.companyExecutive.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Client'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.client.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.client.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.client.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.client.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Product'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.product.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.product.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.product.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.product.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Location'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.location.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.location.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.location.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.location.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Enquiry'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.enquiry.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.enquiry.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.enquiry.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.enquiry.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Ticket'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.ticket.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.ticket.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.ticket.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.ticket.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Position'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.position.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.position.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.position.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.position.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
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
	void initState() {
		super.initState();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
	}


	@override
	Widget build(BuildContext context){
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				title : Text('Position Details'),
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
	                  getNewData = true;
		                
		                
		                
		               });
		              },
		          )
		        ],
			),
			body : refresh(context),
			drawer : CustomDrawer(positionSelected : true),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					Navigator.push(
						context,
						MaterialPageRoute(
							builder : (context) => AddPosition()
						)
					).then((value){
						if(value!=null){
							setState((){
								getNewData = true;
							});
							showMessage('Record Successfully created.!');
						}
					});
				},
				shape : RoundedRectangleBorder(
					borderRadius : BorderRadius.circular(16.0)
				),
			),
		);
	}
}

class DataSearch extends SearchDelegate<String>
{

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
	    						Center(child : Text('Position Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: Text("Position Name : "+obj.positionName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Position Priority  : "+ obj.positionPriority.toString()),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title : Text('Company'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.company.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.company.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.company.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.company.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Company Branch'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.companyBranch.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.companyBranch.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.companyBranch.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.companyBranch.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Company  Executive'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.companyExecutive.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.companyExecutive.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.companyExecutive.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.companyExecutive.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Client'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.client.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.client.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.client.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.client.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Product'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.product.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.product.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.product.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.product.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Location'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.location.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.location.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.location.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.location.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Enquiry'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.enquiry.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.enquiry.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.enquiry.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.enquiry.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Ticket'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.ticket.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.ticket.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.ticket.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.ticket.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
									),
								),
								SizedBox(height : 10.0),
								ListTile(
									title : Text('Position'),
									subtitle : Column(
										children : <Widget>[
											Row(
												children : <Widget>[
													Text('Read - '),
													obj.position.toString().contains('R') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Create - '),
													obj.position.toString().contains('C') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Update - '),
													obj.position.toString().contains('U') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
											Row(
												children : <Widget>[
													Text('Delete - '),
													obj.position.toString().contains('D') ? Icon(Icons.check,color : Colors.green) : Icon(Icons.clear,color : Colors.red),
												]
											),
										]
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

  deletePosition(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_POSITION + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<PositionClass> suggestionList = query.isEmpty?positions:positions.where((p)=>p.positionName.startsWith(query)||
      p.companyName.startsWith(query)
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
                        text : suggestionList[index].positionName.substring(0,query.length>=suggestionList[index].positionName.length ? suggestionList[index].positionName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].positionName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].positionName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].positionPriority.toString()),
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
                                    deletePosition(suggestionList[index].positionId,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  Navigator.pushReplacement (
                    context,
                    MaterialPageRoute(builder : (context) => UpdatePosition(suggestionList[index]))
                  );
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
