import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final num data;
  const MapView({Key? key,required this.data}):super(key: key);
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> 
{
  
  double latitude = -6.208742352021905;
  double longitude = 106.84556483270144;
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MapView'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 8,
              ),
              markers: 
              {
                const Marker(
                  markerId: MarkerId("jakarta"),
                  position: LatLng(-6.172881553325693, 106.8303591046327),
                ),
                const Marker(
                  markerId: MarkerId("Bandung"),
                  position: LatLng(-6.900522348726149, 107.61891111560345),
                ),
              },
              onMapCreated: (GoogleMapController controller){
                if(!_controller.isCompleted)
                {
                  _controller.complete(controller);
                }
              },
            ),
            ),
            SizedBox(
              height: 50,
              child: Text('Distance : ${((widget.data/1000).toStringAsFixed(0))} KM'),
            )
          ],
        )
      ),
    );
  }
  @override
  void dispose() {
      super.dispose();
    }
  
}