/*
 * Copyright © 2018 Simone Sestito, Patrizio Renelli, Gianluca Conti
 * 
 * This file is part of Escape Earth.
 * 
 * Escape Earth is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Escape Earth is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Escape Earth.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:escape_earth/route/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

final _splashDuration = Duration(milliseconds: 1400);

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Widget currentView;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Color.fromARGB(0xFF, 0x09, 0x10, 0x2a),
        systemNavigationBarColor: Color.fromARGB(0xFF, 0x13, 0x1C, 0x31),
      ),
    );

    currentView = Splash(
      duration: _splashDuration,
      callback: () {
        setState(() {
          currentView = Home();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color.fromARGB(0xFF, 0x13, 0x1C, 0x31),
        scaffoldBackgroundColor: Color.fromARGB(0xFF, 0x09, 0x10, 0x2a),
      ),
      title: "Escape Earth",
      home: currentView,
    );
  }
}

typedef void SplashCallback();

class Splash extends StatefulWidget {
  final Duration duration;
  final SplashCallback callback;

  Splash({
    Key key,
    @required this.duration,
    @required this.callback,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<int> rocketAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticIn);
    rocketAnimation = IntTween(begin: 0, end: 360).animate(curve);
    controller.forward();
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // Wait after the animation
        await Future.delayed(Duration(milliseconds: 600));
        widget.callback();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
          child: Container(
        width: 250.0,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/img/splash_fixed.png")),
            RotationTransition(
              turns: controller,
              child: Image(image: AssetImage("assets/img/splash_rotating.png")),
            ),
          ],
        ),
      )),
    );
  }
}
