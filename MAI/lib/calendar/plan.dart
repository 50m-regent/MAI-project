import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'constants.dart';
import 'main.dart';

class Plan extends StatefulWidget {
  final String title;
  final DateTime start, end;

  Plan(this.title, this.start, this.end);

  Map<String, dynamic> toJson() => {
    'start': start.toString(),
    'end':   end.toString(),
  };

  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  Widget _title() => Text(
    widget.title,
    style: CalendarTextStyles.days,
  );

  Widget _time() => Text(
    DateFormat('HH:mm').format(widget.start)
    + ' 〜 ' +
    DateFormat('HH:mm').format(widget.end),
    style: CalendarTextStyles.days,
  );

  Widget _deleteIcon() => IconButton(
    icon: Icon(
      Icons.remove,
      color: MyColors.icon,
      size: iconSize,
    ),
    onPressed: () => setState(() {
      plans[DateFormat('MMdd').format(widget.start)].remove(widget.title);
      pref.child(DateFormat('MMdd').format(widget.start)).child(widget.title).remove();
    }),
  );

  Widget build(BuildContext context) => Container(
    height: 60,
    margin: EdgeInsets.only(bottom: margin / 2),
    padding: EdgeInsets.only(left: margin),
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
        _deleteIcon(),
      ],
    ),
  );
}