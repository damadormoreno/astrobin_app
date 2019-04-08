import 'package:flutter/material.dart';

class PictureOfDayWidget extends StatelessWidget {
  final Color color;

  PictureOfDayWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Astrobin App"),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}
