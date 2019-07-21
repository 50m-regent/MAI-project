import 'package:flutter/material.dart';
import '../diary.dart';
import 'package:intl/intl.dart';
import 'package:mai/constants.dart';

class OpenedDiary extends StatefulWidget {
  final Diary diary;

  OpenedDiary(this.diary);

  @override
  State<OpenedDiary> createState() => _OpenedDiaryState(diary);
}

class _OpenedDiaryState extends State<OpenedDiary> {
  final Diary diary;
  final _diaryheight = displaySize.height / 2.5;

  _OpenedDiaryState(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.box,
        title: Text(
          diary.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                DateFormat('Mæœ