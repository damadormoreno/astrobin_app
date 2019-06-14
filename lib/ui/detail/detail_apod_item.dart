import 'package:astrobin_app/model/apodItem.dart';
import 'package:astrobin_app/ui/widget/astrobin_image.dart';
import 'package:astrobin_app/ui/widget/image_detail.dart';
import 'package:flutter/material.dart';

class DetailApodItem extends StatefulWidget {
  final ApodItem apodItem;

  const DetailApodItem({Key key, @required this.apodItem}) : super(key: key);

  @override
  _DetailApodItemState createState() => _DetailApodItemState();
}

class _DetailApodItemState extends State<DetailApodItem>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  @override
  void initState() {
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
                                imageUrl: widget.apodItem.url,
                                imageUrlRegular: widget.apodItem.url,
                              ))),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AstrobinImage(
                        imageURL: widget.apodItem.url,
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
                  widget.apodItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.apodItem.explanation,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(widget.apodItem.date)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
