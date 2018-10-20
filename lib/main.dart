import 'package:flutter/material.dart';

void main() => runApp(App());

final _splashDuration = Duration(milliseconds: 800);

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Widget currentView;

  @override
    void initState() {
      super.initState();
      currentView = Splash(duration: _splashDuration);
    }

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: currentView,
      );
    }
}

class Splash extends StatefulWidget {
  final Duration duration;

  Splash({
    Key key,
    @required this.duration,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rocketAnimation;

  @override
    void initState() {
      super.initState();
      controller = AnimationController(vsync: this, duration: widget.duration);
      rocketAnimation = Tween(begin: 0.0, end: 300.0).animate(controller);
      controller.forward();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: controller,
          child: Text("Dovrei ruotare"),
        )
      ),
    );
  }
}
