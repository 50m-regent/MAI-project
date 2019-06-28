import 'dart:io';
import 'package:flutter/material.dart';

class _Friend {
  String name, status;
  File iconImage;
  bool isTomodaTimpo;

  _Friend({
    this.name,
    this.status,
    this.iconImage,
    this.isTomodaTimpo: false,
  });

  Widget _widget(){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isTomodaTimpo ? Colors.yellow : Colors.grey,
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
    ),
    _Friend(
      name: 'たかし',
      status: 'あじ',
      iconImage: null,
      isTomodaTimpo: true,
    ),
    _Friend(
      name: 'なめこ',
      status: 'バーカ',
      iconImage: null,
    ),
    _Friend(
      name: '佐田',
      status: '佐田です',
      iconImage: null,
    ),
    _Friend(
      name: 'アーメン',
      status: 'あーめんどくせー',
      iconImage: null,
    ),
        _Friend(
      name: 'ジーメン',
      status: 'じーめんどくせー',
      iconImage: null,
    ),
        _Friend(
      name: 'ダーメン',
      status: 'だーめんどくせー',
      iconImage: null,
      isTomodaTimpo: true,
    ),
  ];

  List<_Friend> _sortedFriendList = [];

  Widget _body() {
    _friendList.forEach((_f) {
      if(_f.isTomodaTimpo){
        _sortedFriendList.add(_f);
      }
    });
    _friendList.forEach((_f) {
      if(!_f.isTomodaTimpo){
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
    final Size _displaySize = MediaQuery.of(context).size;
    final double _margin = _displaySize.width / 12;
    return Container(
      padding: EdgeInsets.all(_margin),
      child: _body(),
    );
  }
}