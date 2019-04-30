import 'package:flutter/material.dart';

class AstrobinImage extends StatelessWidget {
  final String imageURL;

  const AstrobinImage({Key key, @required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Image.network(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
