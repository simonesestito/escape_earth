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

typedef void SearchListener(string);

class RoundSearch extends StatelessWidget {
  final SearchListener onSearch;

  RoundSearch({
    Key key,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Material(
          elevation: 16.0,
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.grey,
              keyboardType: TextInputType.text,
              maxLines: 1,
              onSubmitted: onSearch,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search a launch...",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
