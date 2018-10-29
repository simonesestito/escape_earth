import 'package:flutter/material.dart';

typedef void SplashCallback();

class Splash extends StatefulWidget {
  final Duration duration;
  final Duration waitDuration;
  final SplashCallback callback;

  Splash({
    Key key,
    @required this.duration,
    @required this.waitDuration,
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
    controller..addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // Wait after the animation
        await Future.delayed(widget.waitDuration);
        widget.callback();
      }
    })..forward();
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
