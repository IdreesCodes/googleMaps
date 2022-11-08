import 'dart:async';

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines extends StatefulWidget {
  const Polylines({Key? key}) : super(key: key);

  @override
  State<Polylines> createState() => _PolylinesState();
}

class _PolylinesState extends State<Polylines> {
  Completer <GoogleMapController> _controller= Completer();
  CameraPosition _kGooglePlex = CameraPosition(
    zoom: 18,
    target: LatLng(31.472448, 74.377135),
  );
  final Set<Marker> _markers ={};
  final Set<Polyline> _polyline = {};
  List<LatLng> latlng = [
    LatLng(31.472448, 74.377135),
    LatLng(31.504981, 74.321521),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0 ; i<latlng.length; i++)
      {
        _markers.add(
          Marker(markerId: MarkerId(i.toString()),
            position: latlng[i],
            infoWindow: InfoWindow(
              title: 'Place',

            ),
            icon: BitmapDescriptor.defaultMarker,

          )
        );
        setState(() {

        });
      }
    _polyline.add(
      Polyline(polylineId: PolylineId('1'),
      color: Colors.green.withOpacity(0.5),
      points: latlng
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polilines '),
        centerTitle: true,
      ),
      body: GoogleMap(
        markers: _markers,
        polylines: _polyline,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
