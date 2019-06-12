import "package:flutter/material.dart";
import "Constants.dart";
import "Settings.dart";

Widget _accountIcon() {
  return Icon(
    Icons.account_circle,
    color: Colors.grey[400],
    size: ACCOUNT_ICON_SIZE,
  );
}

Widget _name() {
  return Text(
    "おなまえ",
    style: TextStyle(
      color: nameColor,
      fontSize: 40,
    ),
  );
}

Widget _id() {
  return Text(
    "ID: 012345",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  );
}

Widget accountProfile() {
  return Positioned(
    top: 60,
    right: 10,
    left: 10,
    child: Column(
      children: <Widget>[
        _accountIcon(),
        _name(),
        _id(),
      ],
    ),
  );
  
}