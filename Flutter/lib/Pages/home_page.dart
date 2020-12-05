//default
import 'package:flutter/material.dart';

//plugin
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';


//custom
import '../Models/Company/report_model.dart';
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
import '../User/current_user.dart';
import '../Bloc/theme.dart';
import '../Bloc/bottom_navigation.dart';

import 'notification.dart';




class HomePage extends StatefulWidget{
	HomePageState createState () => HomePageState();
}

class HomePageState extends State<HomePage>{

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
	

	Future<List<ReportClass>> getChartData() async{
    var json = await ApiCall.getDataFromApi(Uri.GET_PL+"/${CurrentUser.id}");
    //print('json  =   $json');
    List<ReportClass> reports = [];
    if(json=="nothing"){
        return reports;
    }


    //print(" ==== json length : --  ${json.length} ===");
    int ii = json.length>10 ? 10 : json.length;
    for(int i=0;i<ii;i++){

        dynamic time = json[i]['dateOfEntry'];
        dynamic rate = json[i]['plrate'];
        
        
          ReportClass r1 = ReportClass.retrieve(
            DateTime.parse(time),
            rate*1.0
        );  
         reports.add(r1);
        
         
        //reports.add(r1);
    }
    return reports;
    
  }

	final TextStyle stats = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);
	Widget build(BuildContext context){
		return SafeArea(
			child : Scaffold(
				//backgroundColor : Colors.grey[300],
				body : SingleChildScrollView(
					child : Column(
						crossAxisAlignment : CrossAxisAlignment.start,
						mainAxisSize : MainAxisSize.min,
						children : <Widget>[
							Card(
								elevation : 2.0,
								borderOnForeground : false,
								color : Colors.white,
								child : ListTile(
									title : Text(CurrentUser.name,style : TextStyle(
										fontWeight : FontWeight.w800,
										color : Theme.of(context).primaryColor,
										)),
									
									subtitle : Consumer<ThemeNotifier>(
										builder : (context,data,child){
											return Text(
												CurrentUser.companyName+' , '+CurrentUser.branchName,
												style : TextStyle(
													color : data.getTheme().brightness == Brightness.dark ? Colors.black : null,
												),
											);
										}
									),
									trailing : Consumer<ThemeNotifier>(
										builder : (context,data,child){
											return Stack(
												children : <Widget>[
													IconButton(
														icon : Icon(
															FontAwesomeIcons.bell,
															color : data.getTheme().brightness == Brightness.dark ? Colors.black : null,
														),
														onPressed : (){
															Navigator.push(
																context,
																MaterialPageRoute(builder : (context)=>Notifications())
															);
														},
													),
													CurrentUser.notificationCount != 0 ? Positioned(
														right : 5.0,
														top : 5.0,
														child : CircleAvatar(
															backgroundColor : Theme.of(context).primaryColor,
															foregroundColor : data.getTheme().brightness == Brightness.dark ? Colors.black : null,
															radius : 10.0,
															child : ClipOval(
																child : Text(
																	CurrentUser.notificationCount > 9 ? '+9' : '${CurrentUser.notificationCount}'
																),
															),
														),
													) : Text(''),
												]
											);
											
										}
									),
								),
							),
							Row(
								children : <Widget>[
									
									
									Expanded(
										child : Consumer<BottomNavigationNotifier>(
											builder : (context,data,child){
												return GestureDetector(
													onTap : (){
														data.setData(3,name : 'Immediate');
													},
													child : Container(
														padding : const EdgeInsets.all(8.0),
														margin : const EdgeInsets.all(8.0),
														height : 80.0,
														decoration : BoxDecoration(
															borderRadius : BorderRadius.circular(10.0),
															color : Color(0xffd41e1e),	
														),
														child : Column(
															mainAxisAlignment : MainAxisAlignment.center,
															children : <Widget>[
																Text(
																	'+${CurrentUser.immediateTicketCount}',
																	style : stats,
																),
																const SizedBox(height : 5.0),
																Text('Immediate'),
															]
														),
													),
												);
											}
										),
									),
									Expanded(
										child : Consumer<BottomNavigationNotifier>(
											builder : (context,data,child){
												return GestureDetector(
													onTap : (){
														data.setData(3,name : 'High');
													},
													child : Container(
														padding : const EdgeInsets.all(8.0),
														margin : const EdgeInsets.all(8.0),
														height : 80.0,
														decoration : BoxDecoration(
															borderRadius : BorderRadius.circular(10.0),
															color : Color(0xffd9b11e),	
														),
														child : Column(
															mainAxisAlignment : MainAxisAlignment.center,
															children : <Widget>[
																Text(
																	'+${CurrentUser.highTicketCount}',
																	style : stats,
																),
																const SizedBox(height : 5.0),
																Text('High'),
															]
														),
													),
												);
											}
										),
									),
								]
							),
							Row(
								children : <Widget>[
									Expanded(
										child : Consumer<BottomNavigationNotifier>(
											builder : (context,data,child){
												return GestureDetector(
													onTap : (){
														data.setData(3,name : 'Normal');
													},
													child : Container(
														padding : const EdgeInsets.all(8.0),
														margin : const EdgeInsets.all(8.0),
														height : 80.0,
														decoration : BoxDecoration(
															borderRadius : BorderRadius.circular(10.0),
															color : Color(0xff6db1e8),
														),
														child : Column(
															mainAxisAlignment : MainAxisAlignment.center,
															children : <Widget>[
																Text(
																	'+${CurrentUser.normalTicketCount}',
																	style : stats,
																),
																const SizedBox(height : 5.0),
																Text('Normal'),
															]
														),
													),
												);
											}
										),
									),
									Expanded(
										child : Consumer<BottomNavigationNotifier>(
											builder : (context,data,child){
												return GestureDetector(
													onTap : (){
														data.setData(3,name : 'Low');
													},
													child : Container(
														padding : const EdgeInsets.all(8.0),
														margin : const EdgeInsets.all(8.0),
														height : 80.0,
														decoration : BoxDecoration(
															borderRadius : BorderRadius.circular(10.0),
															color : Color(0xff4bbd6c),	
														),
														child : Column(
															mainAxisAlignment : MainAxisAlignment.center,
															children : <Widget>[
																Text(
																	'+${CurrentUser.lowTicketCount}',
																	style : stats,
																),
																const SizedBox(height : 5.0),
																Text('Low'),
															]
														),
													),
												);
											}
										),
									),
								]
							),
							Container(
								margin : const EdgeInsets.all(8.0),
								padding : const EdgeInsets.all(8.0),
								width : double.infinity,
								height : 350.0,
								decoration : BoxDecoration(
									borderRadius : BorderRadius.circular(5.0),
									color : Colors.white,
								),
								child : FutureBuilder(
									future : getChartData(),
									builder : (c,s){
										if(s.data==null){
											return Center(
												child : CircularProgressIndicator(),
											);
										}
										else{
											return  charts.TimeSeriesChart(
									                _createSampleData(s.data),
									                domainAxis: charts.DateTimeAxisSpec(
									                  showAxisLine : true,
									                ),
									                animate: true,
									                animationDuration : Duration(seconds : 2),
									                behaviors: [
									                  charts.SlidingViewport(),
									                  charts.PanAndZoomBehavior(),
									                  charts.LinePointHighlighter(),
									                  charts.ChartTitle('Performance',
									                    subTitle : 'Sep,2020',
									                    titleStyleSpec : charts.TextStyleSpec(
									                    		color : charts.Color.fromHex(code: '#429dbe'),
									                    		
									                    	),
									                    ),
									                  new charts.ChartTitle('Dates',
									                  	titleStyleSpec : charts.TextStyleSpec(
									                    		color : charts.Color.fromHex(code: '#429dbe'),
									                    		
									                    	),
									                    behaviorPosition: charts.BehaviorPosition.bottom,
									                   // titleOutsideJustification:charts.OutsideJustification.middleDrawArea
									                   ),
									                  new charts.ChartTitle('PL Rate',
									                  	titleStyleSpec : charts.TextStyleSpec(
									                    		color : charts.Color.fromHex(code: '#429dbe'),
									                    		
									                    	),
									                    behaviorPosition: charts.BehaviorPosition.start,
									                    titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
									                
									                ],
									                dateTimeFactory: const charts.LocalDateTimeFactory(),
									                defaultRenderer: charts.LineRendererConfig(
									                  includePoints: true,
									                ),
									              
									            );
										}
									}
								),
							),
						]
					),
				)
			),
		);
	}
}




