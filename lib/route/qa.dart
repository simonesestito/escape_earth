import 'package:escape_earth/localdata.dart';
import 'package:escape_earth/view/RocketHero.dart';
import 'package:flutter/material.dart';

class QaRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: faqQuestions.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return GestureDetector(
              child: RocketHero(),
              onTap: () => Navigator.of(context).pop(),
              onVerticalDragEnd: (_) => Navigator.of(context).pop(),
            );
          } else {
            final question = faqQuestions[i - 1];
            return ExpansionTile(
              title: Padding(
                child: Text(question.question, style: TextStyle(fontWeight: FontWeight.bold)),
                padding: EdgeInsets.symmetric(vertical: 30.0),
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(question.answer),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
