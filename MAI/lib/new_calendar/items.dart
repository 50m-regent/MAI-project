import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _margin = _displaySize.width / 12;

    return Container(
      child: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}