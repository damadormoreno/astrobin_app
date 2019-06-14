import 'package:astrobin_app/model/astrobin_item.dart';
import 'package:astrobin_app/ui/detail/detail_astrobin_item.dart';
import 'package:astrobin_app/ui/picture_of_day/picture_of_day_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

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
            return GestureDetector(
              child: _buildCard(snapshot),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DetailAstrobinItem(
                            astrobinItem: snapshot.data,
                          ))),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildCard(AsyncSnapshot<AstrobinItem> snapshot) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            _buildBackground(snapshot.data.urlRegular),
            _buildTopContent(snapshot),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTopContent(AsyncSnapshot<AstrobinItem> snapshot) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            snapshot.data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Fotografo/a: " + snapshot.data.user,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
