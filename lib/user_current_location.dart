import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserCUrrentLocation extends StatefulWidget {
  const UserCUrrentLocation({Key? key}) : super(key: key);

  @override
  State<UserCUrrentLocation> createState() => _UserCUrrentLocationState();
}

class _UserCUrrentLocationState extends State<UserCUrrentLocation> {
  final Completer<GoogleMapController> _controller =Completer();
  static const CameraPosition _kGooglePlex  = CameraPosition(
    target:LatLng(31.472593, 74.377339),
    zoom: 14.4746,);

   List<Marker> _marker =  <Marker>[
    Marker(markerId: MarkerId('1'),
      position: LatLng(31.4016561, 74.2293467),
      infoWindow: InfoWindow(
          title: 'MyCurrentLocation'
      ),

    ),

  ];
  Future<Position> GetUserCurrentLocation()async{
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      print(" error "+error.toString());
    });
    return await Geolocator.getCurrentPosition();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          GetUserCurrentLocation().then((value) async{
            print('Current location');
            print(value.latitude.toString() +" "+value.longitude.toString());
            
            _marker.add(
              Marker(

                markerId: MarkerId('2'),
              position: LatLng (value.latitude, value.longitude)),


            );
            CameraPosition cameraPosition = CameraPosition(
                zoom: 18,
                target: LatLng (value.latitude, value.longitude));
            final GoogleMapController controller= await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {

            });



          });
        },
        child: Icon(Icons.my_location_sharp),
      ),

    );
  }
}
