import 'package:escape_earth/service/RocketService.dart';
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
                if (snap.data == null || snap.data.length == 0) {
                  return Center(
                    child: CircularProgressIndicator(),
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
