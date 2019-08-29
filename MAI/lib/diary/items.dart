import 'package:flutter/material.dart';
import '../constants.dart';
import 'new_diary/main.dart';

class NewDiaryIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
    backgroundColor: MyColors.theme,
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => NewDiaryPage(),
      );
    },
    child: Icon(
      Icons.add,
      color: Colors.white,
      size: iconSize,
    ),
    tooltip: "新しい日記",
  );
}