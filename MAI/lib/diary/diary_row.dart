import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class DiaryRow extends StatelessWidget {
  final diaryList;
  DiaryRow(this.diaryList);

  Widget _diaries() => Expanded(
    child: ListView.builder(
      itemCount: diaryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => diaryList[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final Widget _date = Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        DateFormat('M/d').format(
          DateTime.parse('2019' + diaryList[0].date)
        ).toString(),
        style: MyTextStyle().bigBold,
      )
    );

    return Container(
      height: 180,
      margin: EdgeInsets.only(top: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _date,
          _diaries(),
        ],
      ),
    );
  }
}