import 'package:flutter/material.dart';
import 'package:astrobin_app/ui/search_for_title/search_object.dart';
import 'package:astrobin_app/ui/search_for_user/search_user.dart';

import 'search_for_title.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 10),
            child: Container(
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "Astro",
                  ),
                  Tab(
                    text: "Usuario",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SearchObjectWidgetRefactor(),
              SearchUserWidget(),
            ],
          ),
        ),
      ),
      length: 2,
    );
  }
}
