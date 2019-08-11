// Format Verified 1

import 'package:flutter/material.dart';

import '../constants.dart';

class CalendarTextStyles { // カレンダーのTextStyle
  static TextStyle get title         => MyTextStyle().bigBold;                           // 年月
  static TextStyle get weekdays      => MyTextStyle(color: MyColors.icon).miniBold;      // 平日の曜日
  static TextStyle get weekendDays   => MyTextStyle(color: Colors.red).miniBold;         // 週末の曜日
  static TextStyle get days          => MyTextStyle().normalBold;                        // 普通の日付
  static TextStyle get otherDays     => MyTextStyle(color: Colors.grey).miniBold;        // 前後月の日付
  static TextStyle get otherWeekends => MyTextStyle(color: Colors.red).miniBold;         // 前後月の週末
  static TextStyle get selectedDay   => MyTextStyle(color: Colors.white).normalBold;     // 選択日
  static TextStyle get weekends      => MyTextStyle(color: Colors.redAccent).normalBold; // 週末
}

class CalendarColors { // カレンダーで使う色
 static Color get today => Colors.blue; // 今日の色
}