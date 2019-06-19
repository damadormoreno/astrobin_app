import 'package:astrobin_app/ui_refactor/pages/apod_nasa_page.dart';
import 'package:astrobin_app/ui_refactor/pages/iss_page.dart';
import 'package:astrobin_app/ui_refactor/pages/search_page.dart';
import 'package:flutter/material.dart';

import 'pages/pod_astrobin_page.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PodAstrobinPage(),
    SearchPage(),
    ApodNasa(),
    IssPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            splashColor: Colors.yellowAccent,
            unselectedWidgetColor: Colors.green,
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Inicio"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text("APOD"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite),
              title: Text("ISS"),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
