import 'package:flutter/material.dart';
import '../constants.dart';
import 'opened_diary/main.dart';

class Diary extends StatelessWidget {
  final date, image, name, text;
  Diary({
    this.date,
    this.image,
    this.text,
    this.name,
  });

  Widget _name() => Text(
    name,
    style: MyTextStyle().normalBold,
  );

  Widget _prefix() {
    String _prefix = '';
    for (int i = 0; i < 10; i++){
      _prefix += text[i];
    }
    _prefix += '...';
    return Text(
      _prefix,
      style: MyTextStyle().mini,
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(right: margin, bottom: margin),
    width: displaySize.width / 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: MyColors.box,
      boxShadow: [shadow],
    ),
    child: FlatButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => OpenedDiary(this),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _name(),
          _prefix(),
        ],
      ),
    ),
  );
}