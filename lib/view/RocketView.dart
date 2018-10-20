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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(launch.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(launch.launchCompany.toString()),
              Text(launch.date),
            ],
          ),
        ),
      ),
    );
  }
}
