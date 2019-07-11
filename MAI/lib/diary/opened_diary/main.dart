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
  final _diaryheight = DISPLAY_SIZE.height/2.5;
  _OpenDiaryState(this.diary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text(
          diary.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(MARGIN),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text("${diary.date}",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
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
                            style: TextStyle(
                              fontSize: 25,
                            ),
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