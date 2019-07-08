import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/viewmodels/pod_viewmodel.dart';
import 'package:astrobin_app/ui_refactor/widgets/card_pod.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';
import 'detail_astrobin_item.dart';

class PodAstrobinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage<PodViewModel>(
      onModelReady: (viewmodel) => viewmodel.getApodNasa(),
      builder: (context, viewmodel, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Astrobin Picture of Day"),
            ),
            body: buildWidget(context, viewmodel),
          ),
    );
  }

  Widget buildWidget(BuildContext context, PodViewModel viewmodel) {
    switch (viewmodel.state) {
      case ViewState.EndOfResults:
      case ViewState.Loading:
      case ViewState.Initial:
        return Center(
          child: CircularProgressIndicator(),
        );
      case ViewState.Failure:
        return Center(child: Text("Ha ocurrido un error"));
      case ViewState.Success:
        return GestureDetector(
          child: CardPod(
            podItem: viewmodel.podItem,
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new DetailAstrobinItem(
                        astrobinItem: viewmodel.podItem,
                      ))),
        );
    }
  }
}
