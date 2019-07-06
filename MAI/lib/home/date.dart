import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mai/constants.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  Widget _date;
  Widget _time;

  _getTime() {
    setState(() {
      _date = Text(
        DateFormat('M月d日(E)').format(DateTime.now()),
        style: MyTextStyle(color: Colors.white).hugeBold(),
      );
      _time = Text(
        DateFormat('H:m:s').format(DateTime.now()),
        style: MyTextStyle(color: Colors.white).hugeBold(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  
  @override //TODO: 全クラスのoverride確認
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: DISPLAY_SIZE.height / 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _date,
            _time,
          ],
        ),
      ),
    );
  }
}