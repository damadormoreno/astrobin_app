import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:flutter/material.dart';

class AstrobinTitle extends StatelessWidget {
  final AstrobinItem astrobinItem;
  final double padding;

  const AstrobinTitle({Key key, this.astrobinItem, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.astrobinItem.title,
            style: Theme.of(context).textTheme.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.0),
          Text(
            this.astrobinItem.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              //Todo: Pasar a la lista de user con la búsqueda sobre ese user?
              print(this.astrobinItem.user);
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.shade800,
                  fontFamily: "Quicksand",
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Fotógrafo/a: ",
                  ),
                  TextSpan(
                    text: this.astrobinItem.user,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
