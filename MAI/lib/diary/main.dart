import 'package:flutter/material.dart';
import 'diary_list.dart';
import 'items.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: DiaryList(),
    floatingActionButton: NewDiaryIcon(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    backgroundColor: Colors.transparent,
  );
}