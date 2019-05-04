import 'package:astrobin_app/ui/search_for_title/search_object.dart';
import 'package:astrobin_app/ui/search_for_user/search_user.dart';
import 'package:astrobin_app/ui/search_pod/picture_of_day.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PictureOfDayWidget(Colors.grey),
    SearchObjectWidget(),
    SearchUserWidget(),
    PictureOfDayWidget(Colors.blue),
    PictureOfDayWidget(Colors.green),
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
              icon: Icon(Icons.brightness_5),
              title: Text("Astro"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Usuario"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text("Apod"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Favoritos"),
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