import 'package:flutter/material.dart';
import 'package:mai/diary/diary_row.dart';
import '../constants.dart';
import 'diary.dart';

class DiaryList extends StatelessWidget {
  final _list = [
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
      text: '今日asasasaしかったさだまさしああdfはkdfはd',
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

  final Map<int, List<Diary>> _newList = {};
  List<DiaryRow> _sortedList = [];

  DiaryList() {
    _list.forEach((_d) {
      if(_newList[_d.date] == null) {
        _newList[_d.date] = [];
      }
      _newList[_d.date].add(_d);
    });

    _newList.forEach((_date, _l) {
      _sortedList.add(DiaryRow(_l));
    });
    
    _sortedList = _sortedList.reversed.toList();
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.transparent,
    margin: EdgeInsets.symmetric(horizontal: margin),
    child: ListView.builder(
      itemCount: _sortedList.length,
      itemBuilder: (BuildContext context, int index) => _sortedList[index],
    ),
  );
}