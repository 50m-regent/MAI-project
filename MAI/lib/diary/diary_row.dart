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
  Widget build(BuildContext context) => Container(
    height: displaySize.height / 4.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          DateFormat('M/d').format(
            DateTime.parse(diaryList[0].date.toString())
          ).toString(),
          style: MyTextStyle().bigBold,
        ),
        _diaries(),
      ],
    ),
  );
}