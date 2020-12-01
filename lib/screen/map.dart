import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
var lal;
var lol;
lw() async {
 
  print("lw");
  var p = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low
  );
 print(p); 
 lal = p.latitude;
  lol = p.longitude;
}
 
  @override
  Widget build(BuildContext context) {
var cp = CameraPosition(
target: LatLng(lal, lol),
zoom: 10,
tilt: 50,
);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text("My Map"),
      ),
      backgroundColor: Colors.yellow,
      body: GoogleMap(initialCameraPosition: cp,
      mapType: MapType.satellite,
      ),
      floatingActionButton: FloatingActionButton(onPressed: lw,
      child: Icon(Icons.add),)
    );
  }
}

