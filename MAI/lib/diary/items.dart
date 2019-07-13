import 'package:flutter/material.dart';
import '../constants.dart';
import 'new_diary/main.dart';

class NewDiaryIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton.extended(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => NewDiaryPage(),
      );
    },
    label: Text(
      '新しい日記を作成',
      style: MyTextStyle(color: Colors.white).normalBold(),
    ),
    icon: Icon(
      Icons.add,
      color: Colors.white,
      size: iconSize,
    ),
    tooltip: "新しい日記",
    backgroundColor: MyColors.icon,
  );
}