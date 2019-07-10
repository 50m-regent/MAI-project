import 'package:flutter/material.dart';
import 'package:mai/diary/items.dart';
import 'package:mai/constants.dart';

class OpenDiary extends StatefulWidget {
  final Diary diary;

  OpenDiary(this.diary);

  @override
  State<OpenDiary> createState() => _OpenDiaryState(diary);
}

class _OpenDiaryState extends State<OpenDiary> {
  final Diary diary;

  _OpenDiaryState(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diary.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        backgroundColor: MyColors.box,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("${diary.date}",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image()
            ],
        ),
      ),
      ),
    );
  }
}