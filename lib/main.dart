import 'package:astrobin_app/injection_container.dart';
import 'package:astrobin_app/ui/navigation/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astrobin App',
      theme: ThemeData(fontFamily: "Quicksand"),
      home: Home(),
    );
  }
}
