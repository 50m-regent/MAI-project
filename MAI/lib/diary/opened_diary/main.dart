import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../diary.dart';

class OpenDiary extends StatefulWidget {
  final Diary diary;

  OpenDiary(this.diary);

  @override
  State<OpenDiary> createState() => _OpenDiaryState();
}

class _OpenDiaryState extends State<OpenDiary> {
  _title() => Text(
    DateFormat('M/d').format(
      DateTime.parse(widget.diary.date.toString())
    ).toString() + ' ' + widget.diary.name,
  );

  _diary() => Column(
    children: <Widget>[
      //Image.file(diary.image),
      Text(
        widget.diary.text,
        style: MyTextStyle().mini,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _title(),
      titleTextStyle: MyTextStyle().normalBold,
      content: _diary(),
      actions: <Widget>[
        FlatButton(
          child: Text('閉じる'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}