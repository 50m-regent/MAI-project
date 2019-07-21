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
      '新しい日記を作�