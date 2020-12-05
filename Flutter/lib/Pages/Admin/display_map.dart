import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;


class DisplayMap extends StatefulWidget {
    final double latitude,longitude;
    DisplayMap(this.latitude,this.longitude);

    @override
    _DisplayMapState createState() => _DisplayMapState();
  }

class _DisplayMapState extends State<DisplayMap>
{
	Completer<GoogleMapController> _controller = Completer();  
    Set<Marker> _markers = {};      
    Set<Polyline> _polylines = {};      
    List<LatLng> polylineCoordinates = [];      
    Timer timer;
    CameraPosition initialLocation;
    LatLng SOURCE_LOCATION,END_LOCATION;
    bool once=true;
    String user_id,date;


    @override
    void initState() {
      super.initState();
      SOURCE_LOCATION = LatLng(widget.latitude,widget.longitude);
      //timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getCurrentLocation());
      
    }
     void getCurrentLocation() async{
      var currentLocation = await Geolocator().
        getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      //print(currentLocation);
    }
    

    @override
    Widget build(BuildContext context) {  
      CameraPosition initialLocation = CameraPosition(
          zoom: CAMERA_ZOOM,
          bearing: CAMERA_BEARING,
          tilt: CAMERA_TILT,
          target: SOURCE_LOCATION
      ); 

      return GoogleMap(
          myLocationEnabled: true,  
          tiltGesturesEnabled: false,
          markers: _markers,
          mapType: MapType.normal,
          initialCameraPosition: initialLocation,
          onMapCreated: onMapCreated
      );

      
    }

    void onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
      setMapPins();
    }

    void setMapPins()
    {  
      setState(() {
        _markers.add(Marker(
           markerId: MarkerId('sourcePin'),
           position: SOURCE_LOCATION,
        ));      
        /*_markers.add(Marker(
           markerId: MarkerId('destPin'),
           position: END_LOCATION,
        ));  */
      });
    }
}