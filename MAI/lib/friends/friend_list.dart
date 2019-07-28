import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../main.dart';
import 'friend.dart';

class FriendList extends StatefulWidget {
  @override
  State createState() => _FriendListState();
}

class _FriendListState extends State {
  final _mainReference = FirebaseDatabase.instance.reference().child(user.uid);
  List<Friend> _sortedFriendList = [];

  @override
  void initState() {
    super.initState();
    _mainReference.once().then((DataSnapshot snapshot) {
      setState(() {
        if(snapshot.value == null) {
          _mainReference.update({'friends': []});
        }
        snapshot.value['friends'].forEach((_f) {
          if(_f.isBestFriend){
            _sortedFriendList.add(_f);
          }
        });
        snapshot.value['friends'].forEach((_f) {
          if(!_f.isBestFriend){
            _sortedFriendList.add(_f);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) => _sortedFriendList.length != 0 ? Container(
    color: Colors.transparent,
    margin: EdgeInsets.symmetric(vertical: margin),
    child: ListView.builder(
      itemCount: _sortedFriendList.length,
      itemBuilder: ((BuildContext context, int index) => _sortedFriendList[index]),
    ),
  ) : Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'フレンドがいません...',
          style: MyTextStyle(color: MyColors.icon).bigBold,
        ),
        Text(
          'ホームのカメラで友達の',
          style: MyTextStyle(color: MyColors.icon).bigBold,
        ),
        Text(
          'QRコードを読み取ろう！',
          style: MyTextStyle(color: MyColors.icon).bigBold,
        ),
      ],
    ),
  );
}