import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../diary.dart';

class OpenDiary extends StatefulWidget {
  final Diary diary;

  OpenDiary(this.diary);

  @override
  State<OpenDiary> createState() => _OpenDiaryState(diary);
}

class _OpenDiaryState extends State<OpenDiary> {
  final Diary diary;
  final _diaryheight = displaySize.height/2.5;
  _OpenDiaryState(this.diary);

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
                  DateFormat('M月d日').format(
                    DateTime.parse(diary.date.toString())
                  ).toString(),
                  style: MyTextStyle().bigBold,
                ),
              ),
              Container(
                child:Column(
                  children: <Widget>[
                    //Image.file(diary.image),
                    Container(
                      height: _diaryheight,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            "${diary.text}",
                            style: MyTextStyle().normal,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}