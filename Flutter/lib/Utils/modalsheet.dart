//default
import 'package:flutter/material.dart';

//plugins
import 'package:fluttertoast/fluttertoast.dart';

//custom
import 'popUp.dart';
import 'display_google_map.dart';
import '../Api_Services/ApiCallForDashboard.dart';
import '../User/current_user.dart';



//--------------------------------------------------------------------------
//        This class is used for displaying bottom modal sheet.
//        On tapping over owner the user is directly routed to
//        map screen(DisplayGoogleMap.dart). Otherwise, it 
//        routes to PopUp.dart
//--------------------------------------------------------------------------
class ModalSheet{

  static void settingModalSheet(int geoMapId, BuildContext context, bool isCompany, bool isCompanyExecutive, bool isCountry, bool isState, bool isCity, bool isArea){
    
    List<Widget> kids = [];

    kids.add(new ListTile(
            leading: new Icon(Icons.verified_user),
            title: new Text('Owner'),
            onTap: () async{
              print("Tapped");
              Navigator.pop(context);
              var IdArr =[CurrentUser.id];
              await constructUrl(geoMapId,1,IdArr).then((res){
                if(res != null){
                  String infoData;
                  if(geoMapId == 1){
                    infoData = 'companyExecutiveName';
                  } else if(geoMapId == 5){
                    infoData = 'companyBranchName';
                  } else if(geoMapId == 3){
                    infoData = 'contactName';
                  } else{
                    infoData = 'companyName';
                  }

                  print(geoMapId);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => StateForGoogleMap(res,infoData),
                    ),
                  );
                } else{
                  Fluttertoast.showToast(
                      msg: "No GeoMap available for the selected fields",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }                
              }); 
            }
          ));

    if(isCompany){
      kids.add(new ListTile(
                  leading: new Icon(Icons.work),
                  title: new Text('Company'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,isCompany,false,false,false,false,false);
                  }
                ));
    }
    if(isCompanyExecutive){
      kids.add(new ListTile(
                  leading: new Icon(Icons.person),
                  title: new Text('Executive'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,isCompany,isCompanyExecutive,false,false,false,false);
                  }
                ));
    }
    if(isCountry){
      kids.add(new ListTile(
                  leading: new Icon(Icons.ac_unit),
                  title: new Text('Country'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,false,false,isCountry,false,false,false);
                  }
                ));
    }
    if(isState){
      kids.add(new ListTile(
                  leading: new Icon(Icons.location_searching),
                  title: new Text('State'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,false,false,isCountry,isState,false,false);
                  }
                ));
    }
    if(isCity){
      kids.add(new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('City'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,false,false,isCountry,isState,isCity,false);
                  }
                ));
    }
    if(isArea){
      kids.add(new ListTile(
                  leading: new Icon(Icons.device_hub),
                  title: new Text('Area'),
                  onTap: () {
                    print("Tapped");
                    Navigator.pop(context);
                    PopUp.showFancyCustomDialog(geoMapId,context,false,false,isCountry,isState,isCity,isArea);
                  }
                ));
    }

    ModalSheet.displayBottomSheet(context,kids);
  }

  static void displayBottomSheet(BuildContext context, List<Widget> kids) {
    showModalBottomSheet(
        context: context,
        isScrollControlled:true,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: kids,
            ),
          );
        });
  }

}
  