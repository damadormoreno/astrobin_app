import 'package:astrobin_app/model/apodItem.dart';
import 'package:astrobin_app/ui/apod_nasa/apod_nasa_bloc.dart';
import 'package:astrobin_app/ui/detail/detail_apod_item.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodNasa extends StatefulWidget {
  @override
  _ApodNasaState createState() => _ApodNasaState();
}

class _ApodNasaState extends State<ApodNasa> {
  final _apodBloc = kiwi.Container().resolve<ApodNasaBloc>();

  @override
  void initState() {
    super.initState();
    _apodBloc.getApodNasa();
  }

  @override
  void dispose() {
    _apodBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Astronomy Picture of Day"),
      ),
      body: StreamBuilder(
        stream: _apodBloc.apod,
        builder: (context, AsyncSnapshot<ApodItem> snapshot) {
          String videoId;

          if (snapshot.hasData && snapshot.data.mediaType == "video") {
            videoId = YoutubePlayer.convertUrlToId(snapshot.data.url);
            return Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    YoutubePlayer(
                      context: context,
                      videoId: videoId,
                      autoPlay: false,
                      showVideoProgressIndicator: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data.explanation,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data.mediaType == "image") {
            return GestureDetector(
              child: _buildCard(snapshot),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DetailApodItem(
                            apodItem: snapshot.data,
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

  Widget _buildCard(AsyncSnapshot<ApodItem> snapshot) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            _buildBackground(snapshot.data.url),
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

  Widget _buildTopContent(AsyncSnapshot<ApodItem> snapshot) {
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
        ],
      ),
    );
  }
}
