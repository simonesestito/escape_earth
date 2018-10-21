import 'package:escape_earth/model/News.dart';
import 'package:escape_earth/route/SingleNewsRoute.dart';
import 'package:flutter/material.dart';
import 'package:escape_earth/localdata.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: latestNews.length,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          itemBuilder: (context, i) => NewsItem(news: latestNews[i])),
    );
  }
}

class NewsItem extends StatelessWidget {
  final News news;

  NewsItem({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Color.fromARGB(0xe5, 0xff, 0xff, 0xff),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                      tag: news.imageUrl,
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.overlay),
                          image: NetworkImage(news.imageUrl),
                        )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    news.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(11.0),
              child: Text(news.preview, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SingleNewsRoute(news: news))),
    );
  }
}
