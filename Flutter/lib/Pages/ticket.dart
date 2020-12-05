//default
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';

//plugins
import 'package:provider/provider.dart';

//custom
import '../User/current_user.dart';
import '../Models/Company/ticket_model.dart';
import "../Api_Services/ApiCall.dart";
import "../Api_Services/Uri.dart";
import '../Models/Company/followup_date_model.dart';
import 'update_ticket.dart';
import '../Widgets/custom_multi_chips.dart';
import '../Bloc/theme.dart';




class Ticket extends StatefulWidget{

  String ticketName;
  Ticket({this.ticketName});

  @override
  TicketState createState () => TicketState();
}

List<TicketClass> tickets = [];

class TicketState extends State<Ticket> with SingleTickerProviderStateMixin{

  bool getNewData = true;
  bool getNewFilterData = true;
  bool displayFilterList = true;
  bool isScrollingDown = false;
  bool isFilterApply;

  Widget filterList = Container();
  AnimationController animationController;
  Animation animation;
  ScrollController scrollController;

  List<int> priorityId = [];
  List<int> statusId = [];
  List<int> ticketType = [];
  List<int> productId = [];

  String filterChipStatus = 'Status';
  String filterChipPriority = 'Priority';
  String filterChipEnquiryType = 'Enquiry Type';
  String filterChipProduct = 'Product';

  bool filterChipStatusSelected = false;
  bool filterChipPrioritySelected = false;
  bool filterChipEnquiryTypeSelected = false;
  bool filterChipProductSelected = false;

  List<String> enquiryTypes = [];
  Map<String,int> enquiryTypesMapping = Map<String,int>();

  List<String> products = [];
  Map<String,int> productsMapping = Map<String,int>();

  List<String> statuses = [];
  Map<String,int> statusMapping = Map<String,int>();  

  List<String> priorities = ['Low','Normal','High','Immediate'];
  Map<String,int> priorityMapping = Map<String,int>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();

    priorityMapping['Low'] = 1;
    priorityMapping['Normal'] = 2;
    priorityMapping['High'] = 3;
    priorityMapping['Immediate'] = 4;

    scrollController = ScrollController();
    animationController = AnimationController(vsync : this,duration : Duration(seconds : 1));
    animation = CurvedAnimation(parent : animationController , curve : Curves.easeIn);

    animationController.forward();
    if(widget.ticketName!=null){
        isFilterApply = true;
        switch(widget.ticketName){
          case 'Low' : 
            filterChipPriority= 'Low';
            filterChipPrioritySelected = true;
            priorityId.add(1);
            break;
          case 'Normal' :
            filterChipPriority= 'Normal';
            filterChipPrioritySelected = true;
            priorityId.add(2);
            break;
          case 'High' :  
            filterChipPriority= 'High';
            filterChipPrioritySelected = true;
            priorityId.add(3);
            break;
          case 'Immediate' : 
            filterChipPriority= 'Immediate';
            filterChipPrioritySelected = true;
            priorityId.add(4);
            break;
        }
    }
    else{
        isFilterApply = false; 
    }
  }

  void showMessage(String message) {
  _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message),
      ));
  
  }

  refresh(context){
    return FutureBuilder(
      future : getData(),
      builder :(c,s){
        if(s.data==null){
          return Center(
            child : CircularProgressIndicator(),
          );
        }
        else{
          if(s.data.length==0){
            // return Center(
            //   child : Text('No Data exists.')
            // );
            return Column(
              children : <Widget>[
                FadeTransition(
                  opacity : animation,
                  child : displayFilterList ? filterList : Container(),
                ),
                Expanded(
                  child : Center(child : Text('No Data Exists.')),
                ),
              ]
            );
          }
          else{

            return Column(
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
                      itemCount : s.data.length,
                      itemBuilder : (c,i){
                        return makeCard(s.data[i]);
                      }
                    ),
                  ),
                ),
              ]
            );
          }
        }
      }
    );
  }

  Future<List<TicketClass>> getData() async{

    if(isFilterApply){
      isFilterApply = false;

      var filters = Map<String,dynamic>();
      filters['priorityId'] = priorityId;
      filters['statusId'] = statusId;
      filters['ticketType'] = ticketType;
      filters['productId'] = productId;
      filters['companyExecutiveId'] = CurrentUser.id;


      var json = await ApiCall.createRecord(Uri.GET_TICKET+'/master',filters);
      
      if(tickets.length!=0){
        tickets.clear();
      }
      if(json == 'nothing'){
        return tickets;
      }

      for(int i=0;i<json.length;i++){
            var _ticketId = json[i]['ticketId'];
            var _enquiryId = json[i]['enquiryId'];
            var _ticketAccessId = json[i]['ticketAccessId'];
            var _companyExecutiveId = json[i]['companyExecutiveId'];
            var _companyExecutiveName = json[i]['companyExecutiveName'];
            var _enquiryRemarks = json[i]['enquiryRemarks'];
            var _ticketRemarks = json[i]['ticketRemarks'];
            var _startDateAndTime = json[i]['startDateAndTime'];
            var _deadlineDateAndTime = json[i]['deadlineDateAndTime'];
            var _productId = json[i]['productId'];
            var _productName = json[i]['productName'];
            var _ticketType = json[i]['ticketType'];
            var _ticketTypeName = json[i]['ticketTypeName'];
            var _ticketPriority = json[i]['ticketPriority'];
            var _ticketPriorityName = json[i]['ticketPriorityName'];
            var _companyId = json[i]['companyId'];
            var _companyName = json[i]['companyName'];
            var _statusId = json[i]['statusId'];
            var _statusName = json[i]['statusName'];
            // if (json[i]['followupDate'] != null) {
            //   followupDate = new List<FollowupDate>();
            //   json[i]['followupDate'].forEach((v) {
            //     followupDate.add(new FollowupDate.fromjson[i](v));
            //   });
            // }
            var _createdBy = json[i]['createdBy'];
            var _createdOn = json[i]['createdOn'];
            var _lastEditBy = json[i]['lastEditBy'];
            var _lastEditOn = json[i]['lastEditOn'];
            List<FollowupDateClass> followupDates = [];

            for(int j=0;j<json[i]['followupDate'].length;j++){

              int _ticketFollowupDateId = json[i]['followupDate'][j]['ticketFollowupDateId'];
              int _ticketId = json[i]['followupDate'][j]['ticketId'];
              String _followupDate = json[i]['followupDate'][j]['followupDate'];

              FollowupDateClass obj = FollowupDateClass(
                _ticketFollowupDateId,
                _ticketId,
                _followupDate
              );

              followupDates.add(obj);

            }


            TicketClass obj = TicketClass.retrieve(
              _ticketId,
              _enquiryId,
              _ticketAccessId,
              _companyExecutiveId,
              _companyExecutiveName,
              _enquiryRemarks,
              _ticketRemarks,
              _startDateAndTime,
              _deadlineDateAndTime,
              _productId,
              _productName,
              _ticketType,
              _ticketTypeName,
              _ticketPriority,
              _ticketPriorityName,
              _companyId,
              _companyName,
              _statusId,
              _statusName,
              followupDates,
              _createdBy,
              _createdOn,
              _lastEditBy,
              _lastEditOn
            );

            tickets.add(obj);
      }
      return tickets;
    }
    else{
      if(getNewData){
        getNewData = false;
        var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/${CurrentUser.id}');
        if(tickets.length!=0){
          tickets.clear();
        }
        if(json == 'nothing'){
          return tickets;
        }

        if(getNewFilterData){
          getNewFilterData = false;

          var allenquirytypes = await ApiCall.getDataFromApi(Uri.GET_ENQUIRY_TYPE+'/${CurrentUser.companyId}');  
          var allproducts = await ApiCall.getDataFromApi(Uri.GET_PRODUCT+'/owner/${CurrentUser.ownerId}');
          var allstatuses = await ApiCall.getDataFromApi(Uri.GET_STATUS+'/${CurrentUser.companyId}');


          enquiryTypes.clear();
          enquiryTypesMapping.clear();
          products.clear();
          productsMapping.clear();
          statuses.clear();
          statusMapping.clear();



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

          for(int i=0;i<allstatuses.length;i++){
            if(!(statuses.contains(allstatuses[i]['statusName'])||allstatuses[i]['statusName'] == '')){
              statusMapping[allstatuses[i]['statusName']] = allstatuses[i]['statusId'];
              statuses.add(allstatuses[i]['statusName']);
            }
          }
        }

        for(int i=0;i<json.length;i++){
              var _ticketId = json[i]['ticketId'];
              var _enquiryId = json[i]['enquiryId'];
              var _ticketAccessId = json[i]['ticketAccessId'];
              var _companyExecutiveId = json[i]['companyExecutiveId'];
              var _companyExecutiveName = json[i]['companyExecutiveName'];
              var _enquiryRemarks = json[i]['enquiryRemarks'];
              var _ticketRemarks = json[i]['ticketRemarks'];
              var _startDateAndTime = json[i]['startDateAndTime'];
              var _deadlineDateAndTime = json[i]['deadlineDateAndTime'];
              var _productId = json[i]['productId'];
              var _productName = json[i]['productName'];
              var _ticketType = json[i]['ticketType'];
              var _ticketTypeName = json[i]['ticketTypeName'];
              var _ticketPriority = json[i]['ticketPriority'];
              var _ticketPriorityName = json[i]['ticketPriorityName'];
              var _companyId = json[i]['companyId'];
              var _companyName = json[i]['companyName'];
              var _statusId = json[i]['statusId'];
              var _statusName = json[i]['statusName'];
              // if (json[i]['followupDate'] != null) {
              //   followupDate = new List<FollowupDate>();
              //   json[i]['followupDate'].forEach((v) {
              //     followupDate.add(new FollowupDate.fromjson[i](v));
              //   });
              // }
              var _createdBy = json[i]['createdBy'];
              var _createdOn = json[i]['createdOn'];
              var _lastEditBy = json[i]['lastEditBy'];
              var _lastEditOn = json[i]['lastEditOn'];
              List<FollowupDateClass> followupDates = [];

              for(int j=0;j<json[i]['followupDate'].length;j++){

                int _ticketFollowupDateId = json[i]['followupDate'][j]['ticketFollowupDateId'];
                int _ticketId = json[i]['followupDate'][j]['ticketId'];
                String _followupDate = json[i]['followupDate'][j]['followupDate'];

                FollowupDateClass obj = FollowupDateClass(
                  _ticketFollowupDateId,
                  _ticketId,
                  _followupDate
                );

                followupDates.add(obj);

              }


              TicketClass obj = TicketClass.retrieve(
                _ticketId,
                _enquiryId,
                _ticketAccessId,
                _companyExecutiveId,
                _companyExecutiveName,
                _enquiryRemarks,
                _ticketRemarks,
                _startDateAndTime,
                _deadlineDateAndTime,
                _productId,
                _productName,
                _ticketType,
                _ticketTypeName,
                _ticketPriority,
                _ticketPriorityName,
                _companyId,
                _companyName,
                _statusId,
                _statusName,
                followupDates,
                _createdBy,
                _createdOn,
                _lastEditBy,
                _lastEditOn
              );

              tickets.add(obj);
        }

        return tickets;  
      }
      else{
        return tickets;   
      }  
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
                title: Text(obj.productName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
                subtitle: Text(obj.ticketRemarks),
                trailing: IconButton(
                      icon : Icon(Icons.info_outline,size : 30.0,color : Colors.grey),
                      
                      onPressed : (){
                        _bottomSheet(context,obj);
                      }
                      ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => UpdateTicket(obj))
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
        borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0))
      ),
      builder : (b){
        return Padding(
          padding : const EdgeInsets.all(16.0),
          child : SingleChildScrollView(
            child : Column(
              children : <Widget>[
                Center(child : Text('Ticket Details',textScaleFactor : 2.0,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.bold))),
                ListTile(
                  title : Text('Executive Name : '+obj.companyExecutiveName),
                ),
                ListTile(
                  title : Text('Company Name : '+obj.companyName),
                ),
                ListTile(
                  title : Text('Enquiry Remarks : '+obj.enquiryRemarks),
                ),
                ListTile(
                  title : Text('Ticket Remarks: '+obj.ticketRemarks),
                ),
                ListTile(
                  title : Text('Start Date : '+obj.startDateAndTime),
                ),
                ListTile(
                  title : Text('End date : '+obj.deadlineDateAndTime),
                ),
                ListTile(
                  title : Text('Product Name : '+obj.productName),
                ),
                ListTile(
                  title : Text('Enquiry Type : '+obj.ticketTypeName),
                ),
                ListTile(
                  title : Text('Priority : '+obj.ticketPriorityName),
                ),
                
                ListTile(
                  title : Text('Status : '+obj.statusName),
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
                padding : const EdgeInsets.only(left : 5.0,right : 5.0),
                child : FilterChip(
                  label : Text(filterChipStatus),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Status',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : MultiChips(
                                statuses,
                                'status',
                                onSelectionChanged : (s){
                                  List<int> temp= [];
                                  for(int i =0;i<s.length;i++){
                                    temp.add(statusMapping[s[i]]);
                                  }
                                  statusId.clear();
                                  statusId.addAll(temp);
                                }
                              ),
                            ),
                          ),
                          actions : <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(statusId.length > 0){
                                    isFilterApply = true;
                                    filterChipStatusSelected = true;
                                    if(statusId.length == 1){
                                      filterChipStatus = statusMapping.keys.firstWhere((k)=> statusMapping[k] == statusId[0]);
                                    }
                                    else{
                                      filterChipStatus = '+${statusId.length} Status'; 
                                      
                                    }
                                  }
                                  else{
                                    filterChipStatusSelected = false;
                                    filterChipStatus = 'Status';
                                    if(priorityId.isEmpty && ticketType.isEmpty && productId.isEmpty ){
                                      getNewData = true;
                                    }
                                    else{
                                      isFilterApply = true;
                                    }
                                    
                                  }
                                });
                              }
                            ),
                          ]
                        );
                      }
                    );
                  },
                  selected : filterChipStatusSelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(left : 5.0,right : 5.0),
                child : FilterChip(
                  label : Text(filterChipPriority),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select Priority',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : MultiChips(
                                priorities,
                                'priority',
                                preSelected : widget.ticketName, 
                                onSelectionChanged : (s){
                                  List<int> temp = [];
                                  for(int i=0;i<s.length;i++){
                                    temp.add(priorityMapping[s[i]]);
                                  }
                                  priorityId.clear();
                                  priorityId.addAll(temp);
                                }
                              ),
                            ),
                          ),
                          actions : <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(priorityId.length > 0){
                                    isFilterApply = true;
                                    filterChipPrioritySelected = true;
                                    if(priorityId.length == 1){
                                        filterChipPriority = priorityMapping.keys.firstWhere((k) =>priorityMapping[k] == priorityId[0]);
                                    }
                                    else{
                                      filterChipPriority = '+${priorityId.length} Priority';
                                    }
                                  }
                                  else{
                                    filterChipPriority = 'Priority';
                                    filterChipPrioritySelected = false;
                                    if(priorityId.isEmpty && ticketType.isEmpty && statusId.isEmpty){
                                      getNewData = true;
                                    }
                                    else{
                                      isFilterApply = true;
                                    }
                                  }
                                });
                              }
                            ),
                          ]
                        );
                      }
                    );
                  },
                  selected : filterChipPrioritySelected,
                  selectedColor : data.getTheme().brightness == Brightness.dark ? Color(0xff4FAACA) : Color(0xff79cef1),
                  backgroundColor : data.getTheme().brightness == Brightness.dark ? Colors.grey : Colors.grey[300],
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(left : 5.0,right : 5.0),
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
                              child : MultiChips(
                                enquiryTypes,
                                'enquiryType',
                                onSelectionChanged : (s){
                                  List<int> temp =[];
                                  for(int i=0;i<s.length;i++){
                                    temp.add(enquiryTypesMapping[s[i]]);
                                  }
                                  ticketType.clear();
                                  ticketType.addAll(temp);
                                }
                              ),
                            ),
                          ),
                          actions : <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(ticketType.length > 0){
                                    isFilterApply = true;
                                    filterChipEnquiryTypeSelected = true;
                                    if(ticketType.length == 1){
                                      filterChipEnquiryType = enquiryTypesMapping.keys.firstWhere((k)=>enquiryTypesMapping[k] == ticketType[0]);
                                    }
                                    else{
                                      filterChipEnquiryType = '+${ticketType.length} Enquiry Type';
                                    }
                                  }
                                  else{
                                    if(priorityId.isEmpty && productId.isEmpty && statusId.isEmpty){
                                      getNewData = true;
                                    }
                                    else{
                                      isFilterApply = true;
                                    }
                                    filterChipEnquiryType = 'Enquiry type';
                                    filterChipEnquiryTypeSelected = false;
                                  }
                                });
                              }
                            ),
                          ]
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
                padding : const EdgeInsets.only(left : 5.0,right : 5.0),
                child : FilterChip(
                  label : Text(filterChipProduct),
                  onSelected : (b){
                    return showDialog(
                      context : context,
                      builder : (c){
                        return AlertDialog(
                          title : Text('Select products',style : TextStyle(color : Theme.of(context).primaryColor)),
                          content : Container(
                            constraints : BoxConstraints(
                              maxHeight : 100.0,
                            ),
                            child : SingleChildScrollView(
                              child : MultiChips(
                                products,
                                'product',
                                onSelectionChanged : (s){
                                  List<int> temp =[];
                                  for(int i=0;i<s.length;i++){
                                    temp.add(productsMapping[s[i]]);
                                  }
                                  productId.clear();
                                  productId.addAll(temp);
                                }
                              ),
                            ),
                          ),
                          actions : <Widget>[
                            FlatButton(
                              child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                              onPressed : (){
                                Navigator.of(c).pop();
                                setState((){
                                  if(productId.length > 0){
                                    isFilterApply = true;
                                    filterChipProductSelected = true;
                                    if(productId.length == 1){
                                      filterChipProduct = productsMapping.keys.firstWhere((k)=>productsMapping[k] == productId[0]);
                                    }
                                    else{
                                      filterChipProduct = '+${productId.length} Product';
                                    }
                                  }
                                  else{
                                    if(priorityId.isEmpty && ticketType.isEmpty  && statusId.isEmpty){
                                      getNewData = true;
                                    }
                                    else{
                                      isFilterApply = true;
                                    }
                                    filterChipProduct = 'Product';
                                    filterChipProductSelected = false;
                                  }
                                });
                              }
                            ),
                          ]
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
      appBar : AppBar(
        title : Text('Ticket Details'),
        actions : <Widget>[
          IconButton(
            icon : Icon(Icons.search),
            onPressed : (){
              showSearch(context : context , delegate : DataSearch());
            },
          ),
        ]
      ),
      body : refresh(context),
    );
  }

}

class DataSearch extends SearchDelegate<String>
{
  

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

  void _bottomSheet(context,obj){
    showModalBottomSheet(
      context : context,
      shape : RoundedRectangleBorder(
        borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0))
      ),
      builder : (b){
        return Padding(
          padding : const EdgeInsets.all(16.0),
          child : SingleChildScrollView(
            child : Column(
              children : <Widget>[
                Center(child : Text('Ticket Details',textScaleFactor : 2.0,style : TextStyle(
                  color : Theme.of(context).primaryColor,
                  fontWeight : FontWeight.bold))),
                ListTile(
                  title : Text('Executive Name : '+obj.companyExecutiveName),
                ),
                ListTile(
                  title : Text('Company Name : '+obj.companyName),
                ),
                ListTile(
                  title : Text('Enquiry Remarks : '+obj.enquiryRemarks),
                ),
                ListTile(
                  title : Text('Ticket Remarks: '+obj.ticketRemarks),
                ),
                ListTile(
                  title : Text('Start Date : '+obj.startDateAndTime),
                ),
                ListTile(
                  title : Text('End date : '+obj.deadlineDateAndTime),
                ),
                ListTile(
                  title : Text('Product Name : '+obj.productName),
                ),
                ListTile(
                  title : Text('Enquiry Type : '+obj.ticketTypeName),
                ),
                ListTile(
                  title : Text('Priority : '+obj.ticketPriorityName),
                ),
                
                ListTile(
                  title : Text('Status : '+obj.statusName),
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

  @override
   ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  Widget buildSuggestions(BuildContext context)
  {

          
    final List<TicketClass> suggestionList = query.isEmpty?tickets:tickets.where((p)=>p.companyExecutiveName.startsWith(query)||
      p.productName.startsWith(query)||
      p.ticketTypeName.startsWith(query)||
      p.ticketPriorityName.startsWith(query)||
      p.companyName.startsWith(query)||
      p.statusName.startsWith(query)
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
                        text : suggestionList[index].productName.substring(
                          0,
                          query.length >= suggestionList[index].productName.length ? suggestionList[index].productName.length : query.length
                          ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                        children : [
                          TextSpan(
                            text : suggestionList[index].productName.substring(
                              query.length >= suggestionList[index].productName.length ? suggestionList[index].productName.length : query.length
                              ),
                            style : TextStyle(color : suggestionList[index].productName.startsWith(query) ? 
                              data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                             : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black ),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].ticketRemarks),
                trailing: IconButton(
                      icon : Icon(Icons.info_outline,size : 30.0,color : Colors.grey),
                      
                      onPressed : (){
                        _bottomSheet(context,suggestionList[index]);
                      }
                      ),
                onTap: () {
                  
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context) => UpdateTicket(suggestionList[index])
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
