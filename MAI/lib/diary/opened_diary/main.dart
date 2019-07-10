import 'package:flutter/material.dart';
import 'package:mai/diary/items.dart';

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
        title: Text('日記')
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(diary.name),
          ],
        ),
      ),
    );
  }
}