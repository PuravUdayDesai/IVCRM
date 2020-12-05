//default
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import "dart:core";

//plugins
import 'package:provider/provider.dart';


//custom
import "../Api_Services/ApiCall.dart";
import "../Api_Services/Uri.dart";
import '../Models/Company/enquiry_model.dart';
import '../Models/Company/enquiry_product_model.dart';
import 'update_enquiry.dart';
import '../User/current_user.dart';
import '../Widgets/custom_chips.dart';
import '../Bloc/theme.dart';



class Enquiry extends StatefulWidget{
	EnquiryState createState () => EnquiryState();
}

List<EnquiryClass> enquiries = [];
class EnquiryState extends State<Enquiry> with TickerProviderStateMixin{

	GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool getNewData = true;
  bool getNewFilterData = true;
  bool isScrollingDown = false;
  bool displayFilterList = true;
  String filter = '/${CurrentUser.id}';
  ScrollController scrollController;
  AnimationController animationController;
  AnimationController slideAnimationController;
  Animation<double> animation;
  Animation<Offset> slideAnimation;
  Widget filterList = Container();

  List<String> countries = [];
  Map<String,int> countriesMapping = Map<String,int>();

  List<String> states = [];
  Map<String,int> statesMapping = Map<String,int>();

  List<String> cities = [];
  Map<String,int> citiesMapping = Map<String,int>();

  List<String> areas = [];
  Map<String,int> areasMapping = Map<String,int>();

  List<String> clients = [];
  Map<String,int> clientsMapping = Map<String,int>();

  List<String> enquiryTypes = [];
  Map<String,int> enquiryTypesMapping = Map<String,int>();

  List<String> products = [];
  Map<String,int> productsMapping = Map<String,int>();

  String filterChipCountry = 'Country';
  String filterChipState = 'State';
  String filterChipCity = 'City';
  String filterChipArea = 'Area';
  String filterChipClient = 'Client';
  String filterChipEnquiryType = 'Enquiry Type';
  String filterChipProduct = 'Product';

  bool filterChipCountrySelected = false;
  bool filterChipStateSelected = false;
  bool filterChipCitySelected = false;
  bool filterChipAreaSelected = false;
  bool filterChipClientSelected = false;
  bool filterChipEnquiryTypeSelected = false;
  bool filterChipProductSelected = false;

  

  @override
  void initState(){
    super.initState();

    scrollController = ScrollController();

    animationController = AnimationController(
      vsync : this,
      duration : Duration(milliseconds : 1000)
    );

    slideAnimationController = AnimationController(
      vsync : this,
      duration : Duration(seconds : 1)
    );

    animation = CurvedAnimation(
      parent : animationController,
      curve : Curves.easeIn, 
    );

    slideAnimation = Tween<Offset>(
      begin : const Offset(1.0,0.0),
      end : const Offset(0.0,0.0)
    ).animate(CurvedAnimation(parent : slideAnimationController,curve : Curves.fastLinearToSlowEaseIn));

    animationController.forward();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
    //animation.dispose();
  }

	void showMessage(String message) {
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message),
      ));
  
	}

  refresh(context){
		return IgnorePointer(
      ignoring : isLoading,
      child : Stack(
        children : <Widget>[
          FutureBuilder(
            future : getData(),
            builder : (c,s){
              if(s.data==null){
                return Center(
                  child : CircularProgressIndicator(),
                );
              }
              if(s.data.length==0){
                  return Column(
                    children : <Widget>[
                      FadeTransition(
                        opacity : animation,
                        child : displayFilterList ? filterList : Container(),
                      ),
                      Expanded(
                        child : Center(child : Text('No Data Exists..')),
                      ),
                    ]
                  );
                }
                else{
                  return IgnorePointer(
                    ignoring : isLoading,
                    child : Stack(
                      children : <Widget>[
                        Column(
                          children : <Widget>[
                            FadeTransition(
                              opacity : animation,
                              child : displayFilterList ? filterList : Container(),
                            ),
                            Expanded(
                              child : NotificationListener<ScrollNotification>(
                                onNotification : (scrollNotification){
                                  if(scrollController.position.userScrollDirection == ScrollDirection.forward){
                                    if(isScrollingDown){
                                      animationController.forward();
                                      setState((){
                                        displayFilterList = true;
                                        isScrollingDown = false;
                                        getNewData = false;
                                      });  
                                    }
                                  }
                                  else if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
                                    if(!isScrollingDown){
                                      animationController.reverse();
                                      setState((){
                                        displayFilterList = false;
                                        isScrollingDown = true;
                                        getNewData = false;
                                      });  
                                    }
                                  }
                                  return true;
                                },
                                child : ListView.builder(
                                  controller : scrollController,
                                  itemCount : s.data.length,
                                  itemBuilder : (c,i){
                                    return makeCard(s.data[i]);
                                  }
                                ),
                              ),
                            ),
                          ]
                        ),
                        isLoading ? Center(child : CircularProgressIndicator()) : Container(),
                      ]
                    ),
                  );
                }
              }
            
          ),
          isLoading ? Center(child : CircularProgressIndicator()) : Center(child : Text(''))
        ]
      ),
    );
	}

  Future<bool> missingDialog(String unit){
    return showDialog(
      context : context,
      builder : (c){
        return AlertDialog(
          title : Text('Error!',style : TextStyle(color : Theme.of(context).primaryColor)),
          content : RichText(
            text: TextSpan(
              text: 'Please ask owner to add at least one ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: unit, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          actions : <Widget>[
            FlatButton(
              onPressed : (){
                Navigator.of(c).pop();
              },
              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
            ),
          ]
        );
      }
    );
  }

  

	Future<List<EnquiryClass>> getData() async{

    if(getNewData){
      getNewData = false;

      if(isLoading){
        return enquiries; 
      }
      var json = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY+""+filter);
      if(enquiries.length!=0){
        enquiries.clear();
      }
      if(json=="nothing"){
        return enquiries;
      }


      if(getNewFilterData){
        getNewFilterData = false;
        var allcountries = await ApiCall.getDataFromApi(Uri.GET_COUNTRY);
        var allstates = await ApiCall.getDataFromApi(Uri.GET_STATE);
        var allcities = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+'/${CurrentUser.ownerId}');
        var allareas = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA+'/${CurrentUser.ownerId}');
        var allclients = await ApiCall.getDataFromApi(Uri.GET_CLIENT+'/company/${CurrentUser.companyId}');
        var allenquirytypes = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY_TYPE+'/${CurrentUser.companyId}');  
        var allproducts = await ApiCall.getDataFromApi(Uri.GET_PRODUCT+'/owner/${CurrentUser.ownerId}');
      
        countries.clear();
        countriesMapping.clear();
        states.clear();
        statesMapping.clear();
        cities.clear();
        citiesMapping.clear();
        areas.clear();
        areasMapping.clear();
        clients.clear();
        clientsMapping.clear();
        enquiryTypes.clear();
        enquiryTypesMapping.clear();
        products.clear();
        productsMapping.clear();
      

        for(int i=0;i<allcountries.length;i++){
          if(!(countries.contains(allcountries[i]['countryName'])||allcountries[i]['countryName'] == '')){
            countriesMapping[allcountries[i]['countryName']] = allcountries[i]['countryID'];
            countries.add(allcountries[i]['countryName']);
          }
        }
        //print('1');

        for(int i=0;i<allstates.length;i++){
          if(!(states.contains(allstates[i]['stateName'])||allstates[i]['stateName'] == '')){
            statesMapping[allstates[i]['stateName']] = allstates[i]['stateID'];
            states.add(allstates[i]['stateName']);
          }
        }
        //print('2');

        for(int i=0;i<allcities.length;i++){
          if(!(cities.contains(allcities[i]['cityName'])||allcities[i]['cityName'] == '')){
            citiesMapping[allcities[i]['cityName']] = allcities[i]['businessCityForCompanyID'];
            cities.add(allcities[i]['cityName']);
          }
        }

        //print('3');

        for(int i=0;i<allareas.length;i++){
          if(!(areas.contains(allareas[i]['businessAreaName'])||allareas[i]['businessAreaName'] == '')){
            areasMapping[allareas[i]['businessAreaName']] = allareas[i]['businessAreaForCompanyID'];
            areas.add(allareas[i]['businessAreaName']);
          }
        }

        //print('4');

        for(int i=0;i<allclients.length;i++){
          if(!(clients.contains(allclients[i]['contactName'])||allclients[i]['contactName'] == '')){
            clientsMapping[allclients[i]['contactName']] = allclients[i]['clientId'];
            clients.add(allclients[i]['contactName']);
          }
        }

        //print('5');

        for(int i=0;i<allenquirytypes.length;i++){
          if(!(enquiryTypes.contains(allenquirytypes[i]['enquiryTypeName'])||allenquirytypes[i]['enquiryTypeName'] == '')){
            enquiryTypesMapping[allenquirytypes[i]['enquiryTypeName']] = allenquirytypes[i]['enquiryTypeId'];
            enquiryTypes.add(allenquirytypes[i]['enquiryTypeName']);
          }
        }

        for(int i=0;i<allproducts.length;i++){
          if(!(products.contains(allproducts[i]['productName'])||allproducts[i]['productName'] == '')){
            productsMapping[allproducts[i]['productName']] = allproducts[i]['id'];
            products.add(allproducts[i]['productName']);
          }
        }
      //print('6');
      }
      for(int i=0;i<json.length;i++){
        var _enquiryAccessListId = json[i]['enquiryAccessListId'];
          var _enquiryId = json[i]['enquiryId'];
          var _companyId = json[i]['companyId'];
          var _companyName = json[i]['companyName'];
          var _enquiryRemarks = json[i]['enquiryRemarks'];
          var _enquiryType = json[i]['enquiryType'];
          var _enquiryTypeName = json[i]['enquiryTypeName'];
          var _enquiryLocationId = json[i]['enquiryLocationId'];
          var _countryId = json[i]['countryId'];
          var _countryName = json[i]['countryName'];
          var _stateId = json[i]['stateId'];
          var _stateName = json[i]['stateName'];
          var _cityId = json[i]['cityId'];
          var _cityName = json[i]['cityName'];
          var _areaId = json[i]['areaId'];
          var _areaName = json[i]['areaName'];
          var _addressLine1 = json[i]['addressLine1'];
          var _addressLine2 = json[i]['addressLine2'];
          var _addressLine3 = json[i]['addressLine3'];
          var _pincode = json[i]['pincode'];
          var _latitude = json[i]['latitude'];
          var _longitude = json[i]['longitude'];
          var _startDateAndTime = json[i]['startDateAndTime'];
          var _deadlineDateAndTime = json[i]['deadlineDateAndTime'];
          var _enquiryClientId = json[i]['enquiryClientId'];
          var _clientId = json[i]['clientId'];
          var _clientName = json[i]['clientName'];
          var _contactPerson = json[i]['contactPerson'];
          var _emailId = json[i]['emailId'];
          var _contactNumber = json[i]['contactNumber'];
          // if (json[i]['enquiryProductList'] != null) {
          //   enquiryProductList = new List<ProductClass>();
          //   json[i]['enquiryProductList'].forEach((v) {
          //     enquiryProductList.add(new EnquiryProductList.fromjson[i](v));
          //   });
          // }
          //var _enquiryProductList = new List<ProductClass>();
          var _createdBy = json[i]['createdBy'];
          var _createdOn = json[i]['createdOn'];
          var _lastEditBy = json[i]['lastEditBy'];
          var _lastEditOn = json[i]['lastEditOn'];
          //var _enquiryProductList = new List<EnquiryProductClass>();
          List<EnquiryProductClass> _enquiryProductListMain = [];
          //_enquiryProductList = json[i]['enquiryProductList'];
          //print(_enquiryProductList);
          for(int j=0;j<json[i]['enquiryProductList'].length;j++){
            int _enquiryId = json[i]['enquiryProductList'][j]['enquiryId'];
            int _enquiryProductId = json[i]['enquiryProductList'][j]['enquiryProductId'];
            int _productId = json[i]['enquiryProductList'][j]['productId'];
            String _productName = json[i]['enquiryProductList'][j]['productName'];
            dynamic _productCharges = json[i]['enquiryProductList'][j]['productCharges'];

            EnquiryProductClass obj = EnquiryProductClass(
              _enquiryId,
                _enquiryProductId,
                _productId,
                _productName,
                _productCharges
            );
            _enquiryProductListMain.add(obj);
          }

          //print(json[i]['enquiryProductList'][0]['enquiryId'].toString());

          EnquiryClass e1 = EnquiryClass.retrieve(
            _enquiryAccessListId,
              _enquiryId,
              _companyId,
              _companyName,
              _enquiryRemarks,
              _enquiryType,
              _enquiryTypeName,
              _enquiryLocationId,
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
              _startDateAndTime,
              _deadlineDateAndTime,
              _enquiryClientId,
              _clientId,
              _clientName,
              _contactPerson,
              _emailId,
              _contactNumber,
              _enquiryProductListMain,
              _createdBy,
              _createdOn,
              _lastEditBy,
              _lastEditOn
          );
          enquiries.add(e1);
      }
      return enquiries;
    }
    else{
      return enquiries;
    }
    
	}


	Widget makeCard(var obj) {

    return Column(
      children: [
        Card(
            //elevation: 7,
            child: ListTile(
            	//selected : true,
                //dense: true,
                isThreeLine: true,
                contentPadding: EdgeInsets.only(left: 16.0),
                title: Text(obj.companyName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold,fontFamily : 'NotoSans')),
                subtitle: Text(obj.enquiryTypeName),
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
                                    deleteEnquiry(obj.enquiryId);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  //updateCountry(obj);
                  Navigator.push(
                  	context,
                  	MaterialPageRoute(builder : (context)=> UpdateEnquiry(obj))
                  ).then((value){
                    if(value!=null){
                      if(value){
                        showMessage('Record Successfully Updated.!');
                        setState((){
                          getNewData = true;
                        });  
                      }
                      
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
      builder : (b){
        return Padding(
        padding : const EdgeInsets.all(16.0),
        child : SingleChildScrollView(
          child : Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children : <Widget>[
              Center(child : Text('Enquiry Details',textScaleFactor : 2.0,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.bold))),
              ListTile(
                title : Text('Company Name : '+obj.companyName),
              ),
              ListTile(
                title : Text('Enquiry Remarks : '+obj.enquiryRemarks),
              ),
              ListTile(
                title : Text('Enquiry Type : '+obj.enquiryTypeName),
              ),
              ListTile(
                title : Text('Start Date : '+obj.startDateAndTime),
              ),
              ListTile(
                title : Text('End Date : '+obj.deadlineDateAndTime),
              ),
              Divider(color : Theme.of(context).accentColor),
              ListTile(
                leading : Icon(Icons.add_location,color : Theme.of(context).primaryColor, ),
                title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.w800)),
              ),
              ListTile(
                title : Text('Country : '+obj.countryName),
              ),
              ListTile(
                title : Text('State : '+obj.stateName),
              ),
              ListTile(
                title : Text('City : '+obj.cityName),
              ),
              ListTile(
                title : Text('Area : '+obj.areaName),
              ),
              ListTile(
                title : Text('Address : '+obj.addressLine1),
                subtitle : Text(obj.addressLine2+' , '+obj.addressLine3),
              ),
              ListTile(
                title : Text('Pincode : '+obj.pincode),
              ),
              
              Divider(color : Theme.of(context).accentColor),
              ListTile(
                leading : Icon(Icons.account_box,color : Theme.of(context).primaryColor,),
                title : Text('Client Details',textScaleFactor : 1.5,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.w800)),  
              ),
              ListTile(
                title : Text('Client : '+obj.clientName),
              ),
              ListTile(
                title : Text('Conatct Person : '+obj.contactPerson),
              ),
              ListTile(
                title : Text('Email ID : '+obj.emailId),
              ),
              ListTile(
                title : Text('Conatct No. : '+obj.contactNumber),
              ),
              ListTile(
                title : Text('Created On : '+obj.createdOn),
              ),
              ListTile(
                title : Text('Last Edit On : '+obj.lastEditOn),
              ),
            ]
          ),
        ),
        );
      }
    );
  }

  deleteEnquiry(int id) async {
    setState((){
      isLoading = true;
    });
  	var r = await ApiCall.deleteRecord(Uri.GET_ENQUIRY+"/${id}?companyExecutiveId=${CurrentUser.id}");
    setState((){
      isLoading = false;
      getNewData = true;
    });
    showMessage('Record Successfully Deleted.!');
  }

	Widget build(BuildContext context){

    filterList = Consumer<ThemeNotifier>(
      builder : (context,data,child){
        return Container(
          height : 50.0,
          width : double.infinity,
          child : ListView(
            scrollDirection : Axis.horizontal,
            children : <Widget>[
              
              Padding(
                padding : const EdgeInsets.only(right : 5.0,left : 5.0),
                child : FilterChip(
                  label : Text(filterChipCountry),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Country',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                countries,
                                'country',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipCountry = selectedValue;
                                  }
                                  else{
                                    filterChipCountry = 'Country';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipCountry == 'Country'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipCountrySelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/country/${countriesMapping[filterChipCountry]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipCountrySelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipCountrySelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipState),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select State',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                states,
                                'state',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  // print('selectedValue = $selectedValue and index is $selectIndex');
                                  // print('id = ${statesMapping[selectedValue]}');
                                  if(selectIndex){
                                    filterChipState = selectedValue;
                                  }
                                  else{
                                    filterChipState = 'State';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipState == 'State'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipStateSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/state/${statesMapping[filterChipState]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipStateSelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipStateSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipCity),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select City',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                cities,
                                'city',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipCity = selectedValue;
                                  }
                                  else{
                                    filterChipCity = 'City';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipCity == 'City'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipCitySelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/city/${citiesMapping[filterChipCity]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipCitySelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipCitySelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipArea),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Area',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                areas,
                                'area',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipArea = selectedValue;
                                  }
                                  else{
                                    filterChipArea = 'Area';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipArea == 'Area'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipAreaSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/area/${areasMapping[filterChipArea]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipAreaSelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipAreaSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipClient),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Client',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                clients,
                                'client',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipClient = selectedValue;
                                  }
                                  else{
                                    filterChipClient = 'Client';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipClient == 'Client'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipClientSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/client/${clientsMapping[filterChipClient]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipClientSelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipClientSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipEnquiryType),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Enquiry Type',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                enquiryTypes,
                                'enquiryType',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipEnquiryType = selectedValue;
                                  }
                                  else{
                                    filterChipEnquiryType = 'Enquiry Type';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipEnquiryType == 'Enquiry Type'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipEnquiryTypeSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/enquiryType/${enquiryTypesMapping[filterChipEnquiryType]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipEnquiryTypeSelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipEnquiryTypeSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(right : 5.0),
                child : FilterChip(
                  label : Text(filterChipProduct),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Product',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : CustomChip(
                                products,
                                'product',
                                'enquiryPage',
                                onSelectionChanged : (selectedValue,selectIndex){
                                  print('selectedValue = $selectedValue and index is $selectIndex');
                                  if(selectIndex){
                                    filterChipProduct = selectedValue;
                                  }
                                  else{
                                    filterChipProduct = 'Product';
                                  }
                                }
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(filterChipProduct == 'Product'){
                                    getNewData = true;
                                    filter = '/${CurrentUser.id}';
                                    filterChipProductSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/product/${productsMapping[filterChipProduct]}?companyExecutiveId=${CurrentUser.id}';
                                    filterChipProductSelected = true;  
                                  }
                                  
                                });
                              },
                            ),
                          ],
                          
                        );
                      }
                    );
                  },
                  selected : filterChipProductSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
            ]
          ),
        );
      }
    );

    
		return Scaffold(

			key : _scaffoldKey,
			//backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
			appBar : AppBar(
				automaticallyImplyLeading: false,
				elevation : 1.0,
				title : Text(
					'Enquiry Details',
					style : TextStyle(
            fontFamily : 'NotoSans'
					),
				),
				actions : <Widget>[
					IconButton(
						icon : Icon(Icons.search),
						onPressed : (){
              showSearch(context : context , delegate : DataSearch()).then((value){
                if(value == 'delete'){
                  showMessage('Deleted Successfully.!');
                  
                }
                setState((){
                  getNewData = true;
                });
              });
							
						},
					),
				]
			),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				label : Text('Add'),
				icon : Icon(Icons.add),
				shape : RoundedRectangleBorder(
					borderRadius : BorderRadius.all(Radius.circular(16.0)),
				),
				onPressed : ()async{
          setState((){isLoading = true;});
          var r5 = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY_TYPE+"/${CurrentUser.companyId}");
            
            if(r5 == 'nothing'){
              setState((){isLoading = false;});
              missingDialog('ENQUIRY TYPE');
              return;
            }
            var r6 = await ApiCall.getDataFromApi(Uri.GET_CLIENT+"/company/${CurrentUser.companyId}");
            if(r6 == 'nothing'){
              setState((){isLoading = false;});
              missingDialog('CLIENT');
              return;
            }
            var r7 = await ApiCall.getDataFromApi(Uri.GET_STATUS+"/${CurrentUser.companyId}");
            if(r7 == 'nothing'){
              setState((){isLoading = false;});
              missingDialog('STATUS');
              return;
            }
            var r8 = await ApiCall.getDataFromApi(Uri.GET_PRODUCT+"/company/${CurrentUser.companyId}");
            if(r8 == 'nothing'){
              setState((){isLoading = false;});
              missingDialog('PRODUCT');
              return;
            }
            

            if(r5!='nothing' && r6!='nothing'&& r7!='nothing'&& r8!='nothing'){
              setState((){isLoading = false;});
              Navigator.pushNamed(context,'/add_enquiry').then((value){
                if(value!=null){
                  showMessage('Record Successfully Added.!');
                  setState((){
                    getNewData = true;
                  });
                }
              });  
            }
					 
				},
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
      builder : (b){
        return Padding(
        padding : const EdgeInsets.all(16.0),
        child : SingleChildScrollView(
          child : Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children : <Widget>[
              Center(child : Text('Enquiry Details',textScaleFactor : 2.0,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.bold))),
              ListTile(
                title : Text('Company Name : '+obj.companyName),
              ),
              ListTile(
                title : Text('Enquiry Remarks : '+obj.enquiryRemarks),
              ),
              ListTile(
                title : Text('Enquiry Type : '+obj.enquiryTypeName),
              ),
              ListTile(
                title : Text('Start Date : '+obj.startDateAndTime),
              ),
              ListTile(
                title : Text('End Date : '+obj.deadlineDateAndTime),
              ),
              Divider(color : Theme.of(context).accentColor),
              ListTile(
                leading : Icon(Icons.add_location,color : Theme.of(context).primaryColor, ),
                title : Text('Location Details',textScaleFactor : 1.5,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.w800)),
              ),
              ListTile(
                title : Text('Country : '+obj.countryName),
              ),
              ListTile(
                title : Text('State : '+obj.stateName),
              ),
              ListTile(
                title : Text('City : '+obj.cityName),
              ),
              ListTile(
                title : Text('Area : '+obj.areaName),
              ),
              ListTile(
                title : Text('Address : '+obj.addressLine1),
                subtitle : Text(obj.addressLine2+' , '+obj.addressLine3),
              ),
              ListTile(
                title : Text('Pincode : '+obj.pincode),
              ),
              
              Divider(color : Theme.of(context).accentColor),
              ListTile(
                leading : Icon(Icons.account_box,color : Theme.of(context).primaryColor,),
                title : Text('Client Details',textScaleFactor : 1.5,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.w800)),  
              ),
              ListTile(
                title : Text('Client : '+obj.clientName),
              ),
              ListTile(
                title : Text('Conatct Person : '+obj.contactPerson),
              ),
              ListTile(
                title : Text('Email ID : '+obj.emailId),
              ),
              ListTile(
                title : Text('Conatct No. : '+obj.contactNumber),
              ),
              ListTile(
                title : Text('Created On : '+obj.createdOn),
              ),
              ListTile(
                title : Text('Last Edit On : '+obj.lastEditOn),
              ),
            ]
          ),
        ),
        );
      }
    );
  }
  

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

  deleteEnquiry(context,id) async {
    var r = await ApiCall.deleteRecord(Uri.GET_ENQUIRY+"/${id}?companyExecutiveId=${CurrentUser.id}");
    close(context,'delete');
  }

  @override
   ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  Widget buildSuggestions(BuildContext context)
  {

          
    final List<EnquiryClass> suggestionList = query.isEmpty?enquiries:enquiries.where((p)=>p.enquiryRemarks.startsWith(query)||
      p.enquiryTypeName.startsWith(query)||
      p.countryName.startsWith(query)||
      p.stateName.startsWith(query)||
      p.cityName.startsWith(query)||
      p.companyName.startsWith(query)||
      p.pincode.startsWith(query)||
      p.clientName.startsWith(query)||
      p.contactPerson.startsWith(query)||
      p.areaName.startsWith(query)
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
                        text : suggestionList[index].companyName.substring(
                          0,
                          query.length >= suggestionList[index].companyName.length ? suggestionList[index].companyName.length : query.length
                          ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                        children : [
                          TextSpan(
                            text : suggestionList[index].companyName.substring(
                              query.length >= suggestionList[index].companyName.length ? suggestionList[index].companyName.length : query.length
                              ),
                            style : TextStyle(color : suggestionList[index].companyName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].enquiryRemarks),
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
                                    Navigator.of(c).pop();
                                    deleteEnquiry(context,suggestionList[index].enquiryId);
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
                    MaterialPageRoute(
                      builder : (context) => UpdateEnquiry(suggestionList[index])
                    )
                  );
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
