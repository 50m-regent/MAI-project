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
  Widget _body() {
    List<String> _titles = [];

    plans[DateFormat('MMdd').format(widget.date)].forEach((dynamic _title, dynamic _j) {_titles.add(_title);});

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin / 2),
      child: ListView.builder(
        itemCount: _titles.length,
        itemBuilder: (context, index) => plans[DateFormat('MMdd').format(widget.date)][_titles[index]],
      ),
    );
  }

  Widget build(BuildContext context) => Expanded(
    child: plans[DateFormat('MMdd').format(widget.date)] != null ? _body() : Container(
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