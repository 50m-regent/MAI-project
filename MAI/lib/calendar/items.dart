import 'package:flutter/material.dart';
import 'calendar.dart';
import 'schedule.dart';

Widget body() {
  return Container(
    color: Colors.transparent,
    child: Column(
    children: <Widget>[
      Calendar(),
      Schedule(),
    ],
  ));
}