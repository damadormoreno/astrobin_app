import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/ui_refactor/widgets/astrobin_image.dart';
import 'package:astrobin_app/ui_refactor/widgets/image_detail.dart';
import 'package:flutter/material.dart';

class DetailAstrobinItem extends StatefulWidget {
  final AstrobinItem astrobinItem;

  const DetailAstrobinItem({Key key, @required this.astrobinItem})
      : super(key: key);

  @override
  _DetailAstrobinItemState createState() => _DetailAstrobinItemState();
}

class _DetailAstrobinItemState extends State<DetailAstrobinItem>
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
                                imageUrl: widget.astrobinItem.urlReal,
                                imageUrlRegular: widget.astrobinItem.urlRegular,
                              ))),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AstrobinImage(
                        imageURL: widget.astrobinItem.urlRegular,
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
                  widget.astrobinItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.astrobinItem.user),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.astrobinItem.description,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Telescopios: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 0),
                      itemCount: widget.astrobinItem.imagingTelescopes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.adjust),
                          title: Text(
                              widget.astrobinItem.imagingTelescopes[index]),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Cámaras: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 0),
                      itemCount: widget.astrobinItem.imagingCameras.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.camera),
                          title:
                              Text(widget.astrobinItem.imagingCameras[index]),
                        );
                      },
                    ),
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
