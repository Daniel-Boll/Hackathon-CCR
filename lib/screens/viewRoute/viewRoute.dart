import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewRoute extends StatefulWidget {
  @override
  ViewRouteState createState() => ViewRouteState();  
}

class ViewRouteState extends State<ViewRoute>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 155.0,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}