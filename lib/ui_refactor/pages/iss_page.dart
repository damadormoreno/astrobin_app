import 'dart:async';

import 'package:astrobin_app/core/constants/urls_youtube.dart';
import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/viewmodels/iss_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:youtube_player/youtube_player.dart';

import 'base_page.dart';

class IssPage extends StatefulWidget {
  @override
  _IssPageState createState() => _IssPageState();
}

class _IssPageState extends State<IssPage> {
  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISS"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: BasePage<IssViewModel>(
              onModelReady: (viewModel) {
                timer = Timer.periodic(Duration(seconds: 15),
                    (Timer t) => viewModel.getIssPosition());
                viewModel.getIssPosition();
              },
              builder: (context, viewmodel, widget) =>
                  buildWidget(context, viewmodel),
            ),
          ),
          Expanded(
            flex: 1,
            child: YoutubePlayer(
              context: context,
              source: UrlConstants.issLiveId,
              isLive: true,
              quality: YoutubeQuality.MEDIUM,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWidget(BuildContext context, IssViewModel viewmodel) {
    switch (viewmodel.state) {
      case ViewState.Initial:
      case ViewState.EndOfResults:
      case ViewState.Loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.Failure:
        return Center(child: Text("Ha ocurrido un error"));
      case ViewState.Success:
        return FlutterMap(
          options: MapOptions(
            center: LatLng(
              double.parse(viewmodel.issPositioned.issPosition.latitude),
              double.parse(viewmodel.issPositioned.issPosition.longitude),
            ),
            zoom: 2,
            maxZoom: 2,
            minZoom: 2,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 25.0,
                  height: 25.0,
                  point: new LatLng(
                    double.parse(viewmodel.issPositioned.issPosition.latitude),
                    double.parse(viewmodel.issPositioned.issPosition.longitude),
                  ),
                  builder: (ctx) => Container(
                        child: Image.asset("images/space-station.png"),
                      ),
                ),
              ],
            ),
          ],
        );
    }
  }
}
