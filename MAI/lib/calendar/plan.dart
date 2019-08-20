import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'constants.dart';

class Plan extends StatefulWidget {
  final String title;
  final DateTime start, end;

  Plan(this.title, this.start, this.end);

  Map<String, dynamic> toJson() => {
    'title': title,
    'start': DateFormat('HH:mm', 'ja_JP').format(start),
    'end':   DateFormat('HH:mm', 'ja_JP').format(end),
  };

  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  Widget _title() => Text(
    widget.title,
    style: CalendarTextStyles.days,
  );

  Widget _time() => Text(
    DateFormat('HH:mm', 'ja_JP').format(widget.start)
    + ' 〜 ' +
    DateFormat('HH:mm', 'ja_JP').format(widget.end),
    style: CalendarTextStyles.days,
  );

  Widget build(BuildContext context) => Container(
    height: 60,
    margin: EdgeInsets.only(bottom: margin / 2),
    padding: EdgeInsets.symmetric(horizontal: margin),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color: MyColors.theme,
        width: 3,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _title(),
        _time(),
      ],
    ),
  );
}