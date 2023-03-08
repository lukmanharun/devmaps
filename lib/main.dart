import 'package:flutter/material.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'map-view.dart';
void main() 
{
  num distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
    LatLng(-6.172881553325693, 106.8303591046327),
    LatLng(-6.900522348726149, 107.61891111560345)
  );
  runApp(MyApp(data: distanceBetweenPoints,));
}

class MyApp extends StatelessWidget {
  final num data;
  const MyApp({super.key,required this.data});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MapView(data: data),
    );
  }
}