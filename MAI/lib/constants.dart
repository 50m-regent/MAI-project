// Format Verified 1

import 'package:flutter/material.dart';

Size displaySize;
double iconSize;
double margin;

class MyColors {
  static final Color background = Colors.blue[50];
  static final Color icon       = Colors.grey;
  static final Color box        = Colors.grey[350];
  static       Color theme;
}

class MyTextStyle {
  final Color color;
  MyTextStyle({this.color: Colors.black});

  TextStyle _bold(double fontSize) => TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );

  TextStyle _regular(double fontSize) => TextStyle(
    color: color,
    fontSize: fontSize,
  );

  TextStyle get hugeBold    => _bold(40);
  TextStyle get veryBigBold => _bold(35);
  TextStyle get bigBold     => _bold(29);
  TextStyle get largeBold   => _bold(25);
  TextStyle get normalBold  => _bold(20);
  TextStyle get miniBold    => _bold(17);

  TextStyle get huge    => _regular(40);
  TextStyle get veryBig => _regular(35);
  TextStyle get big     => _regular(29);
  TextStyle get large   => _regular(25);
  TextStyle get normal  => _regular(20);
  TextStyle get mini    => _regular(17);
}