import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Icon(Icons.signal_wifi_off, size: 50.0),
        Padding(padding: EdgeInsets.all(20.0)),
        Text(
          "You're offline.",
          style: TextStyle(fontSize: 21.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
