import 'package:astrobin_app/model/astrobin_item.dart';
import 'package:astrobin_app/ui/search_pod/picture_of_day_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:cached_network_image/cached_network_image.dart';

class PictureOfDayWidget extends StatefulWidget {
  @override
  _PictureOfDayWidgetState createState() => _PictureOfDayWidgetState();
}

class _PictureOfDayWidgetState extends State<PictureOfDayWidget> {
  final _podBloc = kiwi.Container().resolve<PictureOfDayBloc>();

  @override
  void initState() {
    super.initState();
    _podBloc.getPod();
  }

  @override
  void dispose() {
    _podBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Astrobin Picture of Day"),
      ),
      body: StreamBuilder(
        stream: _podBloc.pod,
        builder: (context, AsyncSnapshot<AstrobinItem> snapshot) {
          if (snapshot.hasData) {
            return _buildImageApod(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildImage(AsyncSnapshot<AstrobinItem> snapshot) {
    return Center(
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all(8.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: snapshot.data.urlRegular,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageApod(AsyncSnapshot<AstrobinItem> snapshot) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        alignment: Alignment.bottomCenter,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(snapshot.data.urlRegular),
          ),
        ),
        child: Container(
          color: Colors.white10,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                snapshot.data.title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

/*   Container(
          alignment: Alignment.bottomCenter,
          constraints: BoxConstraints.expand(width: 400, height: 30),
          color: Colors.white10,
          child: Text(
            snapshot.data.title,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ), */
}
