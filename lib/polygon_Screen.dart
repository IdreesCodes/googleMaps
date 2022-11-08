import 'dart:async';

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({Key? key}) : super(key: key);

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {
  Completer <GoogleMapController> _controller= Completer();
  CameraPosition _kGooglePlex = CameraPosition(
      zoom: 18,
      target: LatLng(31.466313, 74.349899),
  );
 // final Set<Marker> _marker = {};
  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points= [
    LatLng(31.466313, 74.349899),
    LatLng(31.484141, 74.364936),
    LatLng(31.481223, 74.418066),
    LatLng(31.453549, 74.408509),
    LatLng(31.456305, 74.345750),
    LatLng(31.466313, 74.349899),


  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(
      Polygon(polygonId: PolygonId('1'), points: points,
      fillColor: Colors.red.withOpacity(0.2),
      geodesic: true,
      strokeWidth: 4,
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polygon'),
        centerTitle: true,
      ),
      body: GoogleMap(initialCameraPosition: _kGooglePlex,
         myLocationEnabled: false,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        },

        
      ),
    );
  }
}
