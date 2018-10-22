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

import 'package:escape_earth/service/RocketService.dart';
import 'package:escape_earth/view/OfflineView.dart';
import 'package:escape_earth/view/RocketView.dart';
import 'package:flutter/material.dart';

class LaunchesResultRoute extends StatelessWidget {
  final String query;

  LaunchesResultRoute({
    Key key,
    this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: RocketService.getLaunches(query: query),
              initialData: null,
              builder: (context, snap) {
                if (snap.error != null) {
                  debugPrint(snap.error.toString());
                  return OfflineView();
                }

                if (snap.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snap.data.length == 0) {
                  return Center(
                    child: Text("No results :("),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(top: 48.0),
                  itemCount: snap.data.length,
                  itemBuilder: (context, i) => RocketView(launch: snap.data[i]),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back,
                        color: Colors.white, size: 32.0)),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
