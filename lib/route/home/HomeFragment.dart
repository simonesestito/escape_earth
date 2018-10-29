import 'package:escape_earth/service/RocketService.dart';
import 'package:escape_earth/view/OfflineView.dart';
import 'package:escape_earth/view/RocketWidget.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RocketService.getNextLaunch(),
      builder: (context, snap) {
        if (snap.error != null) {
          debugPrint(snap.error.toString());
          return OfflineView();
        }

        if (snap.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/img/ic_exos_logo.png",
                      width: 250.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.info_outline, size: 32.0)),
                      onTap: () => Navigator.of(context).pushNamed("/about"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Center(
                    child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("NEXT LAUNCH IN:", style: TextStyle(fontSize: 22.0)),
                Padding(padding: EdgeInsets.all(10.0)),
                Counter(
                  until: DateTime.parse(snap.data.date),
                ),
              ],
            ))),
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 70.0, top: 16.0),
              child: RocketWidget(launch: snap.data),
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

    if (diff < 0) {
      // Stop countdown
      isRunning = false;
      return "Launched!";
    }

    final days = diff ~/ 86400000;
    final hours = diff ~/ 3600000 % 24;
    final minutes = diff ~/ 60000 % 60;
    final seconds = diff ~/ 1000 % 60;

    final countdownParts = [
      "${days}d",
      "${hours}h",
      "${minutes}m",
      "${seconds}s"
    ];

    int parts;
    if (days > 0)
      parts = 0;
    else if (hours > 0)
      parts = 1;
    else if (minutes > 0)
      parts = 2;
    else
      parts = 3;

    return countdownParts.sublist(parts).join(" ");
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }
}
