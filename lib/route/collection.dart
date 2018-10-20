import 'package:escape_earth/model/RocketLaunch.dart';
import 'package:escape_earth/service/RocketService.dart';
import 'package:escape_earth/view/RocketView.dart';
import 'package:flutter/material.dart';

class CollectionRocketRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RocketService.getLaunches(),
      initialData: null,
      builder: (context, snap) {
        if (snap.data == null || snap.data.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snap.data.length,
          itemBuilder: (context, i) => RocketView(launch: snap.data[i]),
        );
      },
    );
  }
}
