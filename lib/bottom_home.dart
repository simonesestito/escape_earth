import 'package:flutter/material.dart';

typedef void BottomHomeListener(int);

const BOTTOM_BAR_HEIGHT = 64.0;

class BottomHome extends StatelessWidget {
  final List<Widget> buttons;
  final BottomHomeListener clickListener;

  BottomHome({
    Key key,
    @required this.buttons,
    this.clickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BOTTOM_BAR_HEIGHT,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(
        color: Colors.black12,
        width: 1.0,
      )),
      child: Row(
        children: getNavButtons(),
      ),
    );
  }

  List<Widget> getNavButtons() {
    final result = <Widget>[];
    for (int i = 0; i < buttons.length; i++) {
      result.add(Expanded(
        child: GestureDetector(
          child: buttons[i],
          onTap: () => this.clickListener(i),
        ),
      ));
    }
    return result;
  }
}
