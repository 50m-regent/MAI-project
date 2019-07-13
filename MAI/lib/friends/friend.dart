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
  Widget _icon() => widget.iconImage == null ? Icon(
    Icons.account_circle,
    color: MyColors.darkIcon,
    size: iconSize * 2.5,
  ) : CircleAvatar(
    backgroundImage: FileImage(
      widget.iconImage.data,
    ),
  );

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(bottom: margin, right: margin, left: margin,),
    height: displaySize.height / 8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: widget.isBestFriend ? Colors.yellow : MyColors.box,
      boxShadow: [shadow],
    ),
    child: FlatButton(
      onPressed: () => setState(() => widget.isBestFriend = widget.isBestFriend ? false : true),
      child: Row(
        children: <Widget>[
          _icon(),
          Container(width: margin / 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.name,
                style: MyTextStyle().normalBold(),
              ),
              Text(
                widget.message,
                style: MyTextStyle().mini(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
