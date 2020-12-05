//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Models/Location/business_area_model.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Widgets/custom_drawer.dart';
import '../../Bloc/theme.dart';

class Area extends StatefulWidget{
	@override
	_AreaState createState ()=> _AreaState();
}

List<BusinessAreaClass> businessAreas = [];

class _AreaState extends State<Area>{


	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCountryData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;

	TextEditingController areaCode;
	TextEditingController areaName;
	TextEditingController areaDescription;

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;

 	bool stateAvail = false;
	bool cityAvail = false;

	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}

	deleteArea(int id) async{
		setState((){isLoading = true;});
		var r = await ApiCall.deleteRecord(Uri.GET_BUSINESS_AREA + "/$id");
		setState((){isLoading = false;getNewData = true;});
		showMessage('Record Successfully Deleted.!');
	}

	addData() async{
		setState((){isLoading = true;});
		String createdOn = DateTime.now().toString().replaceAll(' ','T');
		BusinessAreaClass c1 = new BusinessAreaClass.toPost(
			CurrentUser.id,
			countryValue,
			stateValue,
			areaName.text,
			areaCode.text,
			areaDescription.text,
			true,//isActive
			2,//device type
			cityValue,
			createdOn,
			CurrentUser.id
		);
		var c2 = await ApiCall.createRecord(Uri.GET_BUSINESS_AREA,c1.toMap());
		showMessage("Area Added with name ${c1.businessAreaName}");
		setState((){
	    	isLoading = false;
	    	getNewData = true;
	    	cityAvail = false;
	    	cityValue = -1;
	    	stateAvail = false;
	    	stateValue = -1;
	    	autoValidate = false;
	    	countryValue = -1;
	    });
	}

	updateData(id) async{
		setState((){isLoading = true;});
		String lastEditOn = DateTime.now().toString().replaceAll(' ','T');
		BusinessAreaClass c1 = new BusinessAreaClass.toPut(
		  CurrentUser.id,
		  areaName.text,
		  areaCode.text,
		  areaDescription.text,
		  lastEditOn,
		  true,//isActive
		  CurrentUser.id,//lastEditBy
		  2,//device type
		  2,//lastEditDeviceType
		  countryValue,
		  stateValue,
		  cityValue
		);
		var c2 = await ApiCall.updateRecord(Uri.GET_BUSINESS_AREA+'/$id',c1.toMapPut());
		showMessage("Area updated with name ${c1.businessAreaName}");
		setState((){
	    	isLoading = false;
	    	getNewData = true;
	    	cityAvail = false;
	    	cityValue = -1;
	    	stateAvail = false;
	    	stateValue = -1;
	    	autoValidate = false;
	    	countryValue = -1;
	    });
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

				cityMenuItems.clear();
				var r2= await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/$stateValue?ownerID=${CurrentUser.ownerId}');
				print(cityMenuItems);
				print(r2);
					for(int i=0;i<r2.length;i++){
					cityMenuItems.add(
						DropdownMenuItem<int>(
							value : r2[i]['businessCityForCompanyID'],
							child : Text(r2[i]['businessCityForCompanyName']),
						),
					);
				}
				print(cityMenuItems);
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

	Future<List<BusinessAreaClass>> getData() async {

		if(getNewData){

			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA+"/${CurrentUser.id}");
			//print(json);
			if(businessAreas.length!=0){
			  businessAreas.clear();
			}
			if(json=="nothing"){
			  return businessAreas;
			}
			for (int i = 0; i < json.length; i++) {


			  int _businessAreaForCompanyID = json[i]['businessAreaForCompanyID'];
			  int _companyID = json[i]['companyID'];
			  String _cityName = json[i]['cityName'];
			  String _businessAreaName = json[i]['businessAreaName'];
			  String _businessAreaCode = json[i]['businessAreaCode'];
			  String _businessAreaDescription = json[i]['businessAreaDescription'];
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
			  int _businessAreaID = json[i]['businessAreaID'];

			  BusinessAreaClass obj = new BusinessAreaClass.retrieve(
			    _businessAreaForCompanyID,
			    _companyID,
			    _cityName,
			    _businessAreaName,
			    _businessAreaCode,
			    _businessAreaDescription,
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
			    _createdBy,
			    _businessAreaID
			  );

			  businessAreas.add(obj);
			}
			return businessAreas;
		}
		else{
			return businessAreas;
		}
	}

	Widget makeCard(var obj) {

		// print()
	      return Column(
			  children: [
			    Card(
			        elevation: 7,
			        child: ListTile(
			            dense: false,
			            isThreeLine: true,
			            title: Text(obj.businessAreaName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
			            subtitle: Text(obj.cityName+"\n"+obj.stateName+" , "+obj.countryName),
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
			                                deleteArea(obj.businessAreaForCompanyID);
			                              },
			                            ),
			                          ],
			                        );
			                      });
			                }),

			                ],
			              ),
			            onTap: () {
			              updateArea(obj);
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
									title: new Text("Area name  : "+obj.businessAreaName),
									onTap: () => {},          
								),
								new ListTile(
								//leading: new Icon(Icons.videocam),
									title: new Text("Area Code : "+obj.businessAreaCode),
									onTap: () => {},          
								),
								new ListTile(
								//leading: new Icon(Icons.videocam),
									title: new Text("Area description  : "+obj.businessAreaDescription),
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

	addArea(){
    areaName =TextEditingController();
    areaCode = TextEditingController();
    areaDescription = TextEditingController();

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
							          			child : Text('Add new Area',textScaleFactor : 2.0,
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
																		cityMenuItems.clear();
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

																			stateValue = -1;
																			cityValue = -1;
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

																			cityValue = -1;
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
																		st((){
																			cityValue = v;
																		});
																	} : null,
																	value : cityValue == -1 ? null : cityValue,

																),
															),

															
							          					TextFormField(
								                  			controller : areaName,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Name',
								                  				labelText : 'Area Name',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Name.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaCode,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Code',
								                  				labelText : 'Area Code',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Code.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaDescription,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Decsription',
								                  				labelText : 'Area Decsription',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Decsription.' : null,
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
							        				cityValue = -1;
							        				cityAvail = false;
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


    updateArea(obj)async{
    areaName =TextEditingController();
    areaCode = TextEditingController();
    areaDescription = TextEditingController();

    areaName.text = obj.businessAreaName;
    areaCode.text = obj.businessAreaCode;
	areaDescription.text = obj.businessAreaDescription;

	stateAvail = true;
	cityAvail =true;

	countryValue = obj.countryID;
	stateValue = obj.stateID;
	cityValue = obj.cityID; 

	
	print('${obj.countryID} ${obj.stateID} ${obj.cityID}');

    return showDialog(
      context: context,
      barrierDismissible : false,
      builder: (c){
      	return FutureBuilder(
      		future : getCountries(isUpdate : true),
      		builder : (c,s){
      			if(s.data == null){
      				return Center(child : CircularProgressIndicator());
      			}
      			else{
      				print('cityMenuItems = $cityMenuItems');
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
							          			child : Text('Update Area',textScaleFactor : 2.0,
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
																		cityMenuItems.clear();
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

																			stateValue = -1;
																			cityValue = -1;
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

																			cityValue = -1;
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
																	onChanged : cityAvail ? (v){
																		FocusManager.instance.primaryFocus.unfocus();
																		st((){
																			cityValue = v;
																		});
																	} : null,
																	value : cityValue == -1 ? null : cityValue,

																),
															),

															
							          					TextFormField(
								                  			controller : areaName,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Name',
								                  				labelText : 'Area Name',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Name.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaCode,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Code',
								                  				labelText : 'Area Code',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Code.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaDescription,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Decsription',
								                  				labelText : 'Area Decsription',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Decsription.' : null,
								                  		),
								                  		SizedBox(height : 20.0),
								                  		InkWell(
								                  			onTap : (){
								                  				
								                  				if(_formKey.currentState.validate()){
								                  					updateData(obj.businessAreaForCompanyID);

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
							        				cityValue = -1;
							        				cityAvail = false;
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
				title : Text('Area Details'),
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
			drawer : CustomDrawer(areaSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				icon : Icon(Icons.add),
				label : Text('Add'),
				onPressed : (){
					addArea();
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
	bool getNewCountryData = true;

	GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	TextEditingController areaCode = TextEditingController();
	TextEditingController areaName = TextEditingController();
	TextEditingController areaDescription = TextEditingController();

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;

 	bool stateAvail = false;
	bool cityAvail = false;


 	updateData(id,context) async{
		String lastEditOn = DateTime.now().toString().replaceAll(' ','T');
		BusinessAreaClass c1 = new BusinessAreaClass.toPut(
		  CurrentUser.id,
		  areaName.text,
		  areaCode.text,
		  areaDescription.text,
		  lastEditOn,
		  true,//isActive
		  CurrentUser.id,//lastEditBy
		  2,//device type
		  2,//lastEditDeviceType
		  countryValue,
		  stateValue,
		  cityValue
		);
		var c2 = await ApiCall.updateRecord(Uri.GET_BUSINESS_AREA+'$id',c1.toMapPut());
		close(context,'update');
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

				cityMenuItems.clear();
				var r2= await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/$stateValue?ownerID=${CurrentUser.ownerId}');
					for(int i=0;i<r2.length;i++){
					cityMenuItems.add(
						DropdownMenuItem<int>(
							value : r2[i]['businessCityForCompanyID'],
							child : Text(r2[i]['businessCityForCompanyName']),
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

 	updateArea(obj,context)async{
    areaName =TextEditingController();
    areaCode = TextEditingController();
    areaDescription = TextEditingController();

    areaName.text = obj.businessAreaName;
    areaCode.text = obj.businessAreaCode;
	areaDescription.text = obj.businessAreaDescription;

	stateAvail = true;
	cityAvail =true;

	countryValue = obj.countryID;
	stateValue = obj.stateID;
	cityValue = obj.cityID; 

	


    return showDialog(
      context: context,
      barrierDismissible : false,
      builder: (c){
      	return FutureBuilder(
      		future : getCountries(isUpdate : true),
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
							          			child : Text('Update Area',textScaleFactor : 2.0,
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
																		cityMenuItems.clear();
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

																			stateValue = -1;
																			cityValue = -1;
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

																			cityValue = -1;
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
																		st((){
																			cityValue = v;
																		});
																	} : null,
																	value : cityValue == -1 ? null : cityValue,

																),
															),

															
							          					TextFormField(
								                  			controller : areaName,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Name',
								                  				labelText : 'Area Name',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Name.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaCode,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Code',
								                  				labelText : 'Area Code',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Code.' : null,
								                  		),
								                  		TextFormField(
								                  			controller : areaDescription,
								                  			decoration : InputDecoration(
								                  				hintText : 'Enter Area Decsription',
								                  				labelText : 'Area Decsription',
								                  			),
								                  			validator  : (v)=> v.isEmpty ? 'Enter Area Decsription.' : null,
								                  		),
								                  		SizedBox(height : 20.0),
								                  		InkWell(
								                  			onTap : (){
								                  				
								                  				if(_formKey.currentState.validate()){
								                  					updateData(obj.businessAreaForCompanyID,context);

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
							        				cityValue = -1;
							        				cityAvail = false;
							        				stateValue = -1;
							        				stateAvail = false;
							        				countryValue = -1;
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
								Center(child : Text('Client Details',textScaleFactor : 2.0,style : TextStyle(
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
									title: new Text("Area name  : "+obj.businessAreaName),
									onTap: () => {},          
								),
								new ListTile(
								//leading: new Icon(Icons.videocam),
									title: new Text("Area Code : "+obj.businessAreaCode),
									onTap: () => {},          
								),
								new ListTile(
								//leading: new Icon(Icons.videocam),
									title: new Text("Area description  : "+obj.businessAreaDescription),
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

  deleteArea(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_BUSINESS_AREA + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<BusinessAreaClass> suggestionList = query.isEmpty?businessAreas:businessAreas.where((p)=>p.cityName.startsWith(query)||
      p.businessAreaName.startsWith(query)||p.businessAreaCode.startsWith(query)||p.businessAreaDescription.startsWith(query)||
      p.companyName.startsWith(query)||p.companyName.startsWith(query)||p.countryName.startsWith(query)||p.stateName.startsWith(query)
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
                        text : suggestionList[index].businessAreaName.substring(0,query.length>=suggestionList[index].businessAreaName.length ? suggestionList[index].businessAreaName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].businessAreaName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].businessAreaName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].cityName+'\n'+suggestionList[index].stateName+","+suggestionList[index].countryName),
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
                                    deleteArea(suggestionList[index].businessAreaForCompanyID,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateArea(suggestionList[index],context);
                })),
        Divider(),
      ],
    );
      }
    );
  }
}