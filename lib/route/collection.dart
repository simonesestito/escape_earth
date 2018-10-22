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

import 'package:escape_earth/route/launches_result.dart';
import 'package:escape_earth/service/RocketService.dart';
import 'package:escape_earth/view/RocketView.dart';
import 'package:escape_earth/view/RoundSearch.dart';
import 'package:flutter/material.dart';

class CollectionRocketRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder(
          future: RocketService.getLaunches(),
          initialData: null,
          builder: (context, snap) {
            if (snap.data == null || snap.data.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snap.error != null) {
              print(snap.error);
              return Center(child: Icon(Icons.portable_wifi_off));
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 90.0, right: 16.0, left: 16.0),
              itemCount: snap.data.length,
              itemBuilder: (context, i) => RocketView(launch: snap.data[i]),
            );
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: RoundSearch(onSearch: (query) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LaunchesResultRoute(query: query)));
          }),
        ),
      ],
    );
  }
}
