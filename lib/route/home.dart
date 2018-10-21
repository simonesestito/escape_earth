import 'package:escape_earth/bottom_home.dart';
import 'package:escape_earth/route/collection.dart';
import 'package:escape_earth/route/qa.dart';
import 'package:escape_earth/service/RocketService.dart';
import 'package:escape_earth/view/NewsView.dart';
import 'package:escape_earth/view/RocketHero.dart';
import 'package:escape_earth/view/RocketView.dart';
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
            child: SafeArea(child: currentFragment),
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
    return FutureBuilder(
      future: RocketService.getNextLaunch(),
      builder: (context, snap) {
        if (snap.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snap.error != null) {
          print(snap.error);
          return Center(child: Icon(Icons.portable_wifi_off));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Image.asset("assets/img/ic_exos_logo.png", width: 250.0),
            ),
            Expanded(
                child: Center(
                    child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("NEXT LAUNCH IN:", style: TextStyle(fontSize: 18.0)),
                Padding(padding: EdgeInsets.all(10.0)),
                Counter(
                  until: DateTime.parse(snap.data.date),
                ),
              ],
            ))),
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 70.0, top: 16.0),
              child: RocketView(launch: snap.data),
            ),
          ],
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  final DateTime until;

  Counter({
    Key key,
    @required this.until,
  }) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  bool isRunning;

  @override
  void initState() {
    super.initState();
    isRunning = true;
    _run();
  }

  void _run() async {
    while (isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _calculateString(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 43.0),
    );
  }

  String _calculateString() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final diff = widget.until.millisecondsSinceEpoch - now;

    final day = diff ~/ 86400000;
    final hours = diff ~/ 3600000 % 24;
    final minutes = diff ~/ 60000 % 60;
    final seconds = diff ~/ 1000 % 60;

    return "${day}d ${hours}h ${minutes}m ${seconds}s";
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }
}
