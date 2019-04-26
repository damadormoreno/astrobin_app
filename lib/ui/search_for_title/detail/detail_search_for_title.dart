import 'package:astrobin_app/model/search_title/search_title_item.dart';
import 'package:flutter/material.dart';

class DetailSearchForTitle extends StatelessWidget {
  final SearchTitleItem astroItem;
  final bool inFavorites;

  const DetailSearchForTitle(
      {Key key, @required this.astroItem, this.inFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(this.astroItem.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(this.astroItem.description),
      ),
    );
  }
}
