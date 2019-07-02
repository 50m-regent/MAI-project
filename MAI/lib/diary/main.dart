import 'package:flutter/material.dart';
import 'items.dart';

// 日記
class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アイコンの大きさ
    return Scaffold(
      floatingActionButton: newDiaryIcon(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: diaryList(),
    );
  }
}