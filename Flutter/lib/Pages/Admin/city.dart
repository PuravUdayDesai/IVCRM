//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';

//custom
import '../../Models/Location/business_city_model.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Widgets/custom_drawer.dart';
import '../../Bloc/theme.dart';


class City extends StatefulWidget{
	@override
	_CityState createState()=> _CityState();
}

List<BusinessCityClass> businessCities = [];

class _CityState extends State<City>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool autoValidate2 = false;
	bool getNewCountryData = true;

	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState> _formKey;
	GlobalKey<FormState> _formKey2;
  	TextEditingController cityName;
  	TextEditingController cityCode;
  	TextEditingController cityDescription;

  	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;

 	bool stateAvail = false;




	//utils

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteCity(int id) async{
		setState((){isLoading = true;});
		var r = await ApiCall.deleteRecord(Uri.GET_BUSINESS_CITY + "/$id");
		setState((){isLoading = false;getNewData = true;});
		showMessage('Record Successfully Deleted.!');
	}

	createRecord(dataa) async {
		var response1 = await ApiCall.createRecord(Uri.GET_BUSINESS_CITY, dataa);
	}

	updateRecord(dataa, id) async {
	    var response1 = await ApiCall.updateRecord(Uri.GET_BUSINESS_CITY + "/$id", dataa);
	}


	Future<String> getCountries({isUpdate = false}) async{
		if(getNewCountryData){
			getNewCountryData = false;
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
			if(isUpdate){
				stateMenuItems.clear();
				var r= await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/$countryValue');
					for(int i=0;i<r.length;i++){
					stateMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['stateID'],
							child : Text(r[i]['stateName']),
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

	

	updateData(id) async{
		setState((){isLoading = true;});
		String lastEditOn = DateTime.now().toString().replaceAll(' ','T');
  		BusinessCityClass c1 = new BusinessCityClass.toPut(
          cityName.text,
          cityCode.text,
          cityDescription.text,
          true,//isActive
          2,//device type
          countryValue,
          stateValue,
          lastEditOn,
          CurrentUser.id,
          1,//lastEditDeviceType
        );
        var c2 = await updateRecord(c1.toPut(), id);
        showMessage(
          "City updated with name ${c1.cityName}");
        setState((){
        	isLoading = false;
        	getNewData = true;
        	stateAvail = false;
        	stateValue = -1;
        	autoValidate2 = false;
        	countryValue = -1;
       	});
	}

	addData() async{
		setState((){
			isLoading = true;
		});
		String createdOn = DateTime.now().toString().replaceAll(' ','T');
	    BusinessCityClass c1 = new BusinessCityClass.toPost(
	      CurrentUser.id,
	      cityName.text,
	      cityCode.text,
	      cityDescription.text,
	      true,//isActive
	      2,//device type
	      countryValue,
	      stateValue,
	      createdOn,
	      CurrentUser.id
	    );
	    var c2 = await createRecord(c1.toMap());
	    showMessage("City Added with name ${c1.cityName}");
	    setState((){
	    	isLoading = false;
	    	getNewData = true;
	    	stateAvail = false;
	    	stateValue = -1;
	    	autoValidate = false;
	    	countryValue = -1;
	    });
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
						return Center(child : Text('No Data Exists.'));
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

	Future<List<BusinessCityClass>> getData() async {

		if(getNewData){
			getNewData = false;

			var json = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+"/${CurrentUser.id}");

			if(businessCities.length!=0){
			  businessCities.clear();
			}
			if(json=="nothing"){
			  return businessCities;
			}
			for (int i = 0; i < json.length; i++) {


			  int _businessCityForCompanyID = json[i]['businessCityForCompanyID'];
			  int _companyID = json[i]['companyID'];
			  String _cityName = json[i]['cityName'];
			  String _cityCode = json[i]['cityCode'];
			  String _cityDescription = json[i]['cityDescription'];
			  String _lastEditOn = json[i]['lastEditOn'];
			  bool _isActive = json[i]['isActive'];
			  int _lastEditBy = json[i]['lastEditBy'];
			  int _deviceType = json[i]['deviceType'];
			  int _lastEditDeviceType = json[i]['lastEditDeviceType'];
			  int _countryID = json[i]['countryID'];
			  int _stateID = json[i]['stateID'];
			  int _cityID = json[i]['cityID'];
			  String _companyName = json[i]['companyName'];
			  String _countryName = json[i]['countryName'];
			  String _stateName = json[i]['stateName'];
			  String _createdOn = json[i]['createdOn'];
			  int _createdBy = json[i]['createdBy'];
			  BusinessCityClass obj = new BusinessCityClass.retrieve(
			    _businessCityForCompanyID,
			    _companyID,
			    _cityName,
			    _cityCode,
			    _cityDescription,
			    _lastEditOn,
			    _isActive,
			    _lastEditBy,
			    _deviceType,
			    _lastEditDeviceType,
			    _countryID,
			    _stateID,
			    _cityID,
			    _companyName,
			    _countryName,
			    _stateName,
			    _createdOn,
			    _createdBy
			  );

			  businessCities.add(obj);
			}
			return businessCities;
		}
		else{
			return businessCities;
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
				        title: Text(obj.cityName,style : TextStyle(color : Theme.of(context).primaryColor ,fontWeight : FontWeight.bold)),
				        subtitle: Text(obj.stateName+"\n"+obj.countryName),
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
			                                deleteCity(obj.businessCityForCompanyID);
			                              },
			                            ),
				                      ],
				                    );
				                  });
				            }),

				            ],
				          ),
				        onTap: () {
				          updateCity(obj);
				        })),
				Divider(),
			],
    );
  }

  void _bottomSheet(context,obj){

    String createdOnFormat = obj.createdOn.toString();
    List<String> createdOnList = createdOnFormat.split("T");
    List<String> seprateDate = createdOnList[0].split("-");
    String finalCreatedOn=seprateDate[2]+"-"+seprateDate[1]+"-"+seprateDate[0]+" at "+createdOnList[1].substring(0,8);

    String lastEditOnFormat = obj.lastEditOn.toString();
    List<String> lastEditOnList = lastEditOnFormat.split("T");
    List<String> seprateDate2 = lastEditOnList[0].split("-");
    String finalLastEditOn=seprateDate2[2]+"-"+seprateDate2[1]+"-"+seprateDate2[0]+" at "+lastEditOnList[1].substring(0,8);

    showModalBottomSheet(
    	context : context,
    	shape : RoundedRectangleBorder(
    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
    	),
    	builder : (BuildContext c){
    		return Padding(
    			padding : const EdgeInsets.all(16.0),
    			child : SingleChildScrollView(
    				child : Column(
    					children  : <Widget>[
    						Center(child : Text('City Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
    						SizedBox(height : 10.0),
    						ListTile(
								leading : Icon(Icons.add_location,size : 30.0,color : Theme.of(context).primaryColor,),
								title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.w600)),
							),
							new ListTile(
								title: new Text("Country  name : "+obj.countryName),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("State  name : "+obj.stateName),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("City  name : "+obj.cityName),
								onTap: () => {},          
							),
							new ListTile(
							//leading: new Icon(Icons.videocam),
								title: new Text("City Code : "+obj.cityCode),
								onTap: () => {},          
							),
							new ListTile(
							//leading: new Icon(Icons.videocam),
								title: new Text("City description  : "+obj.cityDescription),
								onTap: () => {},          
							),
							Divider(color : Theme.of(context).accentColor,),
				            ListTile(
				              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
				                color : Theme.of(context).primaryColor,
				                fontWeight : FontWeight.w600)),
				            ),
							new ListTile(
								title: new Text("Created On : "+finalCreatedOn),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("Last edit on : "+finalLastEditOn),
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

  updateCity(obj) async{
  	cityName =TextEditingController();
    cityCode = TextEditingController();
    cityDescription = TextEditingController();

    cityName.text = obj.cityName;
    cityCode.text = obj.cityCode;
    cityDescription.text = obj.cityDescription;

    countryValue = obj.countryID;
    stateValue = obj.stateID;
    stateAvail = true;

    

    return showDialog(
    	context : context,
    	barrierDismissible : false,
    	builder : (c){
    		return FutureBuilder(
    			future : getCountries(isUpdate : true),
    			builder :(c,s){
    				if(s.data == null){
    					return Center(child : CircularProgressIndicator());
    				}
    				else{
    					return StatefulBuilder(
    						builder :(c,st){
    							return Dialog(
    								shape : RoundedRectangleBorder(
    									borderRadius : BorderRadius.circular(8.0)),
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
											          			child : Text('Update City',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey2,
											          			autovalidate : autoValidate2,
											          			child : Column(
											          				children : <Widget>[
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

																						stateValue = -1;
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
																					st((){
																						stateValue = v;
																					});
																				} : null,
																				value : stateValue == -1 ? null : stateValue,
																			),
																		),
											          					TextFormField(
												                  			controller : cityName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Name',
												                  				labelText : 'City Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : cityCode,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Code',
												                  				labelText : 'City Code',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Code.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : cityDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Decsription',
												                  				labelText : 'City Decsription',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Decsription.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey2.currentState.validate()){
												                  					updateData(obj.businessCityForCompanyID);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate2 = true;
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
											        				stateValue = -1;
											        				stateAvail = false;
											        				countryValue = -1;
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

  addCity(){
    cityName =TextEditingController();
    cityCode = TextEditingController();
    cityDescription = TextEditingController();
    return showDialog(
      context: context,
      barrierDismissible : false,
      builder: (c){
      	return FutureBuilder(
      		future : getCountries(),
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
							          			child : Text('Add new City',textScaleFactor : 2.0,
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

																		stateValue = -1;
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
																	st((){
																		stateValue = v;
																	});
																} : null,
																value : stateValue == -1 ? null : stateValue,
															),
														),
							          					TextFormField(
								                  			controller : cityName,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter City Name',
								                  				labelText : 'City Name',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter City Name.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : cityCode,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter City Code',
								                  				labelText : 'City Code',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter City Code.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : cityDescription,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter City Decsription',
								                  				labelText : 'City Decsription',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter City Decsription.' : null,
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
							        				stateValue = -1;
							        				stateAvail = false;
							        				countryValue = -1;
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
  void initState(){
    super.initState();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    _formKey = GlobalKey<FormState>();
    _formKey2 = GlobalKey<FormState>();
    cityName = TextEditingController();
    cityCode = TextEditingController();
    cityDescription = TextEditingController();
  }
	@override
	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				title : Text('City Details'),
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
					    else if(value == 'update'){
					    	showMessage('Record Successfully updated.!!');
					    	setState((){
						      getNewData = true;
						    });	
					    }
					  });
					  },
					)
				],
			),
			drawer : CustomDrawer(citySelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				shape: RoundedRectangleBorder(
            	borderRadius: BorderRadius.all(Radius.circular(16.0))),
				onPressed : (){
          			addCity();
				},
			),
		);
	}
}


class DataSearch extends SearchDelegate<String>
{
	bool autoValidate = false;
	bool autoValidate2 = false;
	bool getNewCountryData = true;
	GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  	TextEditingController cityName = TextEditingController();
  	TextEditingController cityCode = TextEditingController();
  	TextEditingController cityDescription = TextEditingController();

  	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;

 	bool stateAvail = false;

  void _bottomSheet(context,obj){

    String createdOnFormat = obj.createdOn.toString();
    List<String> createdOnList = createdOnFormat.split("T");
    List<String> seprateDate = createdOnList[0].split("-");
    String finalCreatedOn=seprateDate[2]+"-"+seprateDate[1]+"-"+seprateDate[0]+" at "+createdOnList[1].substring(0,8);

    String lastEditOnFormat = obj.lastEditOn.toString();
    List<String> lastEditOnList = lastEditOnFormat.split("T");
    List<String> seprateDate2 = lastEditOnList[0].split("-");
    String finalLastEditOn=seprateDate2[2]+"-"+seprateDate2[1]+"-"+seprateDate2[0]+" at "+lastEditOnList[1].substring(0,8);

    showModalBottomSheet(
    	context : context,
    	shape : RoundedRectangleBorder(
    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
    	),
    	builder : (BuildContext c){
    		return Padding(
    			padding : const EdgeInsets.all(16.0),
    			child : SingleChildScrollView(
    				child : Column(
    					children  : <Widget>[
    						Center(child : Text('City Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
    						SizedBox(height : 10.0),
    						ListTile(
								leading : Icon(Icons.add_location,size : 30.0,color : Theme.of(context).primaryColor,),
								title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.w600)),
							),
							new ListTile(
								title: new Text("Country  name : "+obj.countryName),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("State  name : "+obj.stateName),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("City  name : "+obj.cityName),
								onTap: () => {},          
							),
							new ListTile(
							//leading: new Icon(Icons.videocam),
								title: new Text("City Code : "+obj.cityCode),
								onTap: () => {},          
							),
							new ListTile(
							//leading: new Icon(Icons.videocam),
								title: new Text("City description  : "+obj.cityDescription),
								onTap: () => {},          
							),
							Divider(color : Theme.of(context).accentColor,),
				            ListTile(
				              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
				                color : Theme.of(context).primaryColor,
				                fontWeight : FontWeight.w600)),
				            ),
							new ListTile(
								title: new Text("Created On : "+finalCreatedOn),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("Device type : "+obj.deviceType.toString()),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("Last edit on : "+finalLastEditOn),
								onTap: () => {},          
							),
							new ListTile(
								title: new Text("Last edit device type : "+obj.lastEditDeviceType.toString()),
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

  updateData(id,c) async{
		String lastEditOn = DateTime.now().toString().replaceAll(' ','T');
  		BusinessCityClass c1 = new BusinessCityClass.toPut(
          cityName.text,
          cityCode.text,
          cityDescription.text,
          true,//isActive
          2,//device type
          countryValue,
          stateValue,
          lastEditOn,
          CurrentUser.id,
          1,//lastEditDeviceType
        );
        var c2 =
        await updateRecord(c1.toPut(), id);
       	close(c,'update');
	}

  	updateRecord(dataa, id) async {
	    var response1 = await ApiCall.updateRecord(Uri.GET_BUSINESS_CITY + "/$id", dataa);
	}


	Future<String> getCountries({isUpdate = false}) async{
		if(getNewCountryData){
			getNewCountryData = false;
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
			if(isUpdate){
				stateMenuItems.clear();
				var r= await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/$countryValue');
					for(int i=0;i<r.length;i++){
					stateMenuItems.add(
						DropdownMenuItem<int>(
							value : r[i]['stateID'],
							child : Text(r[i]['stateName']),
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

  updateCity(obj,c) {
  	cityName =TextEditingController();
    cityCode = TextEditingController();
    cityDescription = TextEditingController();

    cityName.text = obj.cityName;
    cityCode.text = obj.cityCode;
    cityDescription.text = obj.cityDescription;

    countryValue = obj.countryID;
    stateValue = obj.stateID;
    stateAvail = true;

    

    return showDialog(
    	context : c,
    	barrierDismissible : false,
    	builder : (c4){
    		return FutureBuilder(
    			future : getCountries(isUpdate : true),
    			builder :(c1,s){
    				if(s.data == null){
    					return Center(child : CircularProgressIndicator());
    				}
    				else{
    					return StatefulBuilder(
    						builder :(c2,st){
    							return Dialog(
    								shape : RoundedRectangleBorder(
    									borderRadius : BorderRadius.circular(8.0)),
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
											          			child : Text('Update City',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(c).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey2,
											          			autovalidate : autoValidate2,
											          			child : Column(
											          				children : <Widget>[
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

																						stateValue = -1;
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
																					st((){
																						stateValue = v;
																					});
																				} : null,
																				value : stateValue == -1 ? null : stateValue,
																			),
																		),
											          					TextFormField(
												                  			controller : cityName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Name',
												                  				labelText : 'City Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : cityCode,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Code',
												                  				labelText : 'City Code',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Code.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : cityDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter City Decsription',
												                  				labelText : 'City Decsription',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter City Decsription.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey2.currentState.validate()){
												                  					updateData(obj.businessCityForCompanyID,c);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate2 = true;
												                  					});
												                  				}
												                  			},
												                  			child : Container(
												                  				height : 50.0,
												                  				width : 175.0,
												                  				decoration : BoxDecoration(
												                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
												                  					color : Theme.of(c).accentColor,
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
											        			Navigator.of(c4).pop();
											        				stateValue = -1;
											        				stateAvail = false;
											        				countryValue = -1;
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

  deleteCity(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_BUSINESS_CITY + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<BusinessCityClass> suggestionList = query.isEmpty?businessCities:businessCities.where((p)=>p.cityName.startsWith(query)||
      p.cityDescription.startsWith(query)||p.companyName.startsWith(query)||p.countryName.startsWith(query)||
      p.stateName.startsWith(query)
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
                        text : suggestionList[index].cityName.substring(0,query.length>=suggestionList[index].cityName.length ? suggestionList[index].cityName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].cityName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].cityName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].stateName+"\n"+suggestionList[index].countryName),
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
                                    deleteCity(suggestionList[index].businessCityForCompanyID,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateCity(suggestionList[index],context);
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
