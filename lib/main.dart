import 'package:astrobin_app/injection_container.dart';
import 'package:astrobin_app/ui_refactor/home.dart';
import 'package:flutter/material.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
