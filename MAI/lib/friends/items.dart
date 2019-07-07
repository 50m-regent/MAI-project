import 'dart:io';
import 'package:flutter/material.dart';

import '../constants.dart';

class _Friend {
  _FriendsState parent;
  String name, status;
  File iconImage;
  bool isBestFriend;

  _Friend(
    this.parent,
    {this.name,
    this.status,
    this.iconImage,
    this.isBestFriend,
  });

  _bestFriendSwitch() {
    parent.setState(() {
      isBestFriend = isBestFriend ? false : true;
      //TODO: 鯖への更新
    });
  }

  Widget _widget(){
    return Container(
      margin: EdgeInsets.only(
        bottom: MARGIN,
        left: MARGIN,
        right: MARGIN,
      ),
      padding: EdgeInsets.only(left: 16),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isBestFriend ? Colors.yellow : MyColors.box,
        boxShadow: [SHADOW],
      ),
      child: FlatButton(
        onPressed: _bestFriendSwitch,
        child: Row(
          children: <Widget>[
            //iconImage, TODO: あとでやるで（あいこんやで）
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: MyTextStyle().normalBold(),
                ),
                Text(
                  status,
                  style: MyTextStyle().mini(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  List<_Friend> _friendList;
  @override
  initState() {
    super.initState();
    _friendList = [
      _Friend(
        this,
        name: 'aiueo',
        status: 'aeiou',
        iconImage: null,
        isBestFriend: false,
      ),
      _Friend(
        this,
        name: 'たかし',
        status: 'あじ',
        iconImage: null,
        isBestFriend: true,
      ),
      _Friend(
        this,
        name: 'なめこ',
        status: 'バーカ',
        iconImage: null,
        isBestFriend: false,
      ),
      _Friend(
        this,
        name: '佐田',
        status: '佐田です',
        iconImage: null,
        isBestFriend: false,
      ),
      _Friend(
        this,
        name: 'アーメン',
        status: 'あーめんどくせー',
        iconImage: null,
        isBestFriend: false,
      ),
      _Friend(
        this,
        name: 'ジーメン',
        status: 'じーめんどくせー',
        iconImage: null,
        isBestFriend: false,
      ),
      _Friend(
        this,
        name: 'ダーメン',
        status: 'だーめんどくせー',
        iconImage: null,
        isBestFriend: true,
      ),
    ];
  }

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
      itemCount: _friendList.length,
      itemBuilder: ((BuildContext context, int index) {
        return _sortedFriendList[index]._widget();
      }),
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