import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mai/constants.dart';

Widget date() {
  var date = DateFormat('MM月dd日(E)', "ja_JP").format( DateTime.now() );
  return Row(
    children: <Widget>[
      Text(
        date,
        style: MyTextStyle().bigBold,
      ),
    ],
  );
}