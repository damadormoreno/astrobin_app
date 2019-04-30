import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  const ImageDetail({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.wallpaper),
            ),
          ),
        ],
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(this.imageUrl),
        ),
      ),
    );
  }
}
