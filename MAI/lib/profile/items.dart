import 'package:flutter/material.dart';
import 'package:mai/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _icon() {
    return Positioned(
      top: 50,
      left: 30,
      child: Icon(
        Icons.account_circle,
        size: 150,
        color: ICON_COLOR,
      ),
    );
  }

  Widget _name() {
    return Positioned(
      top: 100,
      left: 200,
      child: Text(
        '名前',
        style: TextStyle(
          fontSize: 40,
        
        ),
      ),
    );
  }

  Widget _birthday() {
    return Positioned(
      top: 210,
      left: 50,
      child: Text(
        'Birthday: 7/19',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _status() {
    return Positioned(
      top:250,
      left: 40,
      child: Column(
        children: <Widget>[
          Text(
            "一言",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            '仕事中',
            style:TextStyle(
              fontSize: 25,
            ),
          ),
        ],
        ),
      );
  }

  Widget _sns() {
    return Positioned(
      top:30,
      right: 30,
      child: Icon(
        Icons.account_circle,
        size: 40,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _icon(),
        _name(),
        _birthday(),
        _status(),
        _sns(),
        // TODO: 落書き
      ],
    );
  }
}