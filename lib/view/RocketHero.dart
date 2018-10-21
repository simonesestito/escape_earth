import 'package:flutter/material.dart';

class RocketHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Image.asset("assets/img/home_rocket.png", height: 72.0),
      tag: "home_rocket",
    );
  }
}
