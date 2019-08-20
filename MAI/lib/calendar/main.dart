// Format Verified 1
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants.dart';
import '../main.dart';
import 'constants.dart';
import 'new_plan.dart';
import 'schedule.dart';

Map<String, dynamic> plans = {};

final DatabaseReference pref = FirebaseDatabase.instance.reference().child(user.uid).child('schedule');

getSchedule() => pref.once().then((DataSnapshot snapshot) => snapshot.value == null ? {} : plans = snapshot.value);

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

  Widget _calendar() => TableCalendar( // カレンダー
    calendarController: _calendarController,
    locale: 'ja_JP',
    headerStyle:     _headerStyle,
    daysOfWeekStyle: _daysOfWeekStyle,
    calendarStyle:   _calendarStyle,
    onDaySelected: (date, events) => setState(() => _schedule = Schedule(date)),
  );

  Widget newPlanButton() => FloatingActionButton(
      backgroundColor: MyColors.theme,
      child: Icon(
        Icons.add,
        size: iconSize,
        color: Colors.white,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => NewPlan(_schedule.date),
        );
        print(plans);
      },
    );

  Widget build(BuildContext context) => Scaffold(
    backgroundColor: MyColors.background,
    floatingActionButton: newPlanButton(),
    body: Container(
      margin: EdgeInsets.all(margin / 2),
      child:ListView(
        children: <Widget>[
                _calendar(),
                _schedule,
        ],
      ),
    ),
  );
}