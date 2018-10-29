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

import 'package:escape_earth/route/home/HomeFragment.dart';
import 'package:escape_earth/view/BottomHome.dart';
import 'package:escape_earth/route/home/LaunchesResultFragment.dart';
import 'package:escape_earth/route/home/NewsFragment.dart';
import 'package:escape_earth/view/RocketHero.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  @override
  HomeRouteState createState() => HomeRouteState();
}

class HomeRouteState extends State<HomeRoute> {
  Widget currentFragment;

  @override
  void initState() {
    super.initState();
    currentFragment = HomeFragment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: BOTTOM_BAR_HEIGHT),
            child: SafeArea(child: currentFragment),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomHome(
              buttons: <Widget>[
                Image.asset("assets/img/ic_home_news.png", color: Colors.white),
                GestureDetector(
                    child: RocketHero(),
                    onVerticalDragEnd: (_) =>
                        Navigator.of(context).pushNamed("/faq")),
                Image.asset("assets/img/home_collection.png",
                    color: Colors.white),
              ],
              clickListener: (index) {
                switch (index) {
                  case 0:
                    setState(() {
                      currentFragment = NewsFragment();
                    });
                    break;
                  case 1:
                    if (currentFragment is HomeFragment) {
                      Navigator.of(context).pushNamed("/faq");
                    } else {
                      setState(() {
                        currentFragment = HomeFragment();
                      });
                    }
                    break;
                  case 2:
                    setState(() {
                      currentFragment = CollectionRocketFragment();
                    });
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
