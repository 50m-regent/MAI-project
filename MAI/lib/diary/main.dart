import 'package:flutter/material.dart';
import 'items.dart';

// 日記
class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() {
    return _DiaryPageState();
  }
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    // アイコンの大きさ
    return Scaffold(
      floatingActionButton: newDiaryIcon(context),
    );
  }
}