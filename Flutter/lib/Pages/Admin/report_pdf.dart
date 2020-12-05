
import "package:flutter/material.dart";
//import '../Utils/color.dart';
import 'generate_report.dart';
import '../../Api_Services/ApiCallForPdf.dart';
import '../../Api_Services/Uri.dart';
import '../../Widgets/custom_drawer.dart';







class ReportPdf extends StatefulWidget{
  @override
  ReportPdfState createState () => ReportPdfState();
}

class ReportPdfState extends State<ReportPdf>{



  void showFancyCustomDialog(BuildContext context, int rid) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 300.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Choose the location",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Card(
                        color: Colors.grey[300],
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(60),
                          hoverColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print("State Tapped");
                            callerMeth(context,rid,"state");
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            child: Center(
                              child: Text('State',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2.0),
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    Card(
                        color: Colors.grey[300],
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(60),
                          hoverColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print("City Tapped");
                            callerMeth(context,rid,"city");
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            child: Center(
                              child: Text('City',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2.0),
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    Card(
                        color: Colors.grey[300],
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(60),
                          hoverColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print("Area Tapped");
                            callerMeth(context,rid,"area");
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            child: Center(
                              child: Text('Area',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2.0),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(0.95, -0.90),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }

  void callerMeth(BuildContext context, int reportID, String location){
    if(reportID == 1){
      getStatusReport(1,location).then((res){
        reportGen(res,"Status Report",context);

      });  
    }
    else if(reportID == 2){
      getPriorityReport(1,location).then((res){
        reportGen(res,"Priority Report",context);
      }); 
    }
    else if(reportID == 3){
      getTimeReport(1,location).then((res){
        reportGen(res,"Time Report",context);
      }); 
    }  
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer : CustomDrawer(reportSelected : true),
      appBar : AppBar(
        title : Text('Report PDF'),
      ),
      body : Container(
        child: Column(
          children: <Widget>[
            Container(
                child: Row(
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () => showFancyCustomDialog(context,1),
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Center(
                            child: Text('Status Report', textScaleFactor: 1.5,
                              style : TextStyle(
                                color : Theme.of(context).primaryColor,
                                fontWeight : FontWeight.w500,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(30.0),
                        ),
                      ),
                      elevation: 5.0,
                    ),
                    SizedBox(width: 10),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () => showFancyCustomDialog(context,2),
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Center(
                            child:
                                Text('Priority Report', textScaleFactor: 1.5,
                              style : TextStyle(
                                color : Theme.of(context).primaryColor,
                                fontWeight : FontWeight.w500,
                              ),),
                          ),
                          padding: EdgeInsets.all(30.0),
                        ),
                      ),
                      elevation: 5.0,
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 10, left: 15)),
            Container(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () => showFancyCustomDialog(context,3),
                  child: Container(
                    width: 310,
                    height: 150,
                    child: Center(
                      child: Text('Time based report', textScaleFactor: 1.5,
                              style : TextStyle(
                                color : Theme.of(context).primaryColor,
                                fontWeight : FontWeight.w500,
                              ),),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
                elevation: 5.0,
              ),
            ),
            Container(
                child: Row(
                  children: <Widget>[
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: (){
                          print("API Call for Executive Report");
                            getExecutiveReport(1).then((res){
                              print(res);
                              reportGen(res,"Executive Report",context);
                            });  
                          },
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Center(
                            child:
                                Text('Executive report', textScaleFactor: 1.5,
                              style : TextStyle(
                                color : Theme.of(context).primaryColor,
                                fontWeight : FontWeight.w500,
                              ),),
                          ),
                          padding: EdgeInsets.all(15.0),
                        ),
                      ),
                      elevation: 5.0,
                    ),
                    SizedBox(width: 10),
                    Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: (){
                            print("API Call for Product Report"); 
                            getProductReport().then((res){
                              reportGen(res,"Product Report",context);
                            });                                                       
                          },
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Center(
                            child: Text('Product report', textScaleFactor: 1.5,
                              style : TextStyle(
                                color : Theme.of(context).primaryColor,
                                fontWeight : FontWeight.w500,
                              ),),
                          ),
                          padding: EdgeInsets.all(25.0),
                        ),
                      ),
                      elevation: 5.0,
                    )
                  ],
                ),
                padding: EdgeInsets.only(left: 15)),
          ],
        ),
      ),
    );
  }
}