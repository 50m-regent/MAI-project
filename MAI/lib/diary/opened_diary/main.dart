import 'package:flutter/material.dart';
import '../diary.dart';

class OpenedDiary extends StatefulWidget {
  final Diary diary;

  OpenedDiary(this.diary);

  @override
  State<OpenedDiary> createState() => _OpenedDiaryState(diary);
}

class _OpenedDiaryState extends State<OpenedDiary> {
  final Diary diary;

  _OpenedDiaryState(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('tt'),
      ),
    );
  }
}