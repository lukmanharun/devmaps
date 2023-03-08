// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dev_maps/main.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  num distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
    LatLng(-6.172881553325693, 106.8303591046327),
    LatLng(-6.900522348726149, 107.61891111560345)
  );
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(data: distanceBetweenPoints));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
