import 'package:astrobin_app/ui/widget/search_bar.dart';
import 'package:flutter/material.dart';

class SearchObjectWidget extends StatelessWidget {
  final Color color;

  SearchObjectWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SearchBar(),
      ),
      body: Container(
        color: color,
      ),
    );
  }
}
