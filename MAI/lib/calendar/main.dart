import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'constants.dart';
import '../constants.dart';

// カレンダー
class CalendarPage extends StatelessWidget {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      margin: EdgeInsets.only(
        right: margin / 2,
        left: margin / 2,
        top: margin / 2
      ),
      child: TableCalendar(
        calendarController: _calendarController,
        locale: 'ja_JP',
        availableCalendarFormats: {
          CalendarFormat.month: '1ヶ月',
          CalendarFormat.twoWeeks: '2週間',
          CalendarFormat.week: '1週間',
        },
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
          titleTextStyle: MyTextStyle().bigBold,
          formatButtonTextStyle: MyTextStyle().miniBold,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: MyTextStyle(color: Colors.red).miniBold,
          weekdayStyle: MyTextStyle(color: MyColors.icon).miniBold,
        ),
        calendarStyle: CalendarStyle(
          weekendStyle: MyTextStyle(color: Colors.red).normalBold,
          weekdayStyle: MyTextStyle().normalBold,
          outsideWeekendStyle: MyTextStyle(color: Colors.red).mini,
          outsideStyle: MyTextStyle(color: MyColors.icon).mini,
          todayStyle: MyTextStyle(color: Colors.white).normalBold,
          selectedStyle: MyTextStyle(color: Colors.white).normalBold,
          todayColor: selectedColor,
          selectedColor: MyColors.theme,
        ),
      ),
    ),
  );
}