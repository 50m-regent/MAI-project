import 'package:flutter/material.dart';
import '../constants.dart';
import 'opened_diary/main.dart';

class Diary extends StatefulWidget {
  final date, image, name, text;
  Diary({this.date, this.image, this.text, this.name});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final _readColor = Colors.pinkAccent;
  bool _read = false;

  Widget _name() => Text(
    widget.name,
    style: MyTextStyle().normalBold,
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(right: margin),
    width: 200,
    decoration: BoxDecoration(
      border: Border.all(
        color: _read ? _readColor : MyColors.theme,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: FlatButton(
      onPressed: () => setState(() {
        _read = true;
        showDialog(
          context: context,
          builder: (BuildContext context) => OpenDiary(this.widget),
        );
      }),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: _name(),
        ),
      ),
    ),
  );
}