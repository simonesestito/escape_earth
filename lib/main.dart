import 'package:flutter/material.dart';

void main() => runApp(App());

final _splashDuration = Duration(milliseconds: 1500);

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
      title: "Escape Earth",
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
  Animation<int> rocketAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticIn);
    rocketAnimation = IntTween(begin: 0, end: 360).animate(curve);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
