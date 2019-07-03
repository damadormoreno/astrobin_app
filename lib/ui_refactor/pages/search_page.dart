import 'package:astrobin_app/ui_refactor/pages/search_for_user.dart';
import 'package:flutter/material.dart';
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
              SearchUserWidgetRefactor(),
            ],
          ),
        ),
      ),
      length: 2,
    );
  }
}
