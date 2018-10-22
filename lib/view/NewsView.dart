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

import 'package:escape_earth/model/News.dart';
import 'package:escape_earth/route/SingleNewsRoute.dart';
import 'package:flutter/material.dart';
import 'package:escape_earth/localdata.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: latestNews.length,
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        itemBuilder: (context, i) => NewsItem(news: latestNews[i]));
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
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: Colors.black),
                    Padding(padding: EdgeInsets.all(2.5)),
                    Text(_dateToCalendarString(news.date),
                        style: TextStyle(color: Colors.black)),
                  ]),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SingleNewsRoute(news: news))),
    );
  }

  String _dateToCalendarString(DateTime date) =>
      "${date.month}/${date.day}/${date.year}";
}
