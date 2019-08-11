import 'package:flutter/material.dart';
import '../constants.dart';

class AddFriendIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: () {
      /* //TODO: フレンド追加
      showDialog(
        context: context,
        builder: (BuildContext context) => NewDiaryPage(),
      );
      */
    },
    child: Icon(
      Icons.add,
      color: Colors.white,
      size: iconSize,
    ),
    tooltip: "フレンド追加",
  );
}