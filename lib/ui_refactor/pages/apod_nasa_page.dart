import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/viewmodels/apod_viewmodel.dart';
import 'package:astrobin_app/ui_refactor/pages/detail_apod_item.dart';
import 'package:astrobin_app/ui_refactor/widgets/card_apod.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

import 'base_page.dart';

class ApodNasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<ApodViewModel>(
      onModelReady: (viewmodel) => viewmodel.getApodNasa(),
      builder: (context, viewmodel, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Astronomy Picture of Day"),
            ),
            body: buildWidget(context, viewmodel),
          ),
    );
  }

  Widget buildWidget(BuildContext context, ApodViewModel viewmodel) {
    switch (viewmodel.state) {
      case ViewState.Loading:
      case ViewState.Initial:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.Failure:
        return Center(child: Text("Ha ocurrido un error"));
      case ViewState.EndOfResults:
      case ViewState.Success:
        if (viewmodel.apodItem.mediaType == "video") {
          return Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    viewmodel.apodItem.title,
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
                    source: viewmodel.apodItem.url,
                    autoPlay: false,
                    quality: YoutubeQuality.MEDIUM,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    viewmodel.apodItem.explanation,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        } else if (viewmodel.apodItem.mediaType == "image") {
          return GestureDetector(
            child: CardApod(
              apodItem: viewmodel.apodItem,
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new DetailApodItem(
                          apodItem: viewmodel.apodItem,
                        ))),
          );
        }
    }
  }
}
