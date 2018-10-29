import 'package:flutter/material.dart';

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Text("""
The app has many different sections:

- FAQ about launches (scroll the rocket up)
- News from official NASA site
- Next launches
- Search launches by name
- Countdown until the next launch

This app has been made in 2 days!
This is the result of a challenge happened 20-21 October 2018, in the Italian city of Rome.

It's also open source: if you're a developer you can fork this app and adapt to your needs, respecting the terms of the GPLv3 License.
""", style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
