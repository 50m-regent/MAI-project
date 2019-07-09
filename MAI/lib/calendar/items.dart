import 'package:flutter/material.dart';
import 'calendar.dart';
import 'schedule.dart';

Widget body() {
  return Column(
    children: <Widget>[
      Calendar(),
      Schedule(),
    ],
  );
}