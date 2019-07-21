import 'package:flutter/material.dart';
import 'package:mai/constants.dart';

final TextStyle otherDaysTextStyle = MyTextStyle(color: Colors.grey).miniBold();
final TextStyle daysTextStyle = MyTextStyle().normal();
final TextStyle selectedDayTextStyle = MyTextStyle(color: Colors.white).normalBold();
final TextStyle weekendTextStyle = MyTextStyle(color: Colors.redAccent).normalBold();
final Color todayBorderColor = Colors.redAccent;
final Color selectedDayButtonColor = MaterialColor(
  0xFF4FC3F7, // Colors.lightBlue[300];
  <int, Color>{}
);