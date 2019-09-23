import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mai/diary/diary_row.dart';
import '../constants.dart';
import '../main.dart';
import 'diary.dart';

class DiaryList extends StatelessWidget {
  final List<Diary> _list = [];
  final Map<String, List<Diary>> _newList = {};
  List<DiaryRow> _rowList = [];

  _getDiary() {
    final _friendReference = FirebaseDatabase.instance.reference().child('friends');
    _friendReference.once().then((DataSnapshot friendSnapshot) {
      if(friendSnapshot.value != null){
        friendSnapshot.value.forEach((String id) {
          final _ref = FirebaseDatabase.instance.reference().child(id);
          String name;
          _ref.child('profile').once().then((DataSnapshot profileSnapshot) {
            name = profileSnapshot.value['name'];
          });

          _ref.child('diary').once().then((DataSnapshot diarySnapshot) {
            diarySnapshot.value.forEach((String date, Map<String, dynamic> diary) {
              if(!diary['lock']) {
                _list.add(Diary(
                  date: date,
                  image: null,
                  text: diary['text'],
                  name: name,
                ));
              }
            });
          });
        });
      }
    });
    
    final _ref = FirebaseDatabase.instance.reference().child(user.uid);
    String name;
    _ref.child('profile').once().then((DataSnapshot profileSnapshot) {
      name = profileSnapshot.value['name'];
    });

    _ref.child('diary').once().then((DataSnapshot diarySnapshot) {
      diarySnapshot.value.forEach((dynamic date, dynamic diary) {
        _list.add(Diary(
          date: date,
          image: null,
          text: diary['text'],
          name: name,
        ));
      });
    });
    print(_list);
  }

  DiaryList() {
    _getDiary();

    _list.forEach((_d) {
      if(_newList[_d.date] == null) {
        _newList[_d.date] = [];
      }
      _newList[_d.date].add(_d);
    });

    _newList.forEach((_date, _l) {
      _rowList.add(DiaryRow(_l));
    });

    _rowList = _rowList.reversed.toList();
  }

  Widget build(BuildContext context) => Container(
    color: Colors.transparent,
    margin: EdgeInsets.only(
      right: margin,
      left: margin,
      bottom: margin,
    ),
    child: ListView.builder(
      reverse: true,
      itemCount: _rowList.length,
      itemBuilder: (BuildContext context, int index) => _rowList[index],
    ),
  );
}