import 'package:astrobin_app/model/search_title/search_title_item.dart';
import 'package:astrobin_app/ui/widget/astrobin_image.dart';
import 'package:astrobin_app/ui/widget/image_detail.dart';
import 'package:flutter/material.dart';

class DetailSearchForTitle extends StatefulWidget {
  final SearchTitleItem astroItem;
  final bool inFavorites;

  const DetailSearchForTitle(
      {Key key, @required this.astroItem, this.inFavorites})
      : super(key: key);

  @override
  _DetailSearchForTitleState createState() => _DetailSearchForTitleState();
}

class _DetailSearchForTitleState extends State<DetailSearchForTitle>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ImageDetail(
                                imageUrl: widget.astroItem.url_real,
                              ))),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AstrobinImage(
                        imageURL: widget.astroItem.url_regular,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.15, 0.5],
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  widget.astroItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.astroItem.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
