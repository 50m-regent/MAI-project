import 'package:flutter/material.dart';
import '../constants.dart';
import 'diary_list.dart';
import 'items.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: DiaryList(),
    floatingActionButton: Column(
      children: <Widget>[
        Container(height: margin, width: 0),
        NewDiaryIcon(),
      ],
    ),
  );
}