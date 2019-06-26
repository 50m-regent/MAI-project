import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'new_diary/main.dart';

Widget newDiaryIcon(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _iconSize = _displaySize.width / 12;
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NewDiaryPage();
          }
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: _iconSize,
      ),
      tooltip: "新しい日記",
      backgroundColor: ICON_COLOR,
    );
  }