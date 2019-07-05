import 'dart:io';
import 'package:flutter/material.dart';

import '../constants.dart';

class _Friend {
  String name, status;
  File iconImage;
  bool isBestFriend;

  _Friend({
    this.name,
    this.status,
    this.iconImage,
    this.isBestFriend,
  });

  Widget _widget(){
    return Container(
      margin: EdgeInsets.only(
        bottom: MARGIN,
        left: MARGIN,
        right: MARGIN,
      ),
      padding: EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isBestFriend ? Colors.yellow : Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          //iconImage, TODO: あとでやるで（あいこんやで）
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  List<_Friend> _friendList = [
    _Friend(
      name: 'aiueo',
      status: 'aeiou',
      iconImage: null,
      isBestFriend: false,
    ),
    _Friend(
      name: 'たかし',
      status: 'あじ',
      iconImage: null,
      isBestFriend: true,
    ),
    _Friend(
      name: 'なめこ',
      status: 'バーカ',
      iconImage: null,
      isBestFriend: false,
    ),
    _Friend(
      name: '佐田',
      status: '佐田です',
      iconImage: null,
      isBestFriend: false,
    ),
    _Friend(
      name: 'アーメン',
      status: 'あーめんどくせー',
      iconImage: null,
      isBestFriend: false,
    ),
        _Friend(
      name: 'ジーメン',
      status: 'じーめんどくせー',
      iconImage: null,
      isBestFriend: false,
    ),
        _Friend(
      name: 'ダーメン',
      status: 'だーめんどくせー',
      iconImage: null,
      isBestFriend: true,
    ),
  ];

//TODO 親友の選択

  List<_Friend> _sortedFriendList = [];

  Widget _body() {
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

    return ListView.builder(
      itemBuilder: ((BuildContext context, int index) {
        return _sortedFriendList[index]._widget();
      }),
      itemCount: _friendList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MARGIN),
      child: _body(),
    );
  }
}