import 'package:flutter/material.dart';
import 'items.dart';

// カレンダー
class CalendarPage extends StatefulWidget {
  @override//継承の役割らしい
  _CalendarPageState createState() {
    return _CalendarPageState();
  }
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    // アイコンの大きさ
    return Scaffold(
      body: calendar(context),
    );
  }
}