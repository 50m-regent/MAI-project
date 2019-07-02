import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'new_diary/main.dart';

Widget newDiaryIcon(BuildContext context) {
  final Size _displaySize = MediaQuery.of(context).size;
  final double _iconSize = _displaySize.width / 12;
  return FloatingActionButton.extended(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NewDiaryPage();
        }
      );
    },
    label: Text(
      '新しい日記を作成',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
    icon: Icon(
      Icons.add,
      color: Colors.white,
      size: _iconSize,
    ),
    tooltip: "新しい日記",
    backgroundColor: ICON_COLOR,
  );
}