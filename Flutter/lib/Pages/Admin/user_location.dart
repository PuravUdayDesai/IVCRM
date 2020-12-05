//default
import 'dart:async';
import 'package:flutter/material.dart';

//plugins
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//custom

import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import 'company_executive.dart';
import '../../Models/Company/company_executive_model.dart';


const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
//const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
//const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);
//const LatLng MID_LOCATION = LatLng(42.6571386, -71.2543403);
//const LatLng MID_LOCATION1 = LatLng(40.0000000,-60.2543403);
//-----------------------------------------------------------

//-----------------------------------------------------------
  class UserLocation extends StatefulWidget {
    final int userId;
    UserLocation(this.userId);

    @override
    _UserLocationState createState() => _UserLocationState();
  }

  
//-----------------------------------------------------------
  class _UserLocationState extends State<UserLocation> {

    Completer<GoogleMapController> _controller = Completer();  
    Set<Marker> _markers = {};      
    Set<Polyline> _polylines = {};      
    List<LatLng> polylineCoordinates = [];      
    Timer timer;
    CameraPosition initialLocation;
    LatLng SOURCE_LOCATION,END_LOCATION;
    bool once=false;
    int companyExecutiveId;
    String filters='';
    CompanyExecutiveClass args;

    @override
    void initState() {
      super.initState();
      //timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getCurrentLocation());
      
    }

    Future<String> getData() async {
    var json = await ApiCall.getDataFromApi(Uri.GET_GEO+"/${widget.userId}");
    if(json=='nothing')
    {
      return "nothing";
    }

    
    
    for (int i = 0; i < json.length; i++) {
      int _companyExecutiveGeoLocationId = json[i]['companyExecutiveGeoLocationId'];
      String _latitude = json[i]['latitude'];
      String _longitude = json[i]['longitude'];
      int _companyExecutiveId = json[i]['companyExecutiveId'];
      String _companyExecutiveName = json[i]['companyExecutiveName'];
      int _companyId = json[i]['companyId'];
      String _companyName = json[i]['companyName'];
      String _entryDateAndTime = json[i]['entryDateAndTime'];
      LatLng coord = new LatLng(double.parse(_latitude),double.parse(_longitude));
      polylineCoordinates.add(coord); 
      if(i==0){
        SOURCE_LOCATION = new LatLng(double.parse(_latitude),double.parse(_longitude ));
      }
      if(i==json.length-1)
      {
        END_LOCATION = new LatLng(double.parse(_latitude),double.parse(_longitude ));
      }

    }
     initialLocation = CameraPosition(
          zoom: CAMERA_ZOOM,
          bearing: CAMERA_BEARING,
          tilt: CAMERA_TILT,
          target: SOURCE_LOCATION
      ); 
    print("dekh le!");
    return "success";
  }

    @override
    void dispose() {
      timer?.cancel();
      super.dispose();
    }

    void getCurrentLocation() async{
      var currentLocation = await Geolocator().
        getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      //print(currentLocation);
    }

    @override
    Widget build(BuildContext context) {  
      
      return Scaffold(
        body : FutureBuilder(
        future : getData(),
        builder : (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data==null)
          {
            return Container(
            child: Center(
              child: CircularProgressIndicator(
                semanticsLabel: "Loading 1..",
                semanticsValue: "Loading 2..",
              ),
            ),
          );
          }
          else
          {
            //print("hello   "+snapshot.data.toString());
            if(snapshot.data=="nothing"){
              return Center(
                child : Text(
                  'No Records available for this user,',
                  textScaleFactor : 2.0,
                  style : TextStyle(
                    color : Theme.of(context).primaryColor,
                    fontWeight : FontWeight.bold
                  ),
                ),
              );
            }
            else
            {
                return  GoogleMap(
                  myLocationEnabled: true,  
                  tiltGesturesEnabled: false,
                  markers: _markers,
                  polylines: _polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  onMapCreated: onMapCreated
                  );
            }  
        
          }
        }
        )
      );

      

      
    }

    void onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
      setMapPins();
      setPolylines();
    }

    void setMapPins()
    {  
      setState(() {
        _markers.add(Marker(
           markerId: MarkerId('sourcePin'),
           position: SOURCE_LOCATION,
        ));      
        _markers.add(Marker(
           markerId: MarkerId('destPin'),
           position: END_LOCATION,
        ));  
      });
    }

    void setPolylines()
    {  
        /*polylineCoordinates.add(SOURCE_LOCATION);
        polylineCoordinates.add(MID_LOCATION);
        polylineCoordinates.add(DEST_LOCATION);
        polylineCoordinates.add(MID_LOCATION1);*/
        //print(polylineCoordinates);
        setState(() {
          _polylines.add(Polyline(
            polylineId: PolylineId("first"),
            visible: true,
            width:3,          
            points: polylineCoordinates,
            color: Colors.green,
          ));
        });
    }

  }

//-----------------------------------------------------------------------------------------


