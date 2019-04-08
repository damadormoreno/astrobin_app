import 'package:flutter/material.dart';

class SearchUserWidget extends StatelessWidget {
  final Color color;

  SearchUserWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Busqueda User"),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}
