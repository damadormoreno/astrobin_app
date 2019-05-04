import 'package:flutter/material.dart';

class PictureOfDayWidget extends StatefulWidget {
  final Color color;

  PictureOfDayWidget(this.color);

  @override
  _PictureOfDayWidgetState createState() => _PictureOfDayWidgetState();
}

class _PictureOfDayWidgetState extends State<PictureOfDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Astrobin App"),
      ),
      body: Container(
        color: widget.color,
      ),
    );
  }
}
