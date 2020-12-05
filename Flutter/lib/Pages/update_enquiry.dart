//default
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "dart:core";

//plugin
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';


//custom
import "../Api_Services/ApiCall.dart";
import "../Api_Services/Uri.dart";
import '../Models/Company/enquiry_model.dart';
import '../User/current_user.dart';
import '../Models/Company/client_model.dart';
import '../Models/Company/product_model.dart';
import '../Models/Company/enquiry_access_model.dart';
import '../Models/Company/enquiry_product_model.dart';
import '../Bloc/theme.dart';






class UpdateEnquiry extends StatefulWidget{
	final EnquiryClass obj;
	UpdateEnquiry(this.obj);
	_UpdateEnquiryState createState() => _UpdateEnquiryState();
}

class _UpdateEnquiryState extends State<UpdateEnquiry> with SingleTickerProviderStateMixin{

	TabController tabController;
	bool showFab = false;
	bool once= true;
	bool index=true;
	bool anyUpdate = false;
	String page ='';
	LatLng _center;

	bool isLoadingProduct = false;
	bool isLoadingAccessList = false;

	GlobalKey<ScaffoldState> _scaffoldKey;
	GlobalKey<FormState> _formKey1=GlobalKey<FormState>();
	GlobalKey<FormState> _formKey2=GlobalKey<FormState>();
	GlobalKey<FormState> _formKey3=GlobalKey<FormState>();
	GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();

	List<ClientClass> clients = [];
	List<ProductClass> products = [];
	List<int> tempCompanyExecutiveId = [];
	List<Widget> productDetails = [];
	List<EnquiryProductClass> enquiryProducts = [];
	List<EnquiryAccessClass> enquiryAccessLists = [];
	List<EnquiryAccessClass> enquiryNonAccessList = [];

	TextEditingController addressLine1;
	TextEditingController addressLine2;
	TextEditingController addressLine3;
	TextEditingController pincode;
	TextEditingController enquiryRemarks;
	TextEditingController startDate;
	TextEditingController endDate;
	TextEditingController companyName;
	TextEditingController clientName;
	TextEditingController contactPerson;
	TextEditingController emailId;
	TextEditingController contactNumber;
	TextEditingController ticketRemarks;

	bool getNewEnquiryTypeData = true;
	bool getNewClientData = true;
	bool getNewProductData = true;
	bool getNewAccessListData = true;
	bool getNewNonAccessListData = true;
	bool getNewCountryData = true;

	bool _autoValidate1 = false;
	bool _autoValidate2 = false;
	bool _autoValidate3 = false;
	bool _autoValidate4 = false;

	List<DropdownMenuItem<String>> enquiryTypeMenuItems = [];
	List<DropdownMenuItem<String>> clientMenuItems = [];
	List<DropdownMenuItem<String>> productMenuItems = [];
	List<DropdownMenuItem<String>> statusMenuItems = [];
	List<DropdownMenuItem<String>> priorityMenuItems = [];

	List<DropdownMenuItem<int>> countryMenuItems = [];
 	List<DropdownMenuItem<int>> stateMenuItems = [];
 	List<DropdownMenuItem<int>> cityMenuItems = [];
 	List<DropdownMenuItem<int>> areaMenuItems = [];

 	int countryValue = -1;
 	int stateValue = -1;
 	int cityValue = -1;
 	int areaValue = -1;

 	bool stateAvail = true;
	bool cityAvail = true;
	bool areaAvail = true;

	String enquiryTypeValue;
	String clientValue ;
	String productValue = '';
	String statusValue = '';
	String priorityValue = '';

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);
	Icon thirdIcon = Icon(Icons.filter_3);
	Icon fourthIcon = Icon(Icons.filter_4);
	Icon fifthIcon = Icon(Icons.filter_5);
	bool firstCompleted=false;
	bool secondCompleted=false;
	bool thirdCompleted=false;
	bool fourthCompleted=false;
	bool fifthCompleted=false;

	var completed=[true,true,true];

	@override
	void initState(){
		getCurrentLocation();
		tabController = TabController(vsync : this,initialIndex : 0,length : 5);
		clientValue = widget.obj.clientId.toString();
		enquiryTypeValue = widget.obj.enquiryType.toString();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
		addressLine1 = new TextEditingController();
		addressLine2 = new TextEditingController();
		addressLine3 = new TextEditingController();
		pincode = new TextEditingController();
		enquiryRemarks = new TextEditingController();
		startDate = new TextEditingController();
		endDate = new TextEditingController();
		companyName= new TextEditingController();
		clientName = new TextEditingController();
		contactPerson = new TextEditingController();
		emailId = new TextEditingController();
		contactNumber = new TextEditingController();
		//ticketRemarks = new TextEditingController();

		countryValue = widget.obj.countryId;
		stateValue = widget.obj.stateId;
		cityValue = widget.obj.cityId;
		areaValue = widget.obj.areaId;


		addressLine1.text = widget.obj.addressLine1;
		addressLine2.text = widget.obj.addressLine2;
		addressLine3.text = widget.obj.addressLine3;
		pincode.text =  widget.obj.pincode;
		enquiryRemarks.text = widget.obj.enquiryRemarks;
		startDate.text = widget.obj.startDateAndTime;
		endDate.text = widget.obj.deadlineDateAndTime;
		companyName.text = widget.obj.companyName;
		clientName.text = widget.obj.clientName;
		contactPerson.text = widget.obj.contactPerson;
		emailId.text = widget.obj.emailId;
		contactNumber.text = widget.obj.contactNumber;
		_scaffoldKey = new GlobalKey<ScaffoldState>();
		
		for(int i=0;i<widget.obj.enquiryProductList.length;i++){
			productDetails.add(makeCard(widget.obj.enquiryProductList[i]));
		}

		tabController.addListener((){
			if(tabController.index==3||tabController.index==4){
				showFab = true;
			}
			else{
				showFab = false;
			}
			setState((){});
		});
		
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '1',
				child : Text('Low'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '2',
				child : Text('Normal'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '3',
				child : Text('High'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<String>(
				value : '4',
				child : Text('Immediate'),
			),
		);
			
	}

	bool isEmailContains(String input) {
		return input.contains("@") && input.contains(".");
	}

	bool isValidEmail(String input) {
		final RegExp regex = new RegExp(
		r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
		return regex.hasMatch(input);
	}

	void showMessage(String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color,
        content: new Text(message, style: TextStyle(color: Colors.white))));
  	}

  	Future<String> getCountry() async{
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

			var response3 = await ApiCall.getDataFromApi(Uri.GET_STATE_FROM_COUNTRY+'/${widget.obj.countryId.toString()}');
			stateMenuItems.clear();
			for(int i=0;i<response3.length;i++){
				stateMenuItems.add(
					DropdownMenuItem<int>(
						value : response3[i]['stateID'],
						child : Text(response3[i]['stateName']),
					)
				);
			}

			var response4 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY_FROM_STATE+'/${widget.obj.stateId.toString()}?ownerID=${CurrentUser.ownerId}');
			cityMenuItems.clear();
			for(int i=0;i<response4.length;i++){
				cityMenuItems.add(
					DropdownMenuItem<int>(
						value : response4[i]['businessCityForCompanyID'],
						child : Text(response4[i]['businessCityForCompanyName']),
					)
				);
			}

			var response5 = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA_FROM_BUSINESS_CITY+'/${widget.obj.cityId.toString()}?ownerID=${CurrentUser.ownerId}');
			areaMenuItems.clear();
			for(int i=0;i<response5.length;i++){
				areaMenuItems.add(
					DropdownMenuItem<int>(
						value : response5[i]['businessAreaForCompanyID'],
						child : Text(response5[i]['businessAreaForCompanyName']),
					)
				);
			}
  		}
  		else{
  			return 'done';
  		}
  	}

	BoxDecoration myBoxDecoration() {
  		return BoxDecoration(
    		border: Border.all(
    			width : 1.0,
    			color : Theme.of(context).primaryColor,
    		),
    		borderRadius: BorderRadius.all(
        		Radius.circular(5.0) 
    		),
  		);
	}

	Future<String> getEnquiryType() async{

		if(getNewEnquiryTypeData){
			getNewEnquiryTypeData = false;
			var r = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY_TYPE+"/${CurrentUser.companyId}");
			enquiryTypeMenuItems.clear();
			for(int i=0;i<r.length;i++){
				enquiryTypeMenuItems.add(
					DropdownMenuItem<String>(
						value : r[i]['enquiryTypeId'].toString(),
						child : Text(r[i]['enquiryTypeName']),
					),
				);
			}
			return 'done';
		}
		else{
			return 'done';
		}
		
	}

	Future<String> getClients() async{

		if(getNewClientData){
			getNewClientData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_CLIENT+"/company/${CurrentUser.companyId}");
			clientMenuItems.clear();
			clients.clear();
			for(int i=0;i<json.length;i++){
				int _clientId = json[i]['clientId'];
			      String _contactName = json[i]['contactName'];
			      String _contactPerson = json[i]['contactPerson'];
			      String _emailId = json[i]['emailId'];
			      String _contactNumber = json[i]['contactNumber'];
			      int _companyId = json[i]['companyId'];
			      String _companyName = json[i]['companyName'];
			      int _countryId = json[i]['countryId'];
			      String _countryName = json[i]['countryName'];
			      int _stateId = json[i]['stateId'];
			      String _stateName = json[i]['stateName'];
			      int _cityId = json[i]['cityId'];
			      String _cityName = json[i]['cityName'];
			      int _areaId = json[i]['areaId'];
			      String _areaName = json[i]['areaName'];
			      String _addressLine1 = json[i]['addressLine1'];
			      String _addressLine2 = json[i]['addressLine2'];
			      String _addressLine3 = json[i]['addressLine3'];
			      String _pincode = json[i]['pincode'];
			      String _latitude = json[i]['latitude'];
			      String _longitude = json[i]['longitude'];
			      String _clientCreatedOn = json[i]['clientCreatedOn'];
			      int _clientCreatedBy = json[i]['clientCreatedBy'];
			      String _clientLastEditOn = json[i]['clientLastEditOn'];
			      int _clientLastEditBy = json[i]['clientLastEditBy'];
			      bool _clientIsActive = json[i]['clientIsActive'];
			      String _clientLocationCreatedOn = json[i]['clientLocationCreatedOn'];
			      int _clientLocationCreatedBy = json[i]['clientLocationCreatedBy'];
			      String _clientLocationLastEditOn = json[i]['clientLocationLastEditOn'];
			      int _clientLocationLastEditBy = json[i]['clientLocationLastEditBy'];
			      bool _clientLocationIsActive = json[i]['clientLocationIsActive'];
					clientMenuItems.add(
						DropdownMenuItem<String>(
							value : json[i]['clientId'].toString(),
							child : Text(json[i]['contactName']),
						),
					);
					ClientClass obj = new ClientClass.retrieve(
				        _clientId,
				      _contactName,
				      _contactPerson,
				      _emailId,
				      _contactNumber,
				      _companyId,
				      _companyName,
				      _countryId,
				      _countryName,
				      _stateId,
				      _stateName,
				      _cityId,
				      _cityName,
				      _areaId,
				      _areaName,
				      _addressLine1,
				      _addressLine2,
				      _addressLine3,
				      _pincode,
				      _latitude,
				      _longitude,
				      _clientCreatedOn,
				      _clientCreatedBy,
				      _clientLastEditOn,
				      _clientLastEditBy,
				      _clientIsActive,
				      _clientLocationCreatedOn,
				      _clientLocationCreatedBy,
				      _clientLocationLastEditOn,
				      _clientLocationLastEditBy,
				      _clientLocationIsActive
				      );
				      
				      clients.add(obj);
			}
			return 'done';
		}
		else{
			return 'done';
		}
		
	}

	getClientDetails(int id){
		clientValue = id.toString();
		for(int i=0;i<clients.length;i++){
			if(clients[i].clientId==id){
				clientName.text = clients[i].contactName;
				contactPerson.text = clients[i].contactPerson;		
				emailId.text = clients[i].emailId;
				contactNumber.text = clients[i].contactNumber;
				break;
			}
		}
		setState((){});
		
	}

	Future<List<EnquiryProductClass>> getProducts() async{
		
		
		if(getNewProductData){
			getNewProductData = false;

			
			var json = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY+"/enquiryProduct/${widget.obj.enquiryId}");
			products.clear();
			enquiryProducts.clear();
			for (int i = 0; i < json.length; i++) {
				int _enquiryId = json[i]['enquiryId'];
			    int _enquiryProductId = json[i]['enquiryProductId'];
			    int _productId = json[i]['productId'];
			    String _productName = json[i]['productName'];
			    double _productCharges = json[i]['productCharges'];

			    EnquiryProductClass obj = EnquiryProductClass(
			    	_enquiryId,
					_enquiryProductId,
					_productId,
					_productName,
					_productCharges
			    );

			    enquiryProducts.add(obj);
		    
		    }
		    return enquiryProducts;
		}
		else{
			return enquiryProducts;
		}
		
	}

	Widget makeCard(var obj){
		return Card(
			elevation : 7.0,
			child : ListTile(
				title : Text(obj.productName),
				subtitle : Text(obj.productCharges.toString()),
				contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
				onTap : (){},
				trailing : IconButton(
					icon : Icon(Icons.delete),
					onPressed : (){
						deleteRecord(obj.enquiryProductId);
					},
				),
			),
		);
	}

	deleteRecord(int id)async{
		setState((){
			isLoadingProduct = true;
		});
		var r = await ApiCall.deleteRecord(Uri.GET_ENQUIRY+'/product/${id}?companyExecutiveId=${CurrentUser.ownerId}');
		setState((){
			isLoadingProduct = false;
			anyUpdate = true;
			getNewProductData = true;
		});	
	}

	Future<String> getRemainingProducts() async{
		if(once){
			var json = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY+'/enquiryNonAddedProducts/${widget.obj.enquiryId}');
			if(json == 'nothing'){
				return 'empty';
			}
			var json1 = await ApiCall.getDataFromApi(Uri.GET_STATUS+'/owner/${CurrentUser.ownerId}');
			productMenuItems.clear();
			statusMenuItems.clear();
			// print(json.length.toString());
			// print(json1.length.toString());
			for(int i=0;i<json.length;i++){
				productMenuItems.add(
					DropdownMenuItem<String>(
						value : json[i]['id'].toString(),
						child : Text(json[i]['productName']),
					),
				);
			}
			//print('ahiya');

			for(int i=0;i<json1.length;i++){
				statusMenuItems.add(
					DropdownMenuItem<String>(
						value : json1[i]['statusId'].toString(),
						child : Text(json1[i]['statusName']),
					),
				);
			}
			//print('ahiya 2');
			once = false;	
		}
		
		return 'done';
	}


	void addEnquiryProduct() async{
		setState((){
			isLoadingProduct = true;
		});
		String createdOn = DateTime.now().toString().substring(0,19);
		EnquiryClass e1 = EnquiryClass.toPostEnquiryProduct(
			widget.obj.enquiryId,
			int.parse(productValue),
			int.parse(statusValue),
			ticketRemarks.text,
			int.parse(priorityValue),
			CurrentUser.ownerId,
			createdOn
		);

		EnquiryClass e2 = await createEnquiryProduct(e1.toMapEnquiryProduct());
		//productDetails.add(makeCard());
		once = true;
		productValue = '';
		statusValue = '';
		priorityValue = '';
		setState((){
			anyUpdate = true;
			getNewProductData = true;
			isLoadingProduct = false;
		});
	}

	createEnquiryProduct(data) async{
		var r = await ApiCall.createRecord(Uri.GET_ENQUIRY+'/product',data);
	}


	Future<bool> getRemainingProductDetails(){
		ticketRemarks = new TextEditingController();
		return showDialog(
			context : context,
			builder : (c1){
				return StatefulBuilder(
					builder : (c2,setState){
						return FutureBuilder(
							future : getRemainingProducts(),
							builder : (c,s){
								if(s.data==null){
									return Center(
										child : CircularProgressIndicator(),
									);
								}else{
								if(s.data == 'empty'){

									return AlertDialog(
										title : Text(
											'ERROR',
											style : TextStyle(
												color : Theme.of(context).primaryColor,
												fontSize : 20.0,
											),
										),
										content : Text('There are no products to add.'),
										actions : <Widget>[
											FlatButton(
												child : Text(
													'OK',
													style : TextStyle(
														color : Theme.of(context).primaryColor,
													),
												),
												onPressed : (){
													Navigator.of(c1).pop();
												}
											),
										],
									);
								}
								else{
									return Dialog(
										child : Padding(
											padding : const EdgeInsets.all(0.0),
											child : Container(
												height : 330.0,
												width : 200.0,
												child : Form(
													key : _formKey4,
													autovalidate : _autoValidate4,
													child : ListView(
														children : <Widget>[
															Container(
																height : 80.0,
																color : Theme.of(context).primaryColor,
																child : Text(
																	'Add Product to Enquiry',
																	style : TextStyle(
																		color : Colors.white,
																		fontSize : 20.0,

																	),
																),
																alignment : Alignment(-0.8,-0.1),
															),
															Padding(
																padding : const EdgeInsets.only(left : 10.0,right : 10.0),
																child : DropdownButtonHideUnderline(
																	child : DropdownButtonFormField<String>(
																		validator : (v) => v == null ? 'Please Select Product' : null,
																		decoration : InputDecoration(
																			labelText : 'Product',
																			hintText : 'Select Product',
																		), 
																		isDense : true,
																		autovalidate : _autoValidate4,
																		items : productMenuItems,
																		onChanged : (v){
																			setState((){
																				productValue = v ;
																			});
																		},
																		value : productValue == '' ? null : productValue,
																	),
																),
															),
															Padding(
																padding : const EdgeInsets.only(left : 10.0,right : 10.0),
																child : DropdownButtonHideUnderline(
																	child : DropdownButtonFormField<String>(
																		validator : (v) => v == null ? 'Please Select Status' : null,
																		decoration : InputDecoration(
																			labelText : 'Status',
																			hintText : 'Select Status',
																		), 
																		isDense : true,
																		autovalidate : _autoValidate4,
																		items : statusMenuItems,
																		onChanged : (v){
																			setState((){
																				statusValue = v ;
																			});
																		},
																		value : statusValue == '' ? null : statusValue,
																	),
																),
															),
															Padding(
																padding : const EdgeInsets.only(left : 10.0,right : 10.0),
																child : DropdownButtonHideUnderline(
																	child : DropdownButtonFormField<String>(
																		validator : (v) => v == null ? 'Please Select Priority' : null,
																		decoration : InputDecoration(
																			labelText : 'Priority',
																			hintText : 'Select Priority',
																		), 
																		isDense : true,
																		autovalidate : _autoValidate4,
																		items : priorityMenuItems,
																		onChanged : (v){
																			setState((){
																				priorityValue = v ;
																			});
																		},
																		value : priorityValue == '' ? null : priorityValue,
																	),
																),
															),
															Padding(
																padding : const EdgeInsets.only(left : 10.0,right : 10.0),
																child : TextFormField(
																	controller : ticketRemarks,
																	decoration : InputDecoration(
																		labelText : 'Ticket Remarks',
																		hintText : 'Enter Ticket Remarks',
																	),
																	validator : (v) => v.isEmpty ? 'Ticket Remarks is required.' : null,
																),
															),
															Row(
									                          children: <Widget>[
									                            Expanded(
									                              child: Padding(
									                                padding: EdgeInsets.only(top: 50.0, left: 10.0),
									                                child: FlatButton(
									                                  textColor: Colors.black,
									                                  color: Colors.white,
									                                  shape: RoundedRectangleBorder(
									                                    borderRadius:
									                                        new BorderRadius.circular(4.0),
									                                    side: BorderSide(color: Theme.of(context).primaryColor),
									                                  ),
									                                  child: Text(
									                                    "Save",
									                                    style: TextStyle(
									                                      fontWeight: FontWeight.bold,
									                                      fontSize: 20.0,
									                                      color: Colors.blueGrey,
									                                    ),
									                                  ),
									                                  onPressed: ()  {
									                                    
									                                    setState(() {
									                                      if (_formKey4.currentState
									                                          .validate()) {
									                                        //print(_fbKey.currentState.value);
									                                        
									                                      
									                                    addEnquiryProduct();

									                                    Navigator.of(context, rootNavigator: true)
									                                        .pop();
									                                        _autoValidate4 = false;
									                                      } else {
									                                        _autoValidate4 = true;
									                                      }
									                                    });
									                                  },
									                                ),
									                              ),
									                            ),
									                            Expanded(
									                              child: Padding(
									                                padding: EdgeInsets.only(
									                                    top: 50.0, left: 10.0, right: 10.0),
									                                child: FlatButton(
									                                  textColor: Colors.black,
									                                  color: Colors.white,
									                                  shape: RoundedRectangleBorder(
									                                    borderRadius:
									                                        new BorderRadius.circular(4.0),
									                                    side: BorderSide(color: Theme.of(context).primaryColor),
									                                  ),
									                                  child: Text(
									                                    "Cancel",
									                                    style: TextStyle(
									                                      fontWeight: FontWeight.bold,
									                                      fontSize: 20.0,
									                                      color: Colors.blueGrey,
									                                    ),
									                                  ),
									                                  onPressed: () {
									                                    Navigator.of(c1).pop();
									                                  },
									                                ),
									                              ),
									                            ),
									                          ],
									                        ),
														]
													),
												),
											),
										),
									);
								}}
							}
						);
					}
				);
			}
		); 
	}

	Future<List<EnquiryAccessClass>> getAccessList() async{

		if(getNewAccessListData){
			getNewAccessListData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY+'/enquiryAccessList/${widget.obj.enquiryId}');
			enquiryAccessLists.clear();
			for(int i=0;i<json.length;i++){
				int _enquiryAccessId = json[i]['enquiryAccessId'];
				int _enquiryId = json[i]['enquiryId'];
				int _companyExecutiveId = json[i]['companyExecutiveId'];
				String _companyExecutiveName = json[i]['companyExecutiveName'];
				String _accessApplicationTime = json[i]['accessApplicationTime'];
				bool _ownerFlag = json[i]['ownerFlag'];
				EnquiryAccessClass e1 = EnquiryAccessClass(
					_enquiryAccessId,
					_enquiryId,
					_companyExecutiveId,
					_companyExecutiveName,
					_accessApplicationTime,
					_ownerFlag
				);

				enquiryAccessLists.add(e1);
			}
			return enquiryAccessLists;	
		}
		else{
			return enquiryAccessLists;
		}
		
	}

	Widget makeEnquiryAccessCard(var obj){
		return Card(
			elevation : 7.0,
			child : ListTile(
				title : Text(obj.companyExecutiveName),
				subtitle : Text(obj.accessApplicationTime.toString()),
				contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
				onTap : (){},
				trailing : obj.ownerFlag ? null : IconButton(
					icon : Icon(Icons.delete),
					onPressed : (){
						deleteAccess(obj.enquiryAccessId);
					},
				),
			),
		);
	}

	deleteAccess(int id)async{
		setState((){
			isLoadingAccessList = true;
		});
		var r = await ApiCall.deleteRecord(Uri.GET_ENQUIRY+'/enquiryAccessList/$id?enquiryId=${widget.obj.enquiryId}&companyExecutiveId=${CurrentUser.ownerId}');
		setState((){
			isLoadingAccessList = false;
			anyUpdate = true;
			getNewAccessListData = true;
		});
	}

	Future<List<EnquiryAccessClass>> getNonAccessibleExecutiveList()async{
		if(getNewNonAccessListData){
			getNewNonAccessListData = false;

			var json = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY+'/enquiryNonAccessibleExecutives/${widget.obj.enquiryId}');
			
			enquiryNonAccessList.clear();
			if(json=='nothing'){
				return enquiryNonAccessList;
			}
			enquiryNonAccessList.clear();
			for(int i=0;i<json.length;i++){
				int _companyExecutiveId = int.parse(json[i]['companyExecutiveId']);
			    String _companyExecutiveName = json[i]['companyExecutiveName'];
			    String _contactNumber = json[i]['contactNumber'];
			    int _companyID = json[i]['companyID'];

			    EnquiryAccessClass obj = EnquiryAccessClass.remaining(
			    	_companyExecutiveId,
					_companyExecutiveName,
					_contactNumber,
					_companyID
			    );

			    enquiryNonAccessList.add(obj);
			}

			return enquiryNonAccessList;
		}
		else{
			return enquiryNonAccessList;
		}
		
	}

	Future<bool> getNonAccessibleExecutive(){
		return showDialog(
			context : context,
			builder : (c1){
				return StatefulBuilder(
					builder : (c,setState){
						return FutureBuilder(
							future : getNonAccessibleExecutiveList(),
							builder : (c,s){
								if(s.data==null){
									return Center(
										child : CircularProgressIndicator(),
									);
								}
								else{
									if(s.data.length==0){
										return AlertDialog(
										title : Text(
											'ERROR',
											style : TextStyle(
												color : Theme.of(context).primaryColor,
												fontSize : 20.0,
											),
										),
										content : Text('There are no Executives available to add.'),
										actions : <Widget>[
											FlatButton(
												child : Text(
													'OK',
													style : TextStyle(
														color : Theme.of(context).primaryColor,
													),
												),
												onPressed : (){
													Navigator.of(c1).pop();
												}
											),
										],
									);
									}
									else{
										return Dialog(
											child : Padding(
												padding : const EdgeInsets.all(8.0),
												child : Container(
													height : 330.0,
													width : 200.0,
													child : Column(
														children : <Widget>[
															Container(
																width : double.infinity,
																height : MediaQuery.of(c1).size.height * 0.07,
																//color : Colors.grey[200],
																padding : const EdgeInsets.all(8.0),
																child : Text(
																	'Available Executives',
																	overflow: TextOverflow.fade,
																	softWrap: false,
																	style : TextStyle(
																		color : Theme.of(context).primaryColor,
																		fontSize : 25.0,
																		fontWeight : FontWeight.bold,
																	),
																),
																
															),
															Expanded(
																child : ListView.builder(
																	itemCount : s.data.length,
																	itemBuilder : (c,i){
																		return Consumer<ThemeNotifier>(
																			builder : (context,data,child){
																				return CheckboxListTile(
																					checkColor : data.getTheme().brightness == Brightness.dark ? Theme.of(context).accentColor : null,
																					activeColor : data.getTheme().brightness == Brightness.dark ? Colors.grey[800] : null, 
																					title : Text(
																						s.data[i].companyExecutiveName,
																						style : TextStyle(
																							fontSize : 20.0,
																							fontWeight : FontWeight.w700,
																							//color : Colors.white,	
																						),
																					),
																					value : tempCompanyExecutiveId.contains(s.data[i].companyExecutiveId),
																					onChanged : (v){
																						if(tempCompanyExecutiveId.contains(s.data[i].companyExecutiveId)){
																							setState((){
																								tempCompanyExecutiveId.remove(s.data[i].companyExecutiveId);
																							});
																						}
																						else{
																							setState((){
																								tempCompanyExecutiveId.add(s.data[i].companyExecutiveId);
																							});
																						}
																					}
																				);
																			}
																		);
																		
																		
																	}
																),
															),
															Row(
																mainAxisAlignment : MainAxisAlignment.end,
																//mainAxisSize : MainAxisSize.min,
																children : <Widget>[
																	
																	FlatButton(
																		child : Text(
																			'Cancel',
																			style : TextStyle(
																				color : Theme.of(context).primaryColor,
																				fontWeight : FontWeight.w500,
																			),
																		),
																		onPressed : (){
																			Navigator.of(c1).pop();
																		},
																	),
																	FlatButton(
																		child : Text(
																			'Grant Access',
																			style : TextStyle(
																				color : tempCompanyExecutiveId.length > 0 ? Theme.of(context).primaryColor : Colors.grey,
																				//color : Theme.of(context).primaryColor,
																				fontWeight : FontWeight.w500,
																			),
																		),
																		onPressed : tempCompanyExecutiveId.length > 0 ? (){
																			addAccessToExecutive();
																			Navigator.of(c1).pop();
																		} : null,
																	),
																]
															),

														]
													),
												),
											),
										);
									}
								}
							}
						);
					}
				);
			}
		);
	}

	addAccessToExecutive() async{
		setState((){
			isLoadingAccessList = true;
		});
		for(int i=0;i<tempCompanyExecutiveId.length;i++){
			var map = Map<String,dynamic>();
			map['enquiryId'] = widget.obj.enquiryId;
			map['companyExecutiveId'] = tempCompanyExecutiveId[i];
			map['accessApplicationTime'] = DateTime.now().toString().replaceAll('T',' ').substring(0,19);

			var r = await createAccess(map);
		}
		setState((){
			tempCompanyExecutiveId = [];
			getNewNonAccessListData = true;
			getNewAccessListData = true;
			anyUpdate = true;
			isLoadingAccessList = false;
		});
	}

	createAccess(data) async{
		var r = await ApiCall.createRecord(Uri.GET_ENQUIRY+'/enquiryAccessList?companyExecutiveId=${CurrentUser.ownerId}',data);
	}

	void getCurrentLocation() async{
		  var currentLocation = await Geolocator()
		  .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
		  _center=LatLng(currentLocation.latitude, currentLocation.longitude);
		  //print(_center.latitude);
	}

	updateData() async{
	
		EnquiryClass e1 = EnquiryClass.toPut(
			int.parse(clientValue),
			countryValue,
			stateValue,
			cityValue,
			areaValue,
			addressLine1.text,
			addressLine2.text,
			addressLine3.text,
			pincode.text,
			_center.latitude.toString(),//latitude
            _center.longitude.toString(),//longitude
            enquiryRemarks.text,
            int.parse(enquiryTypeValue),
            CurrentUser.id,
            DateTime.now().toString().replaceAll('T',' ').substring(0,19)
		);

		var r = updateEnquiry(e1.toMapPut());
		setState((){});
	}

	updateEnquiry(data) async{
		var r = await ApiCall.updateRecord(Uri.GET_ENQUIRY+'/${widget.obj.enquiryId}',data);
	}


	

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				leading : IconButton(
					icon : Icon(Icons.arrow_back),
					onPressed : (){
						anyUpdate ? Navigator.pop(context,true) : Navigator.pop(context,false);
					}
				),
				title : Text('Update Enquiry'),	
				bottom : TabBar(
					controller : tabController,
					indicatorColor : Colors.white,
					tabs : <Widget>[
						Tab(icon : firstIcon),
						Tab(icon : secondIcon),
						Tab(icon : thirdIcon),
						Tab(icon : fourthIcon),
						Tab(icon : fifthIcon),
					],
				),
			),
			floatingActionButton : showFab ? FloatingActionButton.extended(
				onPressed : (){
					if(tabController.index==3){
						getRemainingProductDetails();	
					}
					else{
						getNonAccessibleExecutive();
					}
					
				},
				icon : Icon(Icons.add),
				shape : RoundedRectangleBorder(
					borderRadius : BorderRadius.all(Radius.circular(16.0)),
				),
				label : Text('Add'),
			) : null ,
			
			body : TabBarView(
				controller : tabController,
				children : <Widget>[
					FutureBuilder(
						future : getEnquiryType(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								//print(s.data);
								return Container(
									margin : const EdgeInsets.all(15.0),
									padding : const EdgeInsets.all(10.0),
									decoration : myBoxDecoration(),
									child : Form(
										key : _formKey1,
										autovalidate : _autoValidate1,
										child : ListView(
											children : <Widget>[
												Center(
													child : Text(
														'Enquiry Details',
														style : TextStyle(
															fontSize : 25.0,
															fontWeight : FontWeight.bold,
															color : Theme.of(context).primaryColor,
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : enquiryRemarks,
														decoration : InputDecoration(
															labelText : 'Enquiry Remarks',
															hintText : 'Enter EnquiryRemarks',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
														validator : (v) => v.isEmpty ? 'Enquiry Remarks is required..' : null,	
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : companyName,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Company Name',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child  : DropdownButtonHideUnderline(
														child : DropdownButtonFormField<String>(
															validator : (v) => v == null ? 'Please Select Enquiry Type' : null,
															isDense : true,
															decoration : InputDecoration(
																labelText : 'Enquiry Type',
																hintText : 'Select Enquiry Type',
															),
															autovalidate : _autoValidate1,
															items : enquiryTypeMenuItems,
															onChanged : (v){
																setState((){
																	enquiryTypeValue = v;
																});	
															},
															value : enquiryTypeValue == '' ? null : enquiryTypeValue,
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : startDate,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Start Date',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : endDate,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'End date',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
													),
												),
												Container(
													height : 60.0,
												),
												Align(
													alignment : Alignment.bottomRight,
													child : RaisedButton(
														onPressed : (){
															if(_formKey1.currentState.validate()){
																if(enquiryTypeValue ==''){
																	showMessage(
																		'Looks like something is remaining..',
																		Color(0xffff2d55)
																	);
																}
																else{
																	setState((){
																		firstIcon = Icon(Icons.check_circle);
												    					completed[0]=true;
																	});
																	tabController.animateTo(1);
																}
															}
															else{
																setState((){
																	_autoValidate1 = true;
																	completed[0]=false;
																	firstIcon = Icon(Icons.error_outline);
																});
															}
														},
														color : Theme.of(context).accentColor,
														child : Padding(
															padding : EdgeInsets.fromLTRB(0.5*5,0,0.5*5,0),
															child : Row(
																mainAxisAlignment : MainAxisAlignment.end,
																mainAxisSize : MainAxisSize.min,
																children : <Widget>[
																	Text(
																	'Submit (1/3) ',
																	style: TextStyle(
																		fontSize: 20,
																		fontWeight: FontWeight.w700,
																		color: Colors.white,
																		),
																	),
																	Container(width : 10.0),
																	Icon(
																		Icons.arrow_forward,
																		color: Colors.white,
																	),
																]
															),
														),
													),
												),
											]
										),
									)
								);
							}
						}
					),
					
					FutureBuilder(
						future : getCountry(),
						builder : (c,s){
							if(s.data == null){
								return Center(child : CircularProgressIndicator());
							}
							else{
								return Container(
					    			margin: const EdgeInsets.all(15.0),
					    			padding: const EdgeInsets.all(10.0),
					    			decoration: myBoxDecoration(), 
					    			child: Form(
					    			key : _formKey2,
					    			autovalidate : _autoValidate2,
					    				child : ListView(
					    					children : <Widget>[
					    						Center(
					    							child : Text(
					    								"Enquiry Address",
					    								style : TextStyle(
					    									fontSize : 25.0,
					    									fontWeight : FontWeight.bold,
					    									color : Theme.of(context).primaryColor,
					    								),
					    								),
					    						),

					    						Padding(
					    						padding : const EdgeInsets.only(top : 20.0),
					    						child : TextFormField(
					    							controller : addressLine1,
					    							decoration : InputDecoration(
					    								//errorStyle : TextStyle(color : Colors.black),
					    								labelText : "Address Line 1",
					    								hintText : "Enter address line 1",
					    								border : OutlineInputBorder(borderSide :BorderSide(color : Colors.black)),
					    								focusedBorder: OutlineInputBorder(
					              							borderRadius: BorderRadius.all(Radius.circular(5.0)),	
					              							borderSide: BorderSide(color: Color(0xffff2d55)),
					    								),
					    								),
					    							validator: (val) => val.isEmpty ? 'Address line 1 is required' : null,
					    						)),
					    						Padding(
					    						padding : const EdgeInsets.only(top : 20.0),
					    						child : TextFormField(
					    							controller : addressLine2,
					    							decoration : InputDecoration(
					    								//errorStyle : TextStyle(color : Colors.black),
					    								labelText : "Address Line 2",
					    								hintText : "Enter address Line 2 ",
					    								border : OutlineInputBorder(),
					    								focusedBorder: OutlineInputBorder(
					              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
					              							borderSide: BorderSide(color: Color(0xffff2d55)),
					    								),
					    								),
					    							validator: (val) => val.isEmpty ? 'address Line 2 is required' : null,
					    						)),
					    						Padding(
					    						padding : const EdgeInsets.only(top : 20.0),
					    						child : TextFormField(
					    							controller : addressLine3,
					    							decoration : InputDecoration(
					    								//errorStyle : TextStyle(color : Colors.black),
					    								labelText : "Address Line 3",
					    								hintText : "Enter address Line 3 ",
					    								border : OutlineInputBorder(),
					    								focusedBorder: OutlineInputBorder(
					              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
					              							borderSide: BorderSide(color: Color(0xffff2d55)),
					    								),
					    								),
					    							validator: (val) => val.isEmpty ? 'address Line 3 is required' : null,
					    						)),
					    						Padding(
					    						padding : const EdgeInsets.only(top : 20.0),
					    						child : TextFormField(
					    							controller : pincode,
					    							decoration : InputDecoration(
					    								//errorStyle : TextStyle(color : Colors.black),
					    								labelText : "Pincode",
					    								hintText : "Enter pincode ",
					    								border : OutlineInputBorder(),
					    								focusedBorder: OutlineInputBorder(
					              							borderRadius: BorderRadius.all(Radius.circular(5.0)),
					              							borderSide: BorderSide(color: Color(0xffff2d55)),
					    								),
					    								),
					    							keyboardType: TextInputType.phone,
										              inputFormatters: [
										                LengthLimitingTextInputFormatter(6),
										                WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
										              ],
					    							validator: (val) => val.isEmpty ? 'Pincode is required' : null,
					    						)),
					    						Padding(
												padding : const EdgeInsets.only(left : 16.0,right : 16.0),
												child : StatefulBuilder(
													builder : (c,st){
														return Column(
															crossAxisAlignment : CrossAxisAlignment.start,
															children : <Widget>[
																DropdownButtonHideUnderline(
																	child : DropdownButtonFormField<int>(
																			validator : (v) => v == null ? 'Please Select Country' : null,
																			isDense : true,
																			decoration : InputDecoration(
																				labelText : 'Country',
																				hintText : 'Select Country',
																			),
																			autovalidate : _autoValidate2,
																			items : countryMenuItems,
																			onChanged : (v)async{
																			print(v.toString());
																			FocusScope.of(context).unfocus();
																			stateMenuItems.clear();
																			cityMenuItems.clear();
																			areaMenuItems.clear();
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
																				areaAvail = false;

																				stateValue = -1;
																				cityValue = -1;
																				areaValue = -1;
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
																		autovalidate : _autoValidate2,
																		items : stateMenuItems,
																		onChanged : stateAvail ? (v)async{
																			FocusScope.of(context).unfocus();
																			cityMenuItems.clear();
																			areaMenuItems.clear();
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
																				areaAvail = false;

																				cityValue = -1;
																				areaValue = -1;
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
																		autovalidate : _autoValidate2,
																		items : cityMenuItems,
																		onChanged : cityAvail ? (v)async{
																			FocusScope.of(context).unfocus();
																			areaMenuItems.clear();
																			var r = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA_FROM_BUSINESS_CITY+'/${v.toString()}?ownerID=${CurrentUser.ownerId}');
																			for(int i=0;i<r.length;i++){
																				areaMenuItems.add(
																					DropdownMenuItem<int>(
																						value : r[i]['businessAreaForCompanyID'],
																						child : Text(r[i]['businessAreaForCompanyName'])
																					),
																				);
																			}
																			st((){
																				areaAvail = true;

																				areaValue = -1;
																				cityValue = v;
																			});
																		} : null,
																		value : cityValue == -1 ? null : cityValue,

																	),
																),

																DropdownButtonHideUnderline(
																	child : DropdownButtonFormField<int>(
																		validator : (v){
																			if(stateAvail && cityAvail && areaAvail){
																				if(v==null){
																					return 'Please Select Area.';
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
																			labelText : 'Area',
																			hintText : 'Please Select Area',
																		),
																		isDense : true,
																		items : areaMenuItems,
																		autovalidate : _autoValidate2,
																		onChanged : (v){
																			FocusScope.of(context).unfocus();
																			st((){areaValue = v;});
																		},
																		value : areaValue == -1 ? null : areaValue,

																	),
																),

																

																

															]
														);
													}
												)
												),
					    						Container(
					    							height : 60.0,
					    						),
					    						Align(
					    							alignment: Alignment.bottomRight,
					    						child : RaisedButton(
												    onPressed: () {
												    	FormState form = _formKey2.currentState;
												    	if(form.validate())
												    	{
											    		
											    			setState((){secondIcon = Icon(Icons.check_circle);completed[1]=true;});
											    		
											    			tabController.animateTo(2);
												    		
												    	}
												    	else
												    	{
												    		setState((){
											    			_autoValidate2 = true;
											    			completed[1]=false;
											    			secondIcon = Icon(Icons.error_outline);
											    			});
												    	}
												    	},
												    color: Theme.of(context).accentColor,
												    child: Padding(
												      padding: EdgeInsets.fromLTRB(
												          0.5 * 5,
												          0,
												          0.5 * 5,
												          0),
												      child: Row(
												        mainAxisAlignment: MainAxisAlignment.end,
												              mainAxisSize: MainAxisSize.min,
												          
												        children: <Widget>[
												        	
												          Text(
												            'Submit (2/3) ',
												            style: TextStyle(
												              fontSize: 20,
												              fontWeight: FontWeight.w700,
												              color: Colors.white,
												            ),
												          ),
												          Container(width : 10.0),
												          Icon(
												            Icons.arrow_forward,
												            color: Colors.white,
												          ),
												          
												        ],
												      ),
												    ),
												    )),

					    						
					    						
					    					],
					    				),
					    			),
					  			);
							}
						}
					),
					
					
					FutureBuilder(
						future : getClients(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								return Container(
									margin : const EdgeInsets.all(15.0),
									padding : const EdgeInsets.all(10.0),
									decoration : myBoxDecoration(),
									child : Form(
										key : _formKey3,
										autovalidate : _autoValidate3,
										child : ListView(
											children : <Widget>[
												Center(
													child : Text(
														'Client Details',
														style : TextStyle(
															fontSize : 25.0,
															fontWeight : FontWeight.bold,
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : DropdownButtonHideUnderline(
														child : DropdownButtonFormField<String>(
															validator : (v) => v == null ? 'Please Select Any Client' : null,
															isDense : true,
															decoration : InputDecoration(
																labelText : 'Client',
																hintText : 'Select Client',
															),
															autovalidate : _autoValidate3,
															items : clientMenuItems,
															onChanged : (v){
																getClientDetails(int.parse(v));
															},
															value : clientValue == '' ? null : clientValue,
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : clientName,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Client Name',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : contactPerson,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Contact Person',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
													),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : emailId,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Email ID',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
														keyboardType: TextInputType.emailAddress,
												          validator: (value) => isValidEmail(value)
												              ? (isEmailContains(value)
												                  ? null
												                  : 'Email must contain @ and .')
												              : 'Please enter a valid email address',
												        ),
												),
												Padding(
													padding : const EdgeInsets.only(top : 20.0),
													child : TextFormField(
														controller : contactNumber,
														enabled : false,
														decoration : InputDecoration(
															labelText : 'Contact Number',
															border : OutlineInputBorder(
																borderSide : BorderSide(color : Colors.black),
															),
															focusedBorder : OutlineInputBorder(
																borderRadius : BorderRadius.all(Radius.circular(5.0)),
																borderSide : BorderSide(color : Color(0xffff2d55)),
															),
														),
														keyboardType: TextInputType.phone,
														inputFormatters: [
															LengthLimitingTextInputFormatter(10),
															WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,15}$')),
														],
													),
												),
												
												Container(
													height : 60.0,
												),
												Align(
													alignment : Alignment.bottomRight,
													child : RaisedButton(
														onPressed : (){
															if(_formKey3.currentState.validate()){
																if(clientValue ==''){
																	showMessage(
																		'Looks like something is remaining..',
																		Color(0xffff2d55)
																	);
																}
																else{
																	setState((){
																		thirdIcon = Icon(Icons.check_circle);
												    					completed[2]=true;

												    					for(int i=0;i<completed.length;i++)
														    			{
														    				if(completed[i]==false)
														    				{
														    					int ii=i+1;
														    					String ii2=ii.toString();
														    					page=page+ii2+" , ";
														    					index=false;
														    				}
														    			}
														    			if(index)
														    			{
														    				firstIcon = Icon(Icons.check_circle);
														    				secondIcon = Icon(Icons.check_circle);
														    				updateData();
														    				showMessage(
														    					'Enquiry Details Updated.',
														    					Theme.of(context).primaryColor
														    				);
														    				anyUpdate = true;
														    				tabController.animateTo(3);
														    			}
														    			else
														    			{
														    				showMessage("Looks like some fields are missing please review page no. ${page}",Color(0xffff2d55));
														    				page="";
														    				index=true;
														    			}
																	});
																	
																}
															}
															else{
																setState((){
																	_autoValidate3 = true;
																	completed[2]=false;
																	thirdIcon = Icon(Icons.error_outline);
																});
															}
														},
														color : Theme.of(context).accentColor,
														child : Padding(
															padding : EdgeInsets.fromLTRB(0.5*5,0,0.5*5,0),
															child : Row(
																mainAxisAlignment : MainAxisAlignment.end,
																mainAxisSize : MainAxisSize.min,
																children : <Widget>[
																	Text(
																	'Submit (3/3) ',
																	style: TextStyle(
																		fontSize: 20,
																		fontWeight: FontWeight.w700,
																		color: Colors.white,
																		),
																	),
																	Container(width : 10.0),
																	Icon(
																		Icons.arrow_forward,
																		color: Colors.white,
																	),
																]
															),
														),
													),
												),
											]
										),
									)
								);
							}
						}
					),
					FutureBuilder(
						future : getProducts(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								if(s.data.length==0){
									return Center(
										child : Text(
											'No products for this enquiry',
										),
									);
								}
								else{
									return IgnorePointer(
										ignoring : isLoadingProduct,
										child : Stack(
											children : <Widget>[
												ListView.builder(
													itemCount : s.data.length+1,
													itemBuilder : (c,i){
														if(i==0){
															return Padding(
																padding : const EdgeInsets.all(8.0),
																child : Text(
																	'Product Details',
																	style : TextStyle(
																		fontSize : 25.0,
																		fontWeight : FontWeight.bold,
																	),
																),
															);
														}
														else{
															return makeCard(s.data[i-1]);
														}
													}
												),
												isLoadingProduct ? Center(child : CircularProgressIndicator())	 : Container(),
											]
										),
									);
								}
							}
						}
					),
					
					FutureBuilder(
						future : getAccessList(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								if(s.data.length==0){
									return Center(
										child : Text('No executive have assigned access yet.'),
									);
								}
								else{
									return IgnorePointer(
										ignoring : isLoadingAccessList,
										child : Stack(
											children : <Widget>[
												ListView.builder(
													itemCount : s.data.length+1,
													itemBuilder : (c,i){
														if(i==0){
															return Padding(
															padding : const EdgeInsets.all(8.0),
															child : Text(
																'Enquiry Access Details',
																style : TextStyle(
																	fontSize : 25.0,
																	fontWeight : FontWeight.bold,
																),
															));
														}
														else{
															return makeEnquiryAccessCard(s.data[i-1]);
														}
													}
												),
												isLoadingAccessList ? Center(child : CircularProgressIndicator()) : Container(),
											]
										),
									);
									
								}
							}
						}
					),
				]
			),
		);
	}
}