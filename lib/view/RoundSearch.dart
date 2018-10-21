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
