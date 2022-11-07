import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller= Completer();
  static const CameraPosition _kGooglePlex  = CameraPosition(
      target:LatLng(31.472593, 74.377339),
      zoom: 14.4746,);
  final List<Marker> _marker =[];
   final List<Marker> _list =[
    const Marker(markerId: MarkerId('1'),
    position: LatLng(31.472593, 74.377339),
      infoWindow: InfoWindow(
        title: 'MyCurrentLocation'
      ),

    ),
  Marker(markerId: MarkerId('2'),
  position: LatLng(33.738045, 75.084488),
  infoWindow: InfoWindow(
  title: 'E-11'
  ),
  )
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter map'),

      ),
      body: GoogleMap(initialCameraPosition: _kGooglePlex,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      compassEnabled: true,
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(_marker),
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        onPressed: ()async{

          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(31.472593, 74.377339),
            zoom: 18.5)
            
          ));

        },
      ),

    );
  }
}
