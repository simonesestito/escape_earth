import 'package:escape_earth/bottom_home.dart';
import 'package:escape_earth/route/collection.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget currentFragment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentFragment = HomeBody();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: BOTTOM_BAR_HEIGHT),
            child: currentFragment,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomHome(
              buttons: <Widget>[
                Image(
                    image: AssetImage("assets/img/ic_home_news.png"),
                    color: Colors.white),
                Image(image: AssetImage("assets/img/home_rocket.png")),
                Image(
                    image: AssetImage("assets/img/home_collection.png"),
                    color: Colors.white), // TODO: change icon
              ],
              clickListener: (index) {
                switch (index) {
                  case 0:
                    // TODO
                    break;
                  case 1:
                    // TODO
                    break;
                  case 2:
                    setState(() {
                      currentFragment = CollectionRocketRoute();
                    });
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
