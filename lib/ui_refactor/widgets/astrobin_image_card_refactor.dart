import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/ui_refactor/pages/detail_astrobin_item.dart';
import 'package:astrobin_app/ui_refactor/pages/detail_search_for_title_refactor.dart';
import 'package:astrobin_app/ui_refactor/widgets/astrobin_image.dart';
import 'package:astrobin_app/ui_refactor/widgets/astrobin_title_refactor.dart';
import 'package:flutter/material.dart';

class AstrobinImageCard extends StatelessWidget {
  final AstrobinItem searchTitleItem;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  const AstrobinImageCard(
      {Key key,
      @required this.searchTitleItem,
      @required this.inFavorites,
      @required this.onFavoriteButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(searchTitleItem),
        child: Icon(
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).buttonColor,
        shape: CircleBorder(),
      );
    }

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new DetailAstrobinItem(
                    astrobinItem: searchTitleItem,
                  ))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Card(
          color: Colors.grey.shade100,
          clipBehavior: Clip.antiAlias,
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AstrobinImage(
                    imageURL: searchTitleItem.urlRegular,
                  ),
                  /* Positioned(
                    child: _buildFavoriteButton(),
                    top: 2.0,
                    right: 2.0,
                  ) */
                ],
              ),
              AstrobinTitle(
                astrobinItem: searchTitleItem,
                padding: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
