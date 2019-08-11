import 'package:flutter/material.dart';
import '../constants.dart';
import 'friend_list.dart';
import 'items.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: Column(
      children: <Widget>[
        Container(height: margin, width: 0),
        AddFriendIcon(),
      ],
    ),
    body: FriendList(),
  );
}