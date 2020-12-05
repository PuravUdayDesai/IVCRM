//default
import 'package:flutter/material.dart';
import 'dart:async';

//plugins
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

//custom
import '../Api_Services/ApiCallForDashboard.dart';



//--------------------------------------------------------------------------
//      This class generates the GoogleMap and calls the Api
//      on the basis of all the previous selections. Once the
//      result is returned the markers are plotted. 
//--------------------------------------------------------------------------

const double CAMERA_ZOOM = 5;
LatLng CAMERA_LOCATION = LatLng(20.5937,78.9629);

class StateForGoogleMap extends StatefulWidget {
  var res;
  String infoData;
  StateForGoogleMap(this.res,this.infoData);

  @override
  DisplayGoogleMap createState() => DisplayGoogleMap(res,infoData);
}

class DisplayGoogleMap extends State<StateForGoogleMap>  {

    var response;
    String inD;
    DisplayGoogleMap(this.response, this.inD);

    Completer<GoogleMapController> _controller = Completer();   
    // This set will hold the markers
    Set<Marker> _markers = {};      

    @override
    Widget build(BuildContext context) {  
      print(CAMERA_LOCATION); 
      CameraPosition initialLocation = CameraPosition(
          zoom: CAMERA_ZOOM,
          target: CAMERA_LOCATION
      );   

      return GoogleMap(
          myLocationEnabled: true,  
          tiltGesturesEnabled: false,
          markers: _markers,
          mapType: MapType.hybrid,
          initialCameraPosition: initialLocation,
          onMapCreated: onMapCreated
      );
    }

    void onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
      getLatLongForMap();
    }

    void getLatLongForMap() async{

      Set<Marker> tempMarkers = {};     
      //var res = await getCompanyExecutiveGeoMapByOwnerId(156);           
      for(int i=0;i<response.length;i++){
        tempMarkers.add(
          Marker(
            infoWindow: InfoWindow(title: response[i][inD]),
            markerId: MarkerId(i.toString()),
            position: LatLng(double.parse(response[i]['latitude']), double.parse(response[i]['longitude']))
        ));
      }

      setState((){
        CAMERA_LOCATION = LatLng(double.parse(response[0]['latitude']), double.parse(response[0]['longitude']));
        _markers = tempMarkers;
      });

    }

  }
