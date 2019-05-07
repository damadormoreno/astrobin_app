import 'package:astrobin_app/model/apodItem.dart';
import 'package:astrobin_app/ui/apod_nasa/apod_nasa_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:cached_network_image/cached_network_image.dart';
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
            return Center(
              child: YoutubePlayer(
                context: context,
                videoId: videoId,
                autoPlay: false,
                showVideoProgressIndicator: true,
              ),
            );
          } else if (snapshot.hasData && snapshot.data.mediaType == "image") {
            return _buildImage(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildImage(AsyncSnapshot<ApodItem> snapshot) {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: snapshot.data.url,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

/*   Widget _buildVideo(AsyncSnapshot<ApodItem> snapshot) {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: Center(
        child: FlutterYoutube.playYoutubeVideoByUrl(
            apiKey: "AIzaSyA66KWDUES4DSji1wctLTfpyytaPhYKKhc",
            videoUrl: snapshot.data.url,
            autoPlay: false, //default falase
            fullScreen: false //default false
            ),
      ),
    );
  } */
}
