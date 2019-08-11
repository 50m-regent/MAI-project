// Format Verified 1

import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

import 'constants.dart';
import '../constants.dart';

// カレンダー
class CalendarPage extends StatelessWidget {
  final HeaderStyle _headerStyle = HeaderStyle( // ヘッダスタイル
    centerHeaderTitle: true,                    // 年月中央寄せ
    formatButtonVisible: false,                 // 書式変更ボタン非表示
    titleTextStyle: CalendarTextStyle.title,    // タイトルTextStyle
  );

  final DaysOfWeekStyle _daysOfWeekStyle = DaysOfWeekStyle( // 曜日スタイル
    weekdayStyle: CalendarTextStyle.weekdays,               // 平日
    weekendStyle: CalendarTextStyle.weekendDays,            // 週末
  );

  final CalendarStyle _calendarStyle = CalendarStyle(     // カレンダースタイル
    weekdayStyle:        CalendarTextStyle.weekdays,      // 平日
    weekendStyle:        CalendarTextStyle.weekends,      // 週末
    outsideStyle:        CalendarTextStyle.otherDays,     // 前後月の平日
    outsideWeekendStyle: CalendarTextStyle.otherWeekends, // 前後月の週末
    todayStyle:          CalendarTextStyle.selectedDay,   // 今日
    selectedStyle:       CalendarTextStyle.selectedDay,   // 選択日
    todayColor:          todayColor,                      // 今日の色
    selectedColor:       MyColors.theme,                  // 選択日色
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      margin: EdgeInsets.only(
        right: margin / 2,
        left:  margin / 2,
        top:   margin / 2,
      ),
      child: TableCalendar( // カレンダー
        calendarController: CalendarController(),
        locale: 'ja_JP',
        headerStyle:     _headerStyle,
        daysOfWeekStyle: _daysOfWeekStyle,
        calendarStyle:   _calendarStyle,
      ),
    ),
  );
}