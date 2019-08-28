import 'package:flutter/material.dart';
import '../constants.dart';

class Friend extends StatefulWidget {
  final name, message, iconImage;
  bool isBestFriend;
  Friend({
    this.name,
    this.message,
    this.iconImage,
    this.isBestFriend: false,
  });

  @override
  State createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  _switchToBestFriend() => setState(() => widget.isBestFriend = widget.isBestFriend ? false : true);

  Widget _icon() => widget.iconImage == null ? IconButton(
      onPressed: _switchToBestFriend,
      icon: Icon(
        Icons.account_circle,
        color: MyColors.icon,
      ),
      iconSize: iconSize * 2,
    ) : FlatButton(
      onPressed: _switchToBestFriend,
      child: CircleAvatar(
      backgroundImage: FileImage(
        widget.iconImage.data,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: margin, right: margin, left: margin),
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color: widget.isBestFriend ? Colors.yellow : MyColors.box,
        width: 3,
      ),
    ),
    child: FlatButton(
      onPressed: () => (() {}),
      child: Row(
        children: <Widget>[
          _icon(),
          //Container(width: margin / 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.name,
                style: MyTextStyle().normalBold,
              ),
              Text(
                widget.message,
                style: MyTextStyle().mini,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
