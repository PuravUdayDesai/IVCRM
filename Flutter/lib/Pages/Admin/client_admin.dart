//default
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';

//plugins
import 'package:provider/provider.dart';

//Custom
import '../../Widgets/custom_drawer.dart';
import '../../Models/Company/client_model.dart';
import '../../Bloc/theme.dart';
import '../../User/current_user.dart';
import '../../Widgets/custom_chips.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../add_client.dart';
import '../update_client.dart';


List<ClientClass> clients = [];
class ClientAdmin extends StatefulWidget{
	@override
	_ClientAdmin createState ()=> _ClientAdmin();
}

class _ClientAdmin extends State<ClientAdmin> with TickerProviderStateMixin{


	GlobalKey<ScaffoldState> _scaffoldKey;

	var currentCompany;
	var currentCompanyKey;
	var companies = new List<String>();
	var companiesMapping = new Map<String, dynamic>();
	String filter="/owner/${CurrentUser.id}";
	bool getNewData = true;
	bool displayFilterList = true;
	bool isScrollingDown = false;
	bool getNewFilterData = true;
	bool getNewCompanyData = true;
	bool isLoading = false;

	bool companyFilterSelected=false;
	String filterChipCompanyString="Company";

	Animation animation;
	AnimationController animationController;
	ScrollController scrollController;
	Widget filterList = Container();

	List<String> countries = [];
	Map<String,int> countriesMapping = Map<String,int>();

	List<String> states = [];
	Map<String,int> statesMapping = Map<String,int>();

	List<String> cities = [];
	Map<String,int> citiesMapping = Map<String,int>();

	List<String> areas = [];
	Map<String,int> areasMapping = Map<String,int>();

	String filterChipCountry = 'Country';
	String filterChipState = 'State';
	String filterChipCity = 'City';
	String filterChipArea = 'Area';

	bool filterChipCountrySelected = false;
	bool filterChipStateSelected = false;
	bool filterChipCitySelected = false;
	bool filterChipAreaSelected = false;


	//utils
	void showMessage(String message) {
	_scaffoldKey.currentState.showSnackBar(new SnackBar(
	    content: new Text(message),
	    ));
	}

	deleteClient(int id) async{
	    setState((){
	      isLoading = true;
	    });
	    var response1 = await ApiCall.deleteRecord(Uri.GET_CLIENT + "/$id");
	    setState((){
	      isLoading = false;
	      getNewData = true;
	    });
	    showMessage('Record Successfully Deleted.!');
	}

	Future<String> getCompanies() async {
	if(getNewCompanyData){
	  getNewCompanyData = false;
	  var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY+"/owner/${CurrentUser.ownerId}");
	  companiesMapping.clear();
	  companies.clear();
	  for (int i = 0; i < response1.length; i++) {
	    int _id = response1[i]["companyId"];
	    String _country = response1[i]["companyName"];

	    if (!(companies.contains(_country) || _country == "")) {
	      companiesMapping["$_id"] = _country;
	      companies.add(_country);
	    }
	  }
	  
	  return "done";
	}
	else{
	  return "done";
	}

	}


	refresh(context) {
    
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
              ),
            ),
          );
        } else {
          if(snapshot.data.length==0){
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
                                });  
                              }
                            }
                            else if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
                              if(!isScrollingDown){
                                animationController.reverse();
                                setState((){
                                  displayFilterList = false;
                                  isScrollingDown = true;
                                });  
                              }
                            }
                          },
                          child : ListView.builder(
                            controller : scrollController,
                            itemCount : snapshot.data.length,
                            itemBuilder : (c,i){
                              if(i == 0){
                                return makeCardFirst(snapshot.data[i]);
                              }
                              else{
                                return makeCard(snapshot.data[i]);
                              }
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
      },
    );
  	}

  	Future<List<ClientClass>> getData() async {
    //getCountries();

    if(getNewData){
      getNewData = false;
      var json = await ApiCall.getDataFromApi(Uri.GET_CLIENT+""+filter);
    
      if(clients.length!=0){
        clients.clear();
      }
      if(json=="nothing"){
        return clients;
      }

      if(getNewFilterData){
        getNewFilterData = false;

        var allcountries = await ApiCall.getDataFromApi(Uri.GET_COUNTRY);
        var allstates = await ApiCall.getDataFromApi(Uri.GET_STATE);
        var allcities = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_CITY+'/${CurrentUser.ownerId}');
        var allareas = await ApiCall.getDataFromApi(Uri.GET_BUSINESS_AREA+'/${CurrentUser.ownerId}');

        countries.clear();
        countriesMapping.clear();
        states.clear();
        statesMapping.clear();
        cities.clear();
        citiesMapping.clear();
        areas.clear();
        areasMapping.clear();

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
      }
      for (int i = 0; i < json.length; i++) {

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
      return clients;  
    }
    else{
     return clients;    
    }
    
  	}

  	@override
	void initState() {
	super.initState();
	//_cityController = new TextEditingController();
	//_fbKey = GlobalKey<FormBuilderState>();
	_scaffoldKey = new GlobalKey<ScaffoldState>();
	scrollController = ScrollController();
	//print('hi');

	animationController = AnimationController(
	  vsync : this,
	  duration : Duration(milliseconds : 1000)
	);

	animation = CurvedAnimation(
	  parent : animationController,
	  curve : Curves.easeIn, 
	);

	animationController.forward();

	}


	@override
	void dispose(){
	super.dispose();
	animationController.dispose();
	//animation.dispose();
	}

	Widget makeCardFirst(var obj) {

    return FutureBuilder(
      future : getCompanies(),
      builder : (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.data==null){
          return Container(
            child : Center(
              //child : CircularProgressIndicator(),
              child : Text(""),
            ),
          );
        }
        else
        {
          return Column(
      children: [
        
        Card(
            elevation: 7,
            child: ListTile(
                dense: false,
                isThreeLine: true,
                title: Text(obj.contactName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
                subtitle: Text(obj.emailId+"\n"+obj.contactNumber),
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
                                   
                                    deleteClient(obj.clientId);
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
                    MaterialPageRoute(builder : (context) => UpdateClient(obj,companyOptions : true))
                  ).then((value){
                    if(value!=null){
                      showMessage('Record Successfully Updated.!');
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
      }
    );
    
    
  }


   Widget makeCard(var obj) {

   
          return Column(
      children: [
        Card(
            elevation: 7,
            child: ListTile(
                dense: false,
                isThreeLine: true,
                title: Text(obj.contactName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
                subtitle: Text(obj.emailId+"\n"+obj.contactNumber),
                trailing: Row(
                  mainAxisSize : MainAxisSize.min,
                  children : [
                    IconButton(
                      icon : Icon(Icons.info_outline,size : 25.0,color : Colors.grey),
                      iconSize : 30.0,
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
                                    deleteClient(obj.clientId);
                                    
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
                    MaterialPageRoute(builder : (context) => UpdateClient(obj,companyOptions : true))
                  ).then((value){
                    if(value!=null){
                      showMessage('Record Successfully Updated.!');
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
  String createdOnFormat = obj.clientCreatedOn.toString();
    List<String> createdOnList = createdOnFormat.split(" ");
    List<String> seprateDate = createdOnList[0].split("-");
    String finalCreatedOn=seprateDate[2]+"-"+seprateDate[1]+"-"+seprateDate[0]+" at "+createdOnList[1].substring(0,8);

    String lastEditOnFormat = obj.clientLastEditOn.toString();
    List<String> lastEditOnList = lastEditOnFormat.split(" ");
    List<String> seprateDate2 = lastEditOnList[0].split("-");
    String finalLastEditOn=seprateDate2[2]+"-"+seprateDate2[1]+"-"+seprateDate2[0]+" at "+lastEditOnList[1].substring(0,8);

    String createdOnFormat2 = obj.clientLocationCreatedOn.toString();
    List<String> createdOnList2 = createdOnFormat2.split(" ");
    List<String> seprateDate3 = createdOnList2[0].split("-");
    String finalCreatedOn2=seprateDate3[2]+"-"+seprateDate3[1]+"-"+seprateDate3[0]+" at "+createdOnList2[1].substring(0,8);

    String lastEditOnFormat2 = obj.clientLocationLastEditOn.toString();
    List<String> lastEditOnList2 = lastEditOnFormat2.split(" ");
    List<String> seprateDate4 = lastEditOnList2[0].split("-");
    String finalLastEditOn2=seprateDate4[2]+"-"+seprateDate4[1]+"-"+seprateDate4[0]+" at "+lastEditOnList2[1].substring(0,8);

    showModalBottomSheet(
      context: context,
      shape : RoundedRectangleBorder(
        borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
      ),
      builder: (BuildContext bc){
          return Padding(
          padding : const EdgeInsets.all(16.0),
          child : SingleChildScrollView(
          child : Container(
            child: new Column(
            children: <Widget>[
            Center(child : Text('Client Details',textScaleFactor : 2.0,style : TextStyle(
              color : Theme.of(context).primaryColor,
              fontWeight : FontWeight.bold))),
            SizedBox(height : 10.0),
            ListTile(
              leading : Icon(Icons.person_pin,size : 30.0,color : Theme.of(context).primaryColor,),
              title : Text('Contacts Details',textScaleFactor : 1.5,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.w600)),
            ),
            new ListTile(
              title: new Text("Contact name : "+obj.contactName),
              onTap: () => {},          
            ),
            
            new ListTile(
              title: new Text("Contact Person  : "+obj.contactPerson),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Email ID : "+obj.emailId),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("contactNumber : "+obj.contactNumber),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Comapny name : "+obj.companyName),
              onTap: () => {},          
            ),
            Divider(color : Theme.of(context).accentColor,),
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
              title: new Text("Area  name : "+obj.areaName),
              onTap: () => {},          
            ),
            Divider(color : Theme.of(context).accentColor,),
            ListTile(
              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.w600)),
            ),
            new ListTile(
              title: new Text("Client created on : "+finalCreatedOn),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client last edit on : "+finalLastEditOn),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client location created on : "+finalCreatedOn2),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client location last edit  on : "+finalLastEditOn2),
              onTap: () => {},          
            ),
          
          

          new Container(
            height : 10.0,
            ),
          
            ],
          ),
          )));
      }
    );
}


	@override
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
                                'clientPage',
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
                                    filter = '/owner/${CurrentUser.id}';
                                    filterChipCountrySelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/country/${countriesMapping[filterChipCountry]}';
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
                                'clientPage',
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
                                    filter = '/owner/${CurrentUser.id}';
                                    filterChipStateSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/state/${statesMapping[filterChipState]}';
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
                                'clientPage',
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
                                    filter = '/owner/${CurrentUser.id}';
                                    filterChipCitySelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/city/${citiesMapping[filterChipCity]}';
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
                                'clientPage',
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
                                    filter = '/owner/${CurrentUser.id}';
                                    filterChipAreaSelected = false;  
                                  }
                                  else{
                                    getNewData = true;
                                    filter = '/area/${areasMapping[filterChipArea]}';
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
            ]
          ),
        );
      }
    );

		return Scaffold(
			drawer : CustomDrawer(clientSelected : true),
			appBar : AppBar(
	        title : Text('Client Details'),
	        actions : <Widget>[
	          IconButton(
	            icon : Icon(Icons.search),
	            onPressed:(){
	              showSearch(context : context , delegate : DataSearch()).then((value){
	                if(value=='delete'){
	                  showMessage('Deleted Successfully.!!');
	                  
	                }
                   if(value=='update'){
                    showMessage('Deleted Successfully.!!');
                    
                  }
	                
	                  getNewData = true;
	                
	                
	                
	               });
	              },
	          )
	        ],
	      ),
	      key: _scaffoldKey,
	      body: refresh(context),
	      floatingActionButton : FloatingActionButton.extended(
	      	icon : Icon(Icons.add),
	      	label : Text('Add'),
	      	onPressed : (){
	      		Navigator.push(
	      			context,
	      			MaterialPageRoute(builder : (context) => AddClient(companyOptions : true))
	      		).then((value){
	            if(value!=null){
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
	      ),
		);
	}
}


class DataSearch extends SearchDelegate<String>
{

  void _bottomSheet(context,obj){
  String createdOnFormat = obj.clientCreatedOn.toString();
    List<String> createdOnList = createdOnFormat.split(" ");
    List<String> seprateDate = createdOnList[0].split("-");
    String finalCreatedOn=seprateDate[2]+"-"+seprateDate[1]+"-"+seprateDate[0]+" at "+createdOnList[1].substring(0,8);

    String lastEditOnFormat = obj.clientLastEditOn.toString();
    List<String> lastEditOnList = lastEditOnFormat.split(" ");
    List<String> seprateDate2 = lastEditOnList[0].split("-");
    String finalLastEditOn=seprateDate2[2]+"-"+seprateDate2[1]+"-"+seprateDate2[0]+" at "+lastEditOnList[1].substring(0,8);

    String createdOnFormat2 = obj.clientLocationCreatedOn.toString();
    List<String> createdOnList2 = createdOnFormat2.split(" ");
    List<String> seprateDate3 = createdOnList2[0].split("-");
    String finalCreatedOn2=seprateDate3[2]+"-"+seprateDate3[1]+"-"+seprateDate3[0]+" at "+createdOnList2[1].substring(0,8);

    String lastEditOnFormat2 = obj.clientLocationLastEditOn.toString();
    List<String> lastEditOnList2 = lastEditOnFormat2.split(" ");
    List<String> seprateDate4 = lastEditOnList2[0].split("-");
    String finalLastEditOn2=seprateDate4[2]+"-"+seprateDate4[1]+"-"+seprateDate4[0]+" at "+lastEditOnList2[1].substring(0,8);

    showModalBottomSheet(
      context: context,
      shape : RoundedRectangleBorder(
        borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
      ),
      builder: (BuildContext bc){
          return Padding(
          padding : const EdgeInsets.all(16.0),
          child : SingleChildScrollView(
          child : Container(
            child: new Column(
            children: <Widget>[
            Center(child : Text('Client Details',textScaleFactor : 2.0,style : TextStyle(
              color : Theme.of(context).primaryColor,
              fontWeight : FontWeight.bold))),
            SizedBox(height : 10.0),
            ListTile(
              leading : Icon(Icons.person_pin,size : 30.0,color : Theme.of(context).primaryColor,),
              title : Text('Contacts Details',textScaleFactor : 1.5,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.w600)),
            ),
            new ListTile(
              title: new Text("Contact name : "+obj.contactName),
              onTap: () => {},          
            ),
            
            new ListTile(
              title: new Text("Contact Person  : "+obj.contactPerson),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Email ID : "+obj.emailId),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("contactNumber : "+obj.contactNumber),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Comapny name : "+obj.companyName),
              onTap: () => {},          
            ),
            Divider(color : Theme.of(context).accentColor,),
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
              title: new Text("Area  name : "+obj.areaName),
              onTap: () => {},          
            ),
            Divider(color : Theme.of(context).accentColor,),
            ListTile(
              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
                color : Theme.of(context).primaryColor,
                fontWeight : FontWeight.w600)),
            ),
            new ListTile(
              title: new Text("Client created on : "+finalCreatedOn),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client last edit on : "+finalLastEditOn),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client location created on : "+finalCreatedOn2),
              onTap: () => {},          
            ),
            new ListTile(
              title: new Text("Client location last edit  on : "+finalLastEditOn2),
              onTap: () => {},          
            ),
          
          

          new Container(
            height : 10.0,
            ),
          
            ],
          ),
          )));
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

  deleteClient(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_CLIENT + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<ClientClass> suggestionList = query.isEmpty?clients:clients.where((p)=>p.contactName.startsWith(query)||
      p.contactPerson.startsWith(query)||p.emailId.startsWith(query)||p.companyName.startsWith(query)||
      p.countryName.startsWith(query)||p.stateName.startsWith(query)||p.cityName.startsWith(query)||p.areaName.startsWith(query)
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
                        text : suggestionList[index].contactName.substring(0,query.length>=suggestionList[index].contactName.length ? suggestionList[index].contactName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].contactName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].contactName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].emailId+"\n"+suggestionList[index].contactNumber),
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
                                    deleteClient(suggestionList[index].clientId,context);
                                    
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
                    MaterialPageRoute(builder : (context) => UpdateClient(suggestionList[index],companyOptions : true))
                  );
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}
