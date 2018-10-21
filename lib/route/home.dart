import 'package:escape_earth/bottom_home.dart';
import 'package:escape_earth/route/collection.dart';
import 'package:escape_earth/route/qa.dart';
import 'package:escape_earth/view/NewsView.dart';
import 'package:escape_earth/view/RocketHero.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget currentFragment;

  @override
  void initState() {
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
                Image.asset("assets/img/ic_home_news.png", color: Colors.white),
                GestureDetector(
                    child: RocketHero(),
                    onVerticalDragEnd: (_) => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => QaRoute()))),
                Image.asset("assets/img/home_collection.png",
                    color: Colors.white),
              ],
              clickListener: (index) {
                switch (index) {
                  case 0:
                    setState(() {
                      currentFragment = NewsList();
                    });
                    break;
                  case 1:
                    if (currentFragment is HomeBody) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => QaRoute()));
                    } else {
                      setState(() {
                        currentFragment = HomeBody();
                      });
                    }
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
    // TODO: implement HomeBody
    return Container();
  }
}
