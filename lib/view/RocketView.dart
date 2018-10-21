import 'package:escape_earth/model/RocketLaunch.dart';
import 'package:flutter/material.dart';

class RocketView extends StatelessWidget {
  final RocketLaunch launch;

  RocketView({
    Key key,
    @required this.launch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchIconHeight = 28.0;
    final launchTextSize = 17.0;

    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        ),
      ),
      child: Card(
        color: Color.fromARGB(0xe5, 0xff, 0xff, 0xff),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  launch.name,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(children: <Widget>[
                Icon(Icons.flag, color: Colors.black, size: launchIconHeight),
                Text(launch.launchCompany.countryCode,
                    style: TextStyle(
                        color: Colors.black, fontSize: launchTextSize)),
              ]),
              Row(children: <Widget>[
                Image.asset("assets/img/ic_rocket_launch.png",
                    width: launchIconHeight),
                Flexible(
                  child: Text(
                    launch.launchCompany.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontSize: launchTextSize),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Icon(
                  Icons.alarm,
                  color: Colors.black,
                  size: launchIconHeight,
                ),
                Text(launch.date,
                    style: TextStyle(
                        color: Colors.black, fontSize: launchTextSize)),
              ]),
              launch.videoUrl == null
                  ? Container()
                  : GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.open_in_browser, color: Colors.black),
                          Text("Show video"),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      onTap: () {/* TODO */},
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
