import 'dart:async';

import 'package:astrobin_app/model/iss_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:astrobin_app/ui/iss/iss_position_bloc.dart';

class IssPage extends StatefulWidget {
  @override
  _IssPageState createState() => _IssPageState();
}

class _IssPageState extends State<IssPage> {
  final _issPositionBloc = kiwi.Container().resolve<IssPositionBloc>();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => _issPositionBloc.getIssPosition());
    _issPositionBloc.getIssPosition();
  }

  @override
  void dispose() {
    timer?.cancel();
    _issPositionBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ISS"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: _issPositionBloc.issPosition,
            builder: (context, AsyncSnapshot<IssPositioned> snapshot) {
              if (snapshot.hasData) {
                return FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                      double.parse(snapshot.data.issPosition.latitude),
                      double.parse(snapshot.data.issPosition.longitude),
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
                            double.parse(snapshot.data.issPosition.latitude),
                            double.parse(snapshot.data.issPosition.longitude),
                          ),
                          builder: (ctx) => Container(
                                child: Image.asset("images/space-station.png"),
                              ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
