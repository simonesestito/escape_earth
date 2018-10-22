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
        color: Theme.of(context).backgroundColor,
      ),
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
          child: Container(
            height: i == 1 ? double.infinity : 40.0,
            child: buttons[i],
          ),
          onTap: () => this.clickListener(i),
        ),
      ));
    }
    return result;
  }
}
