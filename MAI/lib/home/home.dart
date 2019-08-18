import 'package:flutter/material.dart';

import '../constants.dart';
import 'date.dart';
import 'items.dart';
import '../main.dart';


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
      color: _isUIVisible ? MyColors.icon : Colors.red[400],
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

  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      //unityObj,
      Container(
        margin: EdgeInsets.all(margin),
        child: Stack(
          children: <Widget>[
            _isUIVisible ? notice : Container(),
            _isUIVisible ? Date() : Container(),
            _isUIVisible ? _icons() : Align(
              alignment: Alignment.bottomRight,
              child: _showUI(),
            ),
          ],
        ),
      ),
    ],
  );
}