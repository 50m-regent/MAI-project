import 'package:flutter/material.dart';
import '../constants.dart';
import 'friend.dart';

class FriendList extends StatefulWidget {
  @override
  State createState() => _FriendListState();
}

class _FriendListState extends State {
  final _friendList = [
    Friend(
      name: 'aiueo',
      message: 'aeiou',
      iconImage: null,
    ),
    Friend(
      name: 'たかし',
      message: 'あじ',
      iconImage: null,
      isBestFriend: true,
    ),
    Friend(
      name: 'なめこ',
      message: 'バーカ',
      iconImage: null,
    ),
    Friend(
      name: '佐田',
      message: '佐田です',
      iconImage: null,
    ),
    Friend(
      name: 'アーメン',
      message: 'あーめんどくせー',
      iconImage: null,
    ),
    Friend(
      name: 'ジーメン',
      message: 'じーめんどくせー',
      iconImage: null,
    ),
    Friend(
      name: 'ダーメン',
      message: 'だーめんどくせー',
      iconImage: null,
      isBestFriend: true,
    ),
  ];
  List<Friend> _sortedFriendList = [];

  @override
  void initState() {
    super.initState();
    _friendList.forEach((_f) {
      if(_f.isBestFriend){
        _sortedFriendList.add(_f);
      }
    });
    _friendList.forEach((_f) {
      if(!_f.isBestFriend){
        _sortedFriendList.add(_f);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.transparent,
    padding: EdgeInsets.all(margin),
    child: ListView.builder(
      itemCount: _friendList.length,
      itemBuilder: ((BuildContext context, int index) => _sortedFriendList[index]),
    ),
  );
}