import 'package:astrobin_app/ui/navigation/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrobin App',
      home: Home(),
    );
  }
}
