import 'package:flutter/material.dart';

Size DISPLAY_SIZE;
double ICON_SIZE;
double MARGIN;

class MyColors {
  /*
  static final Color background = MaterialColor(
    0xFFE0F7FA,
    <int, Color>{},
  );
  */
  static final Color background = Colors.white;
  static final Color icon = Colors.grey;
  static final Color box = Colors.grey[350];
}

const BoxShadow SHADOW = BoxShadow(
  color: Colors.black45,
  offset: Offset(5, 5),
  blurRadius: 5,
);

class MyTextStyle {
  final Color color;
  MyTextStyle({this.color: Colors.black});

  TextStyle bigBold() => TextStyle(
    color: this.color,
    fontSize: 29,
    fontWeight: FontWeight.bold,
  );

  TextStyle big() => TextStyle(
    color: this.color,
    fontSize: 29,
  );

  TextStyle normalBold() => TextStyle(
    color: this.color,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  TextStyle normal() => TextStyle(
    color: this.color,
    fontSize: 20,
  );

  TextStyle miniBold() => TextStyle(
    color: this.color,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  TextStyle mini() => TextStyle(
    color: this.color,
    fontSize: 17,
  );
}

// 鍵アイコン
const IconData LOCK_ICON_ON = Icons.lock_outline;
const IconData LOCK_ICON_OFF = Icons.lock_open;