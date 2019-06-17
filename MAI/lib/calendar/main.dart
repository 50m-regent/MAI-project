import 'package:flutter/material.dart';
import 'items.dart';

// カレンダー
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // アイコンの大きさ
    return Scaffold(
      body: Calendar(),
    );
  }
}