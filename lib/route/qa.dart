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
