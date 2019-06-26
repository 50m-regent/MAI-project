import 'package:flutter/material.dart';
import 'items.dart';

Widget _body() {
  return Column(
    children: <Widget>[
      Calendar(),
      Schedule(),
    ],
  );
}

// カレンダー
class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}