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

import 'package:escape_earth/route/AboutRoute.dart';
import 'package:escape_earth/route/FaqRoute.dart';
import 'package:escape_earth/route/HomeRoute.dart';
import 'package:escape_earth/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _splashDuration = Duration(milliseconds: 1500);
const _splashWait = Duration(milliseconds: 300);

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Color.fromARGB(0xFF, 0x09, 0x10, 0x2a),
        systemNavigationBarColor: Color.fromARGB(0xFF, 0x13, 0x1C, 0x31),
      ),
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color.fromARGB(0xFF, 0x13, 0x1C, 0x31),
        scaffoldBackgroundColor: Color.fromARGB(0xFF, 0x09, 0x10, 0x2a),
        primaryColor: Color.fromARGB(0xFF, 0x13, 0x1C, 0x31),
      ),
      title: "Escape Earth",
      home: _AppBody(),
      routes: <String, WidgetBuilder>{
        "/faq": (_) => FaqRoute(),
        "/home": (_) => HomeRoute(),
        "/about": (_) => AboutRoute(),
      },
    );
  }
}

class _AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash(
      duration: _splashDuration,
      waitDuration: _splashWait,
      callback: () => Navigator.of(context).pushReplacementNamed("/home"),
    );
  }
}
