import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mai/constants.dart';
import 'new_diary/main.dart';
import 'opened_diary/main.dart';

Widget newDiaryIcon(BuildContext context) {
  return FloatingActionButton.extended(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NewDiaryPage();
        }
      );
    },
    label: Text(
      '新しい日記を作成',
      style: MyTextStyle(color: Colors.white).normalBold(),
    ),
    icon: Icon(
      Icons.add,
      color: Colors.white,
      size: ICON_SIZE,
    ),
    tooltip: "新しい日記",
    backgroundColor: MyColors.icon,
  );
}

class Diary{
  int date;
  File image;
  String name,text;

  Diary({
    this.date,
    this.image,
    this.text,
    this.name,
  });

  Widget _name(){
    return Text(
      name,
      style: MyTextStyle().normalBold(),
    );
  }

  Widget _prefix(){
    String _prefix = '';
    for (int i = 0; i < 10; i++){
      _prefix += text[i];
    }
    _prefix += '...';
    return Text(
      _prefix,
      style: MyTextStyle().mini(),
    );
  }

  Widget widget(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: MARGIN, bottom: MARGIN),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MyColors.box,
        boxShadow: [SHADOW],
      ),
      child: FlatButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return OpenDiary(this);
            }
          );
        },
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _name(),
                _prefix(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyDiaries {
  List<Diary> list;

  _DailyDiaries({this.list});

  Widget _diaries(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return list[index].widget(context);
        },
      ),
    );
  }

  Widget widget(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            DateFormat('M/d').format(
              DateTime.parse(list[0].date.toString())
            ).toString(),
            style: MyTextStyle().bigBold(),
          ),
          _diaries(context),
        ],
      ),
    );
  }
}

Widget diaryList(BuildContext context){ //TODO: StatefulWidgetにする
  List<Diary> _list = [
    Diary(
      name: '篠田',
      date: 20190702,
      image: null,
      text: '今日は楽しかったさだまさし',
    ),
    Diary(
      name: '山田',
      date: 20190703,
      image: null,
      text: '今日は楽しかったさだまさしああdfはkdfはd',
    ),
    Diary(
      name: '平田',
      date: 20190703,
      image: null,
      text: '今日は楽しかったさだまさしあdふぁ',
    ),
    Diary(
      name: '福田',
      date: 20190702,
      image: null,
      text: '今日は楽しかったさだまさしふぁ',
    ),
    Diary(
      name: '福田',
      date: 20190708,
      image: null,
      text: '今日楽しかasdfasfasった',
    ),
    Diary(
      name: '福田',
      date: 20190710,
      image: null,
      text: 'dfaasdsafasfdaしかった',
    ),
  ];

  Map<int, List<Diary>> _newList = {};

  _list.forEach((_d) {
    if(_newList[_d.date] == null) {
      _newList[_d.date] = [];
    }
    _newList[_d.date].add(_d);
  });

  List<_DailyDiaries> _sortedList = [];

  _newList.forEach((_date, _l) {
    _sortedList.add(_DailyDiaries(list: _l));
  });
  
  _sortedList = _sortedList.reversed.toList();

  return Container(
    margin: EdgeInsets.all(MARGIN),
    child: ListView.builder(
      itemCount: _sortedList.length,
      itemBuilder: (BuildContext context, int index){
        return _sortedList[index].widget(context);
      },
    ),
  );
}