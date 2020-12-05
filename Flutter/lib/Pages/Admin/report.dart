//default
import 'package:flutter/material.dart';


//plugins
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//custom
import 'company_executive.dart';
import '../../Models/Company/company_executive_model.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Models/Company/report_model.dart';

class Report extends StatefulWidget{

  final int id;
  Report(this.id);
	@override
	ReportState createState() => ReportState();
}

class ReportState extends State<Report>{

	int companyExecutiveId;
	String filterStringTitle='Graph';
  String filterStringSubtitle='';
  String filters;
  String oneDate='';
  bool once=false;
  TextEditingController startDate;
  TextEditingController endDate;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _autovalidate = false;
  String monthValue='';
  String yearValue='';
  String yearValue2='';
  bool monthFilterApply = false;
  bool yearFilterApply = false;
  String xaxisValue ='Date';
  bool isFilterApply = false;
  DateTime firstDate,secondDate;

  @override
  void initState(){
    filters = '/${widget.id}';
  }

    var seriesList = List<ReportClass>();

    List<charts.Series<ReportClass, DateTime>> _createSampleData(List<ReportClass> data) {
    return [
      charts.Series<ReportClass, DateTime>(
        id: 'time',
        colorFn: (_, __) => charts.Color.fromHex(code: '#ff6d00'),
        domainFn: (ReportClass sales, _) => sales.filterType,
        measureFn: (ReportClass sales, _) => sales.plrate,
        data: data,
      )
    ];
  }

  Future _chooseDate(BuildContext context) async 
  {
    var now = new DateTime.now();
    dynamic result = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2050)
        );

    if (result == null) return;
    result=result.toString().substring(0,10);
    setState((){
      filters ="/date/${widget.id}?date=$result";
      filterStringSubtitle = 'Date = $result';
      isFilterApply = true;
    });

    
  }

  refresh (context) {
    return FutureBuilder(
      future: getData(),  
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                semanticsLabel: "Loading 1..",
                semanticsValue: "Loading 2..",
              ),
            ),
          );
        } else {
          if(snapshot.data.length==0)
          {
            return Center(
              child : Column(
                mainAxisAlignment : MainAxisAlignment.center,
                crossAxisAlignment : CrossAxisAlignment.center,
                children : <Widget>[
                  Text(
                    'No Records Available ..',
                    style : TextStyle(
                      fontSize : 20.0,
                    )
                  ),
                  SizedBox(height : 20.0),
                  isFilterApply ? 
                  GestureDetector(
                    onTap : (){
                      setState((){
                        filters = "/${widget.id}";
                        filterStringSubtitle = '';
                        xaxisValue = 'Date';
                        isFilterApply = false;
                      });
                    },
                    child : Text(
                      'Click here to reset filters',
                      style : TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid,
                        fontStyle: FontStyle.italic,
                        fontWeight : FontWeight.bold,
                        color : Theme.of(context).primaryColor,
                      )
                    )
                  ) : Container(),
                ]
              ),
            );
          }
          else
          {
            return Container(
              margin : const EdgeInsets.all(8.0),
              padding : const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration : BoxDecoration(
                borderRadius : BorderRadius.circular(5.0),
                color : Colors.grey[200],
              ),
              child: charts.TimeSeriesChart(
                _createSampleData(snapshot.data),
                domainAxis: charts.DateTimeAxisSpec(
                  //showAxisLine : true,
                  tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                    month: charts.TimeFormatterSpec(
                      //format: 'YYYY',
                      //transitionFormat: 'yyyy',
                    ),
                  ),
                ),
                animate: true,
                animationDuration : Duration(seconds : 2),
                behaviors: [
                  charts.SlidingViewport(),
                  charts.PanAndZoomBehavior(),
                  charts.LinePointHighlighter(),
                  charts.ChartTitle(filterStringTitle,
                    subTitle : filterStringSubtitle),
                  new charts.ChartTitle(xaxisValue,
                    behaviorPosition: charts.BehaviorPosition.bottom,
                   // titleOutsideJustification:charts.OutsideJustification.middleDrawArea
                   ),
                  new charts.ChartTitle('PL Rate',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                
                ],
                dateTimeFactory: const charts.LocalDateTimeFactory(),
                defaultRenderer: charts.LineRendererConfig(
                  includePoints: true,
                ),
              ),
            );
          }
          
        }
      },
    );
  }

  Future<List<ReportClass>> getData() async{
    var json = await ApiCall.getDataFromApi(Uri.GET_PL+""+filters);
    List<ReportClass> reports = [];
    if(json=="nothing"){
        return reports;
    }
    int ii = json.length>10 ? 10 : json.length;
    for(int i=0;i<ii;i++){

        dynamic time = json[i]['dateOfEntry'];
        print('time = $time');
        dynamic rate = json[i]['plrate'];
        if(monthFilterApply){
          time = new DateTime(int.parse(yearValue2),time);
          ReportClass r1 = ReportClass.retrieve(
            time,
            rate*1.0
          );
          reports.add(r1);
          
        }
        else if(yearFilterApply){
          time = new DateTime(time);
          print(time);
          ReportClass r1 = ReportClass.retrieve(
            time,
            rate*1.0
          );
          
          reports.add(r1);

        }
        else{
          ReportClass r1 = ReportClass.retrieve(
            DateTime.parse(time),
            rate*1.0
        );  
         reports.add(r1);
        }
         
        //reports.add(r1);
    }
    monthFilterApply = false;
    yearFilterApply=false;
    return reports;
    
  }

  bool isValidStartDate(String dob) {
    if (dob.isEmpty) return false;
    try{
          List<String> s = dob.split('/');
    if(int.parse(s[2]) > 2050){
      return false;
    }
    if(int.parse(s[1]) > 12 ||int.parse(s[1]) <= 0){
      return false;
    }

    if(int.parse(s[0]) > 31 ||int.parse(s[0]) <= 0){
      return false;
    }

    if(int.parse(s[0]) == 31){
       if(int.parse(s[1])==2||int.parse(s[1])==4||
      int.parse(s[1])==6||int.parse(s[1])==9||int.parse(s[1])==11)    {
      return false;  
      }
      
    }
    if(int.parse(s[2])%4 == 0){
      if(int.parse(s[1]) == 2 &&int.parse(s[1]) >28){
        return false;
      }
    }
    firstDate = DateTime(int.parse(s[2]),int.parse(s[1]),int.parse(s[0]));
    return true;      
    }
    catch(e){
      return false;
    }

  }

  bool isValidEndDate(String dob) {
    if (dob.isEmpty) return false;
    try{
          List<String> s = dob.split('/');
    if(int.parse(s[2]) > 2050){
      return false;
    }
    if(int.parse(s[1]) > 12 ||int.parse(s[1]) <= 0){
      return false;
    }

    if(int.parse(s[0]) > 31 ||int.parse(s[0]) <= 0){
      return false;
    }

    if(int.parse(s[0]) == 31){
       if(int.parse(s[1])==2||int.parse(s[1])==4||
      int.parse(s[1])==6||int.parse(s[1])==9||int.parse(s[1])==11)    {
      return false;  
      }
      
    }
    if(int.parse(s[2])%4 == 0){
      if(int.parse(s[1]) == 2 &&int.parse(s[1]) >28){
        return false;
      }
    }
    secondDate = DateTime(int.parse(s[2]),int.parse(s[1]),int.parse(s[0]));
    if(firstDate.isAfter(secondDate)){
      return false;
    }
    
    return true;      
    }
    catch(e){
      return false;
    }

  }

  DateTime convertToDate(String input) {
    try 
    {
      print('ip = $input');
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }

  chnageWithTwoDates(){
    String sd=startDate.text;
    List<String> ssd=sd.split('/');
    sd=""+ssd[2]+"-"+ssd[1]+"-"+ssd[0];
    String ed=endDate.text;
    List<String> sed=ed.split('/');
    ed=""+sed[2]+"-"+sed[1]+"-"+sed[0];
    setState((){
      filters = "/betweenDate/${widget.id}?dateStart=$sd&dateEnd=$ed";
      filterStringSubtitle = 'Start Date : ${startDate.text}\nEnd Date : ${endDate.text}';
      isFilterApply = true;
      firstDate = DateTime.now();
      secondDate = DateTime.now();
      });
  }

  chnageWithMonth(){
    if(monthValue==''){
      monthValue='1';
    }
    if(yearValue==''){
      yearValue='2020';
    }
    setState((){
      filters = '/month/${widget.id}?month=$monthValue&year=$yearValue';
      filterStringSubtitle = 'Month : $monthValue\nYear : $yearValue';
      xaxisValue = 'Month';
      isFilterApply = true;
      });
  }

  chnageWithYear(){
    if(yearValue2==''){
      yearValue2='2020';
    }
    setState((){
      filters = '/year/${widget.id}?year=$yearValue2';
      monthFilterApply = true;
      filterStringSubtitle = 'Year : $yearValue2';
      xaxisValue = 'Year';
      isFilterApply = true;
    });
  }


  twoDates(context){
    _autovalidate = false;
    startDate  = new TextEditingController();
    endDate  = new TextEditingController();

    return showDialog(
      context : context,
      builder : (context1){
       return StatefulBuilder(
        builder : (context2,st){
          return Dialog(
          child : Container(
            width : 200.0,
            height : 200.0,
            child : Form(
            key : _formKey,
            autovalidate : _autovalidate,
            child : ListView(
              children : <Widget>[
              Padding(
                padding : const EdgeInsets.all(8.0),
                child : Row(
                  children : <Widget>[

                  Text('Start Date : '),
                  SizedBox(width : 5.0),
                  Expanded(
                    child : TextFormField(
                      controller : startDate,
                      decoration : InputDecoration(
                        hintText : 'DD/MM/YYYY',
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (val) => isValidStartDate(val) ? null : 'Not a valid date',
                    ),
                  ),
                  IconButton(
                    icon: new Icon(Icons.date_range),
                    tooltip: 'Choose date',
                    onPressed: (()async {
                     var now = new DateTime.now();

                    var result = await showDatePicker(
                        context: context1,
                        initialDate: now,
                        firstDate: new DateTime(1900),
                        lastDate: new DateTime(2050));

                    if (result == null) return;

                    st(() {                    
                      startDate.text = new DateFormat("dd/M/yyyy").format(result);
                    });
                    }),
                  )
                  ]
                )),
                Padding(
                padding : const EdgeInsets.all(8.0),
                child : Row(
                  children : <Widget>[

                  Text('End Date : '),
                  SizedBox(width : 5.0),
                  Expanded(
                    child : TextFormField(
                      controller : endDate,
                      decoration : InputDecoration(
                        hintText : 'DD/MM/YYYY',
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (val) => isValidEndDate(val) ? null : 'Not a valid date',
                    ),
                  ),
                  IconButton(
                    icon: new Icon(Icons.date_range),
                    tooltip: 'Choose date',
                    onPressed: (()async {
                     var now = new DateTime.now();

                    var result = await showDatePicker(
                        context: context1,
                        initialDate: now,
                        firstDate: new DateTime(1900),
                        lastDate: new DateTime(2050));

                    if (result == null) return;

                    st(() {                    
                      endDate.text = new DateFormat("dd/M/yyyy").format(result);
                    });
                    }),
                  )
                  ]
                )),
                SizedBox(height : 30.0),
                Align(
                alignment: Alignment.bottomRight,
                child : Row(
                  mainAxisAlignment : MainAxisAlignment.end,
                  mainAxisSize : MainAxisSize.min,
                  children : <Widget>[
                    FlatButton(
                      child : Text('Cancel'),
                      onPressed : (){
                        Navigator.of(context1).pop();
                        },
                    ),
                    FlatButton(
                      child : Text('OK'),
                      onPressed : (){
                        if(_formKey.currentState.validate()){
                          Navigator.of(context1).pop();
                          chnageWithTwoDates(); 
                          st((){
                            _autovalidate = false;
                          });
                            

                        }
                        else{
                          st((){
                            _autovalidate = true;
                            });
                        }
                        },
                    ),
                  ]
                )
                )
              ]
              ),
            ),
          ),
          );
        }
        ); 
      }
    );
  }

  month(context){
    return showDialog(
      context : context,
      builder : (context1){
        return StatefulBuilder(
          builder : (context2,setState){
            return Dialog(
              child : Container(
                width : 200.0,
                height : 200.0,
                child : Padding(
                  padding : const EdgeInsets.fromLTRB(56.0,8.0,8.0,8.0),
                  child : ListView(
                    children : <Widget>[
                      Row(
                        children : <Widget>[
                          Text('Months : '),
                          SizedBox(width : 10.0),
                          Flexible(
                            child : DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text(
                                  "Jan",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text(
                                  "Feb",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Text(
                                  "Mar",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "4",
                                child: Text(
                                  "Apr",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "5",
                                child: Text(
                                  "May",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "6",
                                child: Text(
                                  "June",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "7",
                                child: Text(
                                  "July",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "8",
                                child: Text(
                                  "Aug",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "9",
                                child: Text(
                                  "Sept",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "10",
                                child: Text(
                                  "Oct",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "11",
                                child: Text(
                                  "Nov",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "12",
                                child: Text(
                                  "Dec",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                 monthValue = value;
                              });
                            },
                            value: monthValue == '' ? '1' : monthValue,
                          ),
                          ),

                        ],
                      ),
                      Row(
                        children : <Widget>[
                          Text('Year : '),
                          SizedBox(width : 10.0),
                          Flexible(
                            child : DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                value: "2020",
                                child: Text(
                                  "2020",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2021",
                                child: Text(
                                  "2021",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2022",
                                child: Text(
                                  "2022",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2023",
                                child: Text(
                                  "2023",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2024",
                                child: Text(
                                  "2024",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2025",
                                child: Text(
                                  "2025",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2026",
                                child: Text(
                                  "2026",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2027",
                                child: Text(
                                  "2027",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2028",
                                child: Text(
                                  "2028",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2029",
                                child: Text(
                                  "2029",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2030",
                                child: Text(
                                  "2030",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                 yearValue = value;
                              });
                            },
                            value: yearValue=='' ? '2021' : yearValue,
                          ),
                          ),

                          ],
                        ),
                  SizedBox(height : 30.0),
                  Align(
                  alignment: Alignment.bottomRight,
                  child : Row(
                    mainAxisAlignment : MainAxisAlignment.end,
                    mainAxisSize : MainAxisSize.min,
                    //crossAxisAlignment : CrossAxisAlignment.end,
                    children : <Widget>[
                      FlatButton(
                        child : Text('Cancel'),
                        onPressed : (){
                          //Navigator.pop(context);
                          Navigator.of(context1).pop();
                          },
                      ),
                      FlatButton(
                        child : Text('OK'),
                        onPressed : (){
                          Navigator.of(context1).pop();
                          chnageWithMonth();
                          },
                      ),
                    ]
                  )
                  ),
                    ],
                    
                  ),
                ),
              )
            );
          }
        );
      }
    );
  }


  year(context){
    return showDialog(
      context : context,
      builder : (context1){
        return StatefulBuilder(
          builder : (context2,setState){
            return Dialog(
              child : Container(
                height : 150.0,
                width : 200.0,
                child : Padding(
                  padding : const EdgeInsets.fromLTRB(56.0,8.0,8.0,8.0),
                  child : ListView(
                    children : <Widget>[
                        Row(
                        children : <Widget>[
                          Text('Year : '),
                          SizedBox(width : 10.0),
                          Flexible(
                            child : DropdownButton<String>(
                            items: [
                              DropdownMenuItem(
                                value: "2020",
                                child: Text(
                                  "2020",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2021",
                                child: Text(
                                  "2021",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2022",
                                child: Text(
                                  "2022",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2023",
                                child: Text(
                                  "2023",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2024",
                                child: Text(
                                  "2024",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2025",
                                child: Text(
                                  "2025",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2026",
                                child: Text(
                                  "2026",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2027",
                                child: Text(
                                  "2027",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2028",
                                child: Text(
                                  "2028",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2029",
                                child: Text(
                                  "2029",
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2030",
                                child: Text(
                                  "2030",
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                 yearValue2 = value;
                              });
                            },
                            value: yearValue2=='' ? '2021' : yearValue2,
                          ),
                          ),

                          ],
                        ),
                        SizedBox(height : 30.0),
                        Align(
                        alignment: Alignment.bottomRight,
                        child : Row(
                          mainAxisAlignment : MainAxisAlignment.end,
                          mainAxisSize : MainAxisSize.min,
                          //crossAxisAlignment : CrossAxisAlignment.end,
                          children : <Widget>[
                            FlatButton(
                              child : Text('Cancel'),
                              onPressed : (){
                                //Navigator.pop(context);
                                Navigator.of(context1).pop();
                                },
                            ),
                            FlatButton(
                              child : Text('OK'),
                              onPressed : (){
                                Navigator.of(context1).pop();
                                chnageWithYear();
                                },
                            ),
                          ]
                        )
                        ),

                    ]
                  
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }

    
	@override
  Widget build(BuildContext context) {
    

    return Scaffold(
    appBar: AppBar(
        title: Text('Report'),
        actions : <Widget>[
        PopupMenuButton<String>(
        onSelected: (String result) {
        if(result=='oneDate'){
          _chooseDate(context);
        }
        else if(result=='betweenDate'){
          twoDates(context);
        }
        else if(result=='month'){
          month(context);
        }
        else if(result=='year'){
          year(context);
        }
        else if(result=='allYear'){
          setState((){
            filters = '/years/${widget.id}';
            yearFilterApply = true;
            filterStringSubtitle = 'All Years .';
            xaxisValue = 'Year';
            isFilterApply = true;
          });
        }
    },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
      value: 'oneDate',
      child: Text('View for one date'),
    ),
    //const PopupMenuDivider(),
    const PopupMenuItem<String>(
      value: 'betweenDate',
      child: Text('View between two dates'),
    ),
    const PopupMenuItem<String>(
      value:'month',
      child: Text('View By Month of a year'),
    ),
    const PopupMenuItem<String>(
      value: 'year',
      child: Text('View for one year'),
    ),
    const PopupMenuItem<String>(
      value: 'allYear',
      child: Text('View for all years'),
    ),
  ],
)
      
    ]
  ),
  body: refresh(context),
);
  }
}


///enquiryType
/// companybranch
/// status
/// client