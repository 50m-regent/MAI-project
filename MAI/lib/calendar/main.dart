// Format Verified 1

import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import 'constants.dart';

// カレンダー
class CalendarPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final HeaderStyle _headerStyle = HeaderStyle( // ヘッダスタイル
      centerHeaderTitle: true,                    // 年月中央寄せ
      formatButtonVisible: false,                 // 書式変更ボタン非表示
      titleTextStyle: CalendarTextStyles.title,   // タイトルTextStyle
    );

    final DaysOfWeekStyle _daysOfWeekStyle = DaysOfWeekStyle( // 曜日スタイル
      weekdayStyle: CalendarTextStyles.weekdays,              // 平日
      weekendStyle: CalendarTextStyles.weekendDays,           // 週末
    );
    final CalendarStyle _calendarStyle = CalendarStyle(      // カレンダースタイル
      weekdayStyle:        CalendarTextStyles.days,          // 平日
      weekendStyle:        CalendarTextStyles.weekends,      // 週末
      outsideStyle:        CalendarTextStyles.otherDays,     // 前後月の平日
      outsideWeekendStyle: CalendarTextStyles.otherWeekends, // 前後月の週末
      todayStyle:          CalendarTextStyles.selectedDay,   // 今日
      selectedStyle:       CalendarTextStyles.selectedDay,   // 選択日
      todayColor:          CalendarColors.today,             // 今日の色
      selectedColor:       MyColors.theme,                   // 選択色
    );
    return Scaffold(
      backgroundColor: MyColors.background,
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
}