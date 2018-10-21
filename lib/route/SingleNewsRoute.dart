import 'package:escape_earth/model/News.dart';
import 'package:flutter/material.dart';

class SingleNewsRoute extends StatelessWidget {
  final News news;

  SingleNewsRoute({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ListView(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 250.0,
            ),
            child: Hero(
              child: Image.network(news.imageUrl, fit: BoxFit.fitWidth),
              tag: news.imageUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(news.text),
          ),
        ],
      ),
    );
  }
}
