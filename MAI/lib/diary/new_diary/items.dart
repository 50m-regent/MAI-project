import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Widget postIcon({double iconSize}) {
    return IconButton(
      onPressed: () {
        // TODO: 投稿
      },
      tooltip: "投稿",
      icon: Icon(
        Icons.library_books,
        color: Colors.white,
        size: iconSize,
      )
    );
  }

Widget date() {
    initializeDateFormatting("ja_JP");
    var date = DateFormat('MM月dd日(E)', "ja_JP").format( DateTime.now() );
    return Positioned(
      top: 120,
      left: 43,
      child: Text(
        date,
        style: TextStyle(
          color: Colors.black,
          fontSize: 29,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }