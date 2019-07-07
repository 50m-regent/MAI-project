import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'items.dart';

// 日記
class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アイコンの大きさ
    return Scaffold(
      backgroundColor: MyColors.background,
      floatingActionButton: newDiaryIcon(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: diaryList(),
    );
  }
}