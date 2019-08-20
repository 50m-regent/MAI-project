import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'main.dart';

class Schedule extends StatefulWidget {
  final DateTime date;
  
  Schedule(this.date);

  final _ScheduleState state = _ScheduleState();

  _ScheduleState createState() => state;
}

class _ScheduleState extends State<Schedule> {
  Widget _body() => Container(
    margin: EdgeInsets.symmetric(horizontal: margin / 2),
    child: ListView.builder(
      itemCount: plans[DateFormat('MMdd', 'ja_JP').format(widget.date)].length,
      itemBuilder: (context, index) => plans[DateFormat('MMdd', 'ja_JP').format(widget.date)][index],
    ),
  );

  Widget build(BuildContext context) => Expanded(
    child: plans[DateFormat('MMdd', 'ja_JP').format(widget.date)] != null ? _body() : Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'この日に予定は',
              style: MyTextStyle(color: MyColors.icon).bigBold,
            ),
            Text(
              'ありません',
              style: MyTextStyle(color: MyColors.icon).bigBold,
            ),
          ],
        ),
      ),
    ),
  );
}