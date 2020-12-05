//default
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//plugins
import 'package:provider/provider.dart';

//custom
import '../User/current_user.dart';
import '../Pages/Admin/city.dart';
import '../Pages/Admin/client_admin.dart';
import '../Pages/Admin/product.dart';
import '../Pages/Admin/status.dart';
import '../Pages/Admin/enquiry_type.dart';
import '../Pages/Admin/position.dart';
import '../Pages/Admin/company.dart';
import '../Pages/Admin/company_executive.dart';
import '../Pages/Admin/company_branch.dart';
import '../Pages/Admin/company_branch_type.dart';
import '../Pages/Admin/ticket_admin.dart';
import '../Pages/Admin/enquiry_admin.dart';
import '../Pages/Admin/area.dart';
import '../Pages/Admin/company_area.dart';
import '../Pages/Admin/company_region.dart';
import '../Pages/Admin/report_pdf.dart';
import '../Pages/my_account.dart';
import '../Bloc/theme.dart';
import '../Pages/Admin/home_admin.dart';
import '../Pages/login_screen.dart';
import '../Utils/shared_prefs.dart';
import '../Utils/theme.dart';





class CustomDrawer extends StatefulWidget{
  final bool dashboardSelected;
  final bool citySelected;
  final bool areaSelected;
  final bool clientSelected;
  final bool companySelected;
  final bool companyBranchSelected;
  final bool companyBranchTypeSelected;
  final bool companyExecutiveSelected;
  final bool companyRegionSelected;
  final bool companyAreaSelected;
  final bool enquirySelected;
  final bool enquiryTypeSelected;
  final bool productSelected;
  final bool statusSelected;
  final bool positionSelected;
  final bool ticketSelected;
  final bool reportSelected;
  final bool settingsSelected;

  CustomDrawer({
    this.dashboardSelected = false,
    this.citySelected = false,
    this.areaSelected = false,
    this.clientSelected = false,
    this.companySelected = false,
    this.companyBranchSelected = false,
    this.companyBranchTypeSelected = false,
    this.companyExecutiveSelected = false,
    this.companyRegionSelected = false,
    this.companyAreaSelected = false,
    this.enquirySelected = false,
    this.enquiryTypeSelected = false,
    this.productSelected = false,
    this.statusSelected = false,
    this.positionSelected = false,
    this.ticketSelected = false,
    this.reportSelected = false,
    this.settingsSelected = false
  });


	CustomDrawerState createState ()=> CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>{

  

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
	Widget build(BuildContext context){
    return Consumer<ThemeNotifier>(
      builder : (context,data,child){
        return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height ,
          color :  data.getTheme().brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
          child : ListView(
            padding : EdgeInsets.only(top : 20.0),
            children : <Widget>[
              Row(
                children : <Widget>[
                  Expanded(
                    child : CircleAvatar(
                      radius : 35.0,
                      foregroundColor : Colors.white,
                      backgroundColor : Theme.of(context).accentColor,
                      child : Text(CurrentUser.ownerName[0].toUpperCase(),textScaleFactor : 2.0),
                    ),
                  ),
                  Expanded(
                    child : Text(
                      'IVCRM',
                      textScaleFactor : 2.0,
                      style : TextStyle(
                        color : Theme.of(context).primaryColor,
                        fontWeight : FontWeight.bold,
                      ),
                    ),
                  ),
                ]
              ),
              Padding(
                padding : const EdgeInsets.only(left : 35.0,top : 15.0),
                child : Text(
                  CurrentUser.ownerName,
                  textScaleFactor : 1.4,
                  style : TextStyle(
                    fontWeight : FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding : const EdgeInsets.only(left : 35.0,top : 5.0),
                child : Text(
                  CurrentUser.ownerEmail,
                  style : TextStyle(
                    color : Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height : 10.0),
              Divider(height : 5.0),
              ListTile(
                selected :  widget.dashboardSelected,
                leading : Icon(Icons.dashboard),
                title : Text('Dashboard'),
                onTap : (){
                  

                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return AdminHome();
                      }
                    )
                  );
                },
              ),
              ExpansionTile(
//                selected : locationSelected,
                leading : Icon(Icons.add_location),
                title : Text('Location'),
                children  : <Widget>[
                  ListTile(
                    selected : widget.citySelected,
                    title : Text('City'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder : (context){
                            return City();
                          }
                        )
                      );
                    },
                  ),
                  ListTile(
                    selected : widget.areaSelected,
                    title : Text('Area'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder : (context){
                            return Area();
                          }
                        )
                      );
                    },
                  ),
                ]
              ),
              ListTile(
                selected : widget.clientSelected,
                leading : Icon(Icons.person),
                title : Text('Client'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return ClientAdmin();
                      }
                    )
                  );
                },
              ),
              ExpansionTile(
//                selected : companySelected,
                leading : Icon(Icons.group),
                title : Text('Company'),
                children : <Widget>[
                  ListTile(
                    selected : widget.companySelected,
                    title : Text('Company'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder : (context){
                            return Company();
                          }
                        )
                      );
                    },
                  ),
                  
                  ListTile(
                    selected : widget.companyExecutiveSelected,
                    title : Text('Company Executive'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context,MaterialPageRoute(builder : (context)=>CompanyExecutive()));
                    },
                  ),
                  ExpansionTile(
                    title : Text('Company Branch'),
                    children : <Widget>[
                      ListTile(
                        selected : widget.companyBranchSelected,
                        title : Text('Company Branch'),
                        onTap : (){
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context,MaterialPageRoute(builder : (context)=>CompanyBranch()));
                        },
                      ),
                      ListTile(
                        selected : widget.companyBranchSelected,
                        title : Text('Company Branch Type'),
                        onTap : (){
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context,MaterialPageRoute(builder : (context)=>CompanyBranchType()));
                        },
                      ),
                    ]
                  ),
                  ExpansionTile(
                    title : Text('Company Region'),
                    children : <Widget>[
                      ListTile(
                        selected : widget.companyRegionSelected,
                        title : Text('Company Region'),
                        onTap : (){
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context,MaterialPageRoute(builder : (context)=>CompanyRegion()));
                        },
                      ),
                      ListTile(
                        selected : widget.companyAreaSelected,
                        title : Text('Company Area'),
                        onTap : (){
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(context,MaterialPageRoute(builder : (context)=>CompanyArea()));
                        },
                      ),  
                    ]
                  ),
                ]
              ),
              ExpansionTile(
                leading : Icon(Icons.edit),
                title : Text('Enquiry'),
                children : <Widget>[
                  ListTile(
                    selected : widget.enquirySelected,
                    title : Text('Enquiry'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EnquiryAdmin()));
                    },
                  ),
                  ListTile(
                    selected : widget.enquiryTypeSelected,
                    title : Text('Enquiry Type'),
                    onTap : (){
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EnquiryType()));
                    },
                  ),
                ]
              ),
              ListTile(
                selected : widget.productSelected,
                leading : Icon(Icons.shopping_cart),
                title : Text('Product'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return Product();
                      }
                    )
                  );
                },
              ),
              ListTile(
                selected : widget.statusSelected,
                leading : Icon(Icons.access_time),
                title : Text('Status'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return Status();
                      }
                    )
                  );
                },
              ),
              ListTile(
                selected : widget.positionSelected,
                leading : Icon(Icons.event_seat),
                title : Text('Position'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return Position();
                      }
                    )
                  );
                },
              ),
              ListTile(
                selected : widget.ticketSelected,
                leading : Icon(Icons.pages),
                title : Text('Ticket'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return TicketAdmin();
                      }
                    )
                  );
                },
              ),
              ListTile(
                selected : widget.reportSelected,
                leading : Icon(Icons.assessment),
                title : Text('Reports'),
                onTap : (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return ReportPdf();
                      }
                    )
                  );
                },
              ),
              
              Divider(height : 5.0),
              ListTile(
                selected : widget.settingsSelected,
                leading : Icon(Icons.settings),
                title : Text('Settings'),
                onTap : (){
                  
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return MyAccount(isOwner : true);
                      }
                    )
                  );
                },
              ),
              ListTile(
                leading : Icon(Icons.power_settings_new),
                title : Text('Logout'),
                onTap : () async {
                  var themeNotifier = Provider.of<ThemeNotifier>(context,listen : false);
                        //print(themeNotifier);
                        themeNotifier.setTheme(lightTheme);
                  SharedPref sharedPref = SharedPref();
                  await sharedPref.remove('owner');
                  // Navigator.popUntil(context, ModalRoute.withName("/admin_home")).then((_){

                  // });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder : (context){
                        return LoginScreen();
                      }
                    )
                  );
                },
              ),


            ]
          ),
        );    
      }
    );
		
	}
}

