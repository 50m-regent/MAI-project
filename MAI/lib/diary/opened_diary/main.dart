// Format Verified 1

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../diary.dart';

class OpenDiary extends StatefulWidget {
  final Diary diary;

  OpenDiary(this.diary);

  State<OpenDiary> createState() => _OpenDiaryState();
}

class _OpenDiaryState extends State<OpenDiary> {
  _title() => Text(
    DateFormat('M/d').format(
      DateTime.parse('2019' + widget.diary.date)
    ).toString() + ' ' + widget.diary.name,
  );

  _diary() => Container(
    width: displaySize.width,
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: margin,
          ),
          width: displaySize.width,
          height: displaySize.width / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.diary.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          widget.diary.text,
          style: MyTextStyle().mini,
        ),
      ],
    ),
  );

  Widget build(BuildContext context) => AlertDialog(
    title: _title(),
    titleTextStyle: MyTextStyle().normalBold,
    content: _diary(),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          '閉じる',
          style: MyTextStyle(color: MyColors.theme).mini,
        ),
      ),
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}