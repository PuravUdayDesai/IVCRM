//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Models/Company/company_model.dart';
import 'display_map.dart';
import 'add_company.dart';
import 'update_company.dart';
import '../../Bloc/theme.dart';






class Company extends StatefulWidget{
	@override
	_CompanyState createState () => _CompanyState();
}
	
List<CompanyClass> companies = [];

class _CompanyState extends State<Company>{

	bool isLoading = false;
	bool getNewData = true;
	GlobalKey<ScaffoldState> _scaffoldKey;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCompany(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY + "/$id");
		if(response1 == 'nothing'){
			setState((){
				isLoading = false;
			});
			showMessage('Please delete all respective company branche before deleting company.');
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

	Future<List<CompanyClass>> getData() async {
		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_COMPANY+'/owner/${CurrentUser.id}');
			if(companies.length!=0){
			  companies.clear();
			}
			if(json=="nothing"){
			  return companies;
			}

			for (int i = 0; i < json.length; i++) {
			  int _companyId = json[i]['companyId'];
			  String _companyCode = json[i]['companyCode'];
			  String _companyName = json[i]['companyName'];
			  int _ownerContactId = json[i]['ownerContactId'];
			  int _companyAddressId = json[i]['companyAddressId'];
			  String _addressLine1 = json[i]['addressLine1'];
			  String _addressLine2 = json[i]['addressLine2'];
			  String _addressLine3 = json[i]['addressLine3'];
			  int _pincode = json[i]['pincode'];
			  int _cityId = json[i]['cityId'];
			  String _cityName = json[i]['cityName'];
			  int _stateId = json[i]['stateId'];
			  int _countryId = json[i]['countryId'];
			  String _latitude = json[i]['latitude'];
			  String _longitude = json[i]['longitude'];
			  bool _isActive = json[i]['isActive'];
			  CompanyClass obj = new CompanyClass.retrive(_companyId,_companyCode,_companyName,
			    _ownerContactId,_companyAddressId,_addressLine1,
			    _addressLine2,_addressLine3,_pincode.toString(),_cityId,_cityName,_stateId
			    ,_countryId,_latitude,_longitude,_isActive);
			  companies.add(obj);
			}
			return companies;  
		}
		else{
			return companies;	
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
		            title: Text(obj.companyName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
		            subtitle: Text(obj.companyCode+"\n"+obj.cityName),
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
		                iconSize: 30.0,
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
		                                deleteCompany(obj.companyId);
		                              },
		                            ),
		                          ],
		                        );
		                      });
		                }),

		                ],
		              ),
		            onTap: () {
		              Navigator.push(context,MaterialPageRoute(builder : (context)=>UpdateCompany(obj))).then((value){
		              	if(value != null){
		              		showMessage('Record Successfully Updated.!!');
		              		setState((){
		              			getNewData = true;
		              		});
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
	    						Center(child : Text('Comapny Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny code  : "+obj.companyCode),
									onTap: () => {},          
								),
								Divider(color : Theme.of(context).accentColor,),
								ListTile(
									leading : Icon(Icons.add_location,size : 30.0,color : Theme.of(context).primaryColor,),
									title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
									color : Theme.of(context).primaryColor,
									fontWeight : FontWeight.w600)
									),
								),
								ListTile(
									title: new Text("City  name : "+obj.cityName),
									onTap: () => {},          
								),
								ListTile(
						            title: new Text("Pin Code : "+obj.pincode.toString()),
						            onTap: () => {},          
						        ),
						        ListTile(
						        	title : Text('Address'),
						        	subtitle : Text(obj.addressLine1+'\n'+obj.addressLine2+'\n'+obj.addressLine3),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.push(
						        			context,
						        			MaterialPageRoute(builder : (context)=> DisplayMap(double.parse(obj.latitude),double.parse(obj.longitude)))
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
												fit:BoxFit.fill
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
		_scaffoldKey = GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('Company Details'),
				actions : <Widget>[
					IconButton(
						icon : Icon(Icons.search),
						onPressed:(){
						  showSearch(context : context , delegate : DataSearch()).then((value){
						    if(value=='delete'){
						      showMessage('Deleted Successfully.!!');
						      
						    }
						    getNewData = true;
						    
						    
						  });
						  },
					)
				],
			),
			drawer : CustomDrawer(companySelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					Navigator.push(context,MaterialPageRoute(builder : (context)=>AddCompany())).then((value){
						if(value != null){
							showMessage('Record Successfully Added.!');
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
	    						Center(child : Text('Comapny Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title:Text("Comapny name : "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Comapny code  : "+obj.companyCode),
									onTap: () => {},          
								),
								Divider(color : Theme.of(context).accentColor,),
								ListTile(
									leading : Icon(Icons.add_location,size : 30.0,color : Theme.of(context).primaryColor,),
									title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
									color : Theme.of(context).primaryColor,
									fontWeight : FontWeight.w600)
									),
								),
								ListTile(
									title: new Text("City  name : "+obj.cityName),
									onTap: () => {},          
								),
								ListTile(
						            title: new Text("Pin Code : "+obj.pincode.toString()),
						            onTap: () => {},          
						        ),
						        ListTile(
						        	title : Text('Address'),
						        	subtitle : Text(obj.addressLine1+'\n'+obj.addressLine2+'\n'+obj.addressLine3),
						        ),
						        SizedBox(height : 10.0),
						        InkWell(
						        	onTap : (){
						        		Navigator.pushReplacement(
						        			context,
						        			MaterialPageRoute(builder : (context)=> DisplayMap(double.parse(obj.latitude),double.parse(obj.longitude)))
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
												fit:BoxFit.fill
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

  deleteCompany(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_COMPANY + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<CompanyClass> suggestionList = query.isEmpty?companies:companies.where((p)=>p.companyCode.startsWith(query)||
      p.companyName.startsWith(query)||p.addressLine1.startsWith(query)||p.addressLine2.startsWith(query)||
      p.addressLine3.startsWith(query)||p.cityName.startsWith(query)
      ||p.pincode.startsWith(query)
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
                        text : suggestionList[index].companyName.substring(0,query.length>=suggestionList[index].companyName.length ? suggestionList[index].companyName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].companyName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].companyCode+"\n"+suggestionList[index].cityName),
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
                                    deleteCompany(suggestionList[index].companyId,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder : (context) => UpdateCompany(suggestionList[index]))
                  );
                  //updateCity(obj);
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
