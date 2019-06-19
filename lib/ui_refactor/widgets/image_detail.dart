import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wallpaper/wallpaper.dart';

class ImageDetail extends StatelessWidget {
  final String imageUrl;
  final String imageUrlRegular;
  const ImageDetail(
      {Key key, @required this.imageUrl, @required this.imageUrlRegular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          GestureDetector(
            onTap: () async {
              String res = await Wallpaper.homeScreen(this.imageUrlRegular)
                  .whenComplete(() => showMyDialog(context));
            },
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

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Imágen establecida como wallpaper',
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
