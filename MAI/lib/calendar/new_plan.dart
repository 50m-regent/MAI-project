import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'main.dart';
import 'plan.dart';

class NewPlan extends StatefulWidget {
  final DateTime date;
  NewPlan(this.date);

  _NewPlanState createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  final TextEditingController _titleController = TextEditingController(text: 'タイトル');

  String title;
  DateTime start = DateTime.now(), end = DateTime.now().add(Duration(hours: 1));

  Widget _push(BuildContext context) => FlatButton( // 投稿ボタン
    onPressed: () {
      final Plan _plan = Plan(title, start, end);
      if(plans[DateFormat('MMdd', 'ja_JP').format(widget.date)] == null) plans[DateFormat('MMdd').format(widget.date)] = [];
      plans[DateFormat('MMdd').format(widget.date)].add(_plan);
      pref.child(DateFormat('MMdd').format(widget.date)).push().set(_plan.toJson());
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
      height: displaySize.height / 2,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
            onEditingComplete: () => title = _titleController.text,
          ),
        ],
      ),
    ),
    actions: <Widget>[
      _push(context),
    ],
  );
}