import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final CameraPosition initialPosition = CameraPosition(
  //   target: LatLng(
  //     37.5214,
  //     126.9246,
  //   ),
  //   zoom: 15,
  // );
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
        target: LatLng(37.50508097213444, 126.95493073306663),
    zoom: 18
    )
    ),
    )
  }
}
