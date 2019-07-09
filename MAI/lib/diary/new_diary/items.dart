import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget date() {
  var date = DateFormat('MM月dd日(E)', "ja_JP").format( DateTime.now() );
  return Row(
    children: <Widget>[
      Text(
        date,
        style: TextStyle(
          color: Colors.black,
          fontSize: 29,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}