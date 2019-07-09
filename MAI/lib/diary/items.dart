import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mai/constants.dart';
import 'new_diary/main.dart';

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

class _Diary{
  int date;
  File image;
  String name,text;

  _Diary({
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

  Widget widget(){
    return Container(
      margin: EdgeInsets.only(right: MARGIN, bottom: MARGIN),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MyColors.box,
        boxShadow: [SHADOW],
      ),
      child: FlatButton(
        onPressed: (() {}), //TODO: 日記展開
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
  List<_Diary> list;

  _DailyDiaries({this.list});

  Widget _diaries() {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return list[index].widget();
        },
      ),
    );
  }

  Widget widget(){
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
          _diaries(),
        ],
      ),
    );
  }
}

Widget diaryList(){
  List<_Diary> _list = [
    _Diary(
      name: '篠田',
      date: 20190702,
      image: null,
      text: '今日は楽しかったさだまさし',
    ),
    _Diary(
      name: '山田',
      date: 20190703,
      image: null,
      text: '今日は楽しかったさだまさしああdfはkdfはd',
    ),
    _Diary(
      name: '平田',
      date: 20190703,
      image: null,
      text: '今日は楽しかったさだまさしあdふぁ',
    ),
    _Diary(
      name: '福田',
      date: 20190702,
      image: null,
      text: '今日は楽しかったさだまさしふぁ',
    ),
    _Diary(
      name: '福田',
      date: 20190708,
      image: null,
      text: '今日楽しかasdfasfasった',
    ),
    _Diary(
      name: '福田',
      date: 20190710,
      image: null,
      text: 'dfaasdsafasfdaしかった',
    ),
  ];

  Map<int, List<_Diary>> _newList = {};

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
        return _sortedList[index].widget();
      },
    ),
  );
}