import 'package:escape_earth/bottom_home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: BOTTOM_BAR_HEIGHT),
            child: HomeBody(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomHome(
              buttons: <Widget>[
                Icon(Icons.add_alert), // TODO: change icon
                Image(image: AssetImage("assets/img/home_rocket_icon.png")),
                Icon(Icons.folder), // TODO: change icon
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
  * TODO: ADD BODY
  */
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 500,
      itemBuilder: (context, i) {
        return Text(i.toString());
      },
    );
  }
}
