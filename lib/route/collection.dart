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
