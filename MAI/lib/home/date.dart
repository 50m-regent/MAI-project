import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class Date extends StatefulWidget {
  @override
  State createState() => _DateState();
}

class _DateState extends State {
  Widget _date;
  Widget _time;

  _getTime() => setState(() {
    _date = Text(
      DateFormat('M月d日(E)').format(DateTime.now()),
      style: MyTextStyle(color: Colors.white).hugeBold(),
    );
    _time = Text(
      DateFormat('HH:mm:ss').format(DateTime.now()),
      style: MyTextStyle(color: Colors.white).hugeBold(),
    );
  });

  @override
  void initState() {
    super.initState();
    _getTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  
  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      height: displaySize.height / 6,
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