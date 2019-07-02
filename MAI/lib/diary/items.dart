import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'new_diary/main.dart';

Widget newDiaryIcon(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _iconSize = _displaySize.width / 12;
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NewDiaryPage();
          }
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: _iconSize,
      ),
      tooltip: "新しい日記",
      backgroundColor: ICON_COLOR,
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
    );
  }

  Widget widget(){
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
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
      height: 200,
      child: Column(
        children: <Widget>[
          Text(
            list[0].date.toString(),
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
      date: 190702,
      image: null,
      text: '今日は楽しかったさだまさし',
    ),
    _Diary(
      name: '山田',
      date: 190703,
      image: null,
      text: '今日は楽しかったさだまさしああdfはkdfはd',
    ),
    _Diary(
      name: '平田',
      date: 190706,
      image: null,
      text: '今日は楽しかったさだまさしあdふぁ',
    ),
    _Diary(
      name: '福田',
      date: 190702,
      image: null,
      text: '今日は楽しかったさだまさしふぁ',
    ),
    _Diary(
      name: '福田',
      date: 190708,
      image: null,
      text: '今日は人を殺した楽しかった',
    ),
    _Diary(
      name: '福田',
      date: 190710,
      image: null,
      text: '今日はチンチンを露出した楽しかった',
    ),
  ];

  Map<int, List<_Diary>> _newList = {};

  _list.forEach((_d) {
    if(_newList[_d.date] == null) {
      _newList[_d.date] = [];
    }
    _newList[_d.date].add(_d);
  });

  List<_DailyDiaries> _nnewList = [];

  _newList.forEach((_date, _l) {
    _nnewList.add(_DailyDiaries(list: _l));
  });

  _nnewList = _nnewList.reversed.toList();

  return Container(
    child: ListView.builder(
      reverse: true,
      itemCount: _nnewList.length,
      itemBuilder: (BuildContext context, int index){
        return _nnewList[index].widget();
      },
    ),
  );
}