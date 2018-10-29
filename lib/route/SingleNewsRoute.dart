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
        title: Text(news.title)
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
