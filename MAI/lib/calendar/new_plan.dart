import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../constants.dart';
import 'main.dart';
import 'plan.dart';

DateTime start = DateTime.now(), end = DateTime.now().add(Duration(hours: 1));

class NewPlan extends StatefulWidget {
  final DateTime date;
  NewPlan(this.date);

  _NewPlanState createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  final TextEditingController _titleController = TextEditingController(text: 'タイトル');

  String title = 'タイトル';

  Widget _push(BuildContext context) => FlatButton( // 投稿ボタン
    onPressed: () {
      final Plan _plan = Plan(title, start, end);
      if(plans[DateFormat('MMdd', 'ja_JP').format(widget.date)] == null) plans[DateFormat('MMdd').format(widget.date)] = {};
      plans[DateFormat('MMdd').format(widget.date)][title] = _plan;
      pref.child(DateFormat('MMdd').format(widget.date)).child(title).update(_plan.toJson());
      Navigator.pop(context);
    },
    child: Text(
      '投稿',
      style: MyTextStyle(color: MyColors.theme).mini,
    )
  );

  Widget build(BuildContext context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: Text(
      DateFormat('MM月dd日(E)', "ja_JP").format(widget.date),
      style: MyTextStyle().bigBold,
    ),
    content: Container(
      width: displaySize.width,
      height: displaySize.height / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            controller: _titleController,
            onEditingComplete: () => title = _titleController.text,
            style: MyTextStyle().normalBold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Start(),
              Text(' ~ ', style: MyTextStyle().normalBold),
              End(),
            ],
          ),
        ],
      ),
    ),
    actions: <Widget>[
      _push(context),
    ],
  );
}

class Start extends StatefulWidget {
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  Widget build(BuildContext context) => FlatButton(
      onPressed: () {
        DatePicker.showTimePicker(
          context,
          locale: LocaleType.jp,
          onChanged: (time) => setState(() => start = time),
          currentTime: DateTime.now(),
          theme: DatePickerTheme(
            cancelStyle: MyTextStyle(color: Colors.red).normal,
            doneStyle:   MyTextStyle(color: MyColors.theme).normal,
            itemStyle:   MyTextStyle().normalBold,
            backgroundColor: MyColors.background,
            containerHeight: 150,
          ),
        );
      },
      child: Text(
        DateFormat('HH:mm').format(start),
        style: MyTextStyle().normalBold,
      ),
    );
}

class End extends StatefulWidget {
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  Widget build(BuildContext context) => FlatButton(
      onPressed: () {
        DatePicker.showTimePicker(
          context,
          showTitleActions: false,
          locale: LocaleType.jp,
          onChanged: (time) => setState(() => end = time),
          currentTime: DateTime.now(),
          theme: DatePickerTheme(
            cancelStyle: MyTextStyle(color: Colors.red).normal,
            doneStyle:   MyTextStyle(color: MyColors.theme).normal,
            itemStyle:   MyTextStyle().normalBold,
            backgroundColor: MyColors.background,
            containerHeight: 150,
          ),
        );
      },
      child: Text(
        DateFormat('HH:mm').format(end),
        style: MyTextStyle().normalBold,
      ),
    );
}