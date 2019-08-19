// Format Verified 1
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants.dart';
import 'constants.dart';
import 'plan.dart';
import 'schedule.dart';

Map<String, List<Plan>> plans = {};

// カレンダー
class CalendarPage extends StatefulWidget {
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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

  final CalendarController _calendarController = CalendarController();

  Schedule _schedule = Schedule(DateTime.now());

  TableCalendar _calendar() => TableCalendar( // カレンダー
    calendarController: _calendarController,
    locale: 'ja_JP',
    headerStyle:     _headerStyle,
    daysOfWeekStyle: _daysOfWeekStyle,
    calendarStyle:   _calendarStyle,
    onDaySelected: (date, events) => setState(() => _schedule = Schedule(date)),
  );

  Widget newPlanButton() {
    final DatabaseReference _pref = FirebaseDatabase.instance.reference().child('schedule');
    return FloatingActionButton(
      backgroundColor: MyColors.theme,
      child: Icon(
        Icons.add,
        size: iconSize,
        color: Colors.white,
      ),
      onPressed: () => setState(() {
        final Plan _plan = Plan('test', DateTime.now(), DateTime.now().add(Duration(hours: 1)));
        if(plans[DateFormat('MMdd', 'ja_JP').format(_schedule.date)] == null) {
          plans[DateFormat('MMdd', 'ja_JP').format(_schedule.date)] = [];
        }
        plans[DateFormat('MMdd', 'ja_JP').format(_schedule.date)].add(_plan);
        _pref.child(DateFormat('MMdd', 'ja_JP').format(_schedule.date)).push().set(_plan.toJson());
      }),
    );
  }

  Widget build(BuildContext context) => Scaffold(
      backgroundColor: MyColors.background,
      floatingActionButton: newPlanButton(),
      body: Container(
        margin: EdgeInsets.all(margin / 2),
        child: Column(
          children: <Widget>[
            _calendar(),
            _schedule,
          ],
        ),
      ),
    );
}