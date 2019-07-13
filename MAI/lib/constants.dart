import 'package:flutter/material.dart';

Size displaySize;
double iconSize;
double margin;

class MyColors {
  static final Color background = Colors.blueGrey[300];
  static final Color icon = Colors.grey;
  static final Color darkIcon = Colors.grey[600];
  static final Color box = Colors.grey[350];
}

BoxShadow shadow = BoxShadow(
  color: Colors.black45,
  offset: Offset(5, 5),
  blurRadius: 5,
);

class MyTextStyle {
  final Color color;
  MyTextStyle({this.color: Colors.black});

  TextStyle hugeBold() => TextStyle(
    color: this.color,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  TextStyle huge() => TextStyle(
    color: this.color,
    fontSize: 40,
  );

  TextStyle veryBigBold() => TextStyle(
    color: this.color,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  TextStyle veryBig() => TextStyle(
    color: this.color,
    fontSize: 35,
  );

  TextStyle bigBold() => TextStyle(
    color: this.color,
    fontSize: 29,
    fontWeight: FontWeight.bold,
  );

  TextStyle big() => TextStyle(
    color: this.color,
    fontSize: 29,
  );

  TextStyle largeBold() => TextStyle(
    color: this.color,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  TextStyle large() => TextStyle(
    color: this.color,
    fontSize: 25,
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