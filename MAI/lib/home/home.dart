import 'package:flutter/material.dart';
import '../constants.dart';
import 'date.dart';
import 'items.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  bool _isUIVisible = true;

  Widget _showUI() => IconButton(
    onPressed: () => setState(() {
      _isUIVisible = _isUIVisible ? false : true;
    }),
    tooltip: _isUIVisible ? 'UI非表示' : 'UI表示',
    icon: Icon(
      Icons.chat,
      color: _isUIVisible ? MyColors.darkIcon : Colors.red[400],
      size: iconSize * 1.5,
    ),
  );

  Widget _icons() => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      height: displaySize.height / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          arMode,
          _showUI(),
        ],
      ),
    ),
  );

  Widget _maiTemp = Align(
    alignment: Alignment(0, -0.3),
    child: Text(
      'MAIさん(仮)',
      style: MyTextStyle(color: Colors.white). bigBold,
    ),
  );

  Widget build(BuildContext context) => Container(
    color: Colors.transparent,
    margin: EdgeInsets.all(margin),
    child: _isUIVisible ? Stack(
      children: <Widget>[
        scheduleNotice,
        diaryNotice,
        todoNotice,
        Date(),
        _icons(),
        _maiTemp, // TODO: 本物
      ],
    ) : Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: _showUI(),
        ),
        _maiTemp, // TODO: 本物
      ],
    ),
  );
}