//default
import 'package:flutter/material.dart';
import 'dart:convert';

//plugins
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


//custom
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import '../../Models/Company/dashboard.dart';
import '../../Utils/ModalSheet.dart';
import "../../Api_Services/Uri.dart";



class AdminHome extends StatefulWidget{
	@override
	_AdminHomeState createState()=> _AdminHomeState();
}

final List<String> imgList = [
  'map4.jpeg',
  'map6.jpeg',
  'map7.jpeg',
  'map3.jpeg',
  'map5.jpeg'
];

final List<String> titles = [
  'Company Executive',
  'Company',
  'Client',
  'Enquiry',
  'Company Branch'
];

List<Widget> imageAutoSliders(BuildContext context){
  final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.all(5.0),
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () {
              switch (imgList.indexOf(item)) {
                case 0:
                  ModalSheet.settingModalSheet(1,context,true,false,true,true,true,false);
                  break;
                case 1:
                  ModalSheet.settingModalSheet(2,context,false,false,true,true,true,false);
                  break;
                case 2:
                  ModalSheet.settingModalSheet(3,context,true,false,true,true,true,true);
                  break;
                case 3:
                  ModalSheet.settingModalSheet(4,context,true,true,true,true,true,true);
                  break;
                case 4:
                  ModalSheet.settingModalSheet(5,context,true,false,true,true,true,false);
                  break;
                default:
                  print('No Geomap Found');
                  break;
              }
            },
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 8,
                  child: Opacity(
                    opacity: 0.7,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.asset('Assets/Images/$item',
                            fit: BoxFit.cover, height: 200, width: 1000.0)),
                  ),
                ),
                // Center(
                //   child: Text(
                //     titles[imgList.indexOf(item)],
                //     textScaleFactor: 1.5,
                //     //textAlign: TextAlign.center,
                //   ),
                // ),
                Positioned(
                  right : 10.0,
                  bottom : 10.0,
                  child : Text(titles[imgList.indexOf(item)],textScaleFactor : 1.5,style : TextStyle(fontWeight : FontWeight.bold)),
                ),
              ],
            ),
          ),
        ))
    .toList();
  return imageSliders;
}

getDashboardData() async {

  var headers = {
    'Authorization': CurrentUser.ACCESS_TOKEN
  };
  final res = await http.get(Uri.GET_OWNER+'/dashboard/${CurrentUser.id}',headers: headers);

  return Dashboard.fromJson(jsonDecode(res.body));
}

class _AdminHomeState extends State<AdminHome>{
	Dashboard dashboardData;

  Widget displayCard(IconData ic, String title, String count, int colorCode) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          child: Container(
          width : MediaQuery.of(context).size.width * 0.4,
          height : 350,
          child : Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            elevation: 7,
            color: Color(colorCode),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(ic, color: Colors.white70),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(title,
                                
                                )),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.black26),
                Text(
                  count+'*',
                  textScaleFactor: 1.6,
                ),
              ],
            ),
          )),
          onTap : null,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer : CustomDrawer(dashboardSelected : true),
      appBar: AppBar(title: Text('Dashboard')),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height * 1.4,
            child: FutureBuilder(
                future: getDashboardData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    dashboardData = snapshot.data;

                    return Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                            ),
                            items: imageAutoSliders(context),
                          ),
                        ),
                        Divider(),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      'Top Perfomances',
                                      textScaleFactor : 1.8,
                                      style : TextStyle(
                                        color : Theme.of(context).accentColor,
                                        fontWeight : FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  flex : 3,
                                  child : dashboardData.topExecutives.length == 0 ?
                                          Center(child : Text('No Data Exists.!!',style : TextStyle(fontSize : 25.0,fontWeight : FontWeight.bold))) : 
                                          ListView.builder(
                                      itemCount:
                                          dashboardData.topExecutives.length,
                                      itemBuilder: (con, index) {
                                        var item =
                                            dashboardData.topExecutives[index];
                                        return Card(
                                          elevation: 3,
                                          child: ListTile(
                                            leading : Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: new BoxDecoration(
                                                  color : Colors.transparent,
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.fitHeight,
                                                      image: index == 0 ? AssetImage('Assets/Images/first.jpg') : index == 1 ? AssetImage('Assets/Images/second.jpg') :  AssetImage('Assets/Images/third.jpg')
                                                  )
                                              )
                                            ),
                                            title: Text('${item.executiveName}',
                                                style:TextStyle(
                                                  color : Theme.of(context).primaryColor,
                                                ),
                                                ),
                                            trailing: Text('${item.plRate}'),
                                          ),
                                        );
                                      }
                                      ) 
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 1,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                            'STATS AT GLANCE',
                                            textScaleFactor : 1.8,
                                            style : TextStyle(
                                              fontWeight : FontWeight.bold,
                                              color : Theme.of(context).accentColor,
                                            ),
                                          ))),
                                  Divider(),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: displayCard(
                                              Icons.shopping_cart,
                                              'Products',
                                              '${dashboardData.numberOfProducts}',
                                              0xffffc400),
                                        ),
                                        Expanded(
                                          child: displayCard(
                                              Icons.people,
                                              'Clients',
                                              '${dashboardData.numberOfClients}',
                                              0xff2c75b0),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: displayCard(
                                                Icons.pages,
                                                'Tickets',
                                                '${dashboardData.numberOftickets}',
                                                0xffeb6963)),
                                        Expanded(
                                          child: displayCard(
                                              Icons.business_center,
                                              'Executives',
                                              '${dashboardData.numberOfExecutives}',
                                              0xff28b061),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: SimpleDialog(
                        title: Center(
                          child: Text('Please check your internet connection', textAlign: TextAlign.center)
                        ),                        
                        children: [
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () { 
                              Navigator.of(context).pushReplacementNamed('/admin_home');
                            },
                          )
                        ],
                      )
                    );
                  }
                  // if(snapshot.data.length == 0){
                  //   return Text('No data exists.!!');
                  // }
                  //return Center(child : CircularProgressIndicator());
                  return Align(
                    alignment : Alignment(0.0, -0.45),
                    child : CircularProgressIndicator(),
                  );
                })),
      ),
    );
  }
}
