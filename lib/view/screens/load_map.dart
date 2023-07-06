import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadMap extends StatefulWidget {
  const LoadMap({super.key});

  @override
  State<LoadMap> createState() => _LoadMapState();
}

class _LoadMapState extends State<LoadMap> {
  final Completer<GoogleMapController> _mapcontroller = Completer();

  //will be used for initial camera position
  static const CameraPosition _center =
      CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 14);

  final List<Marker> _marker = [];

  //this can be pulled from an API
  final List<Marker> _branch = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(45.521563, -122.677433),
        infoWindow: InfoWindow(title: 'testing')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(45.511100, -122.677433),
        infoWindow: InfoWindow(title: 'testing 1', snippet: 'testing'))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_branch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Google Map App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _mapcontroller.complete(controller);
        },
        initialCameraPosition: _center,
      ),
    );
  }
}
