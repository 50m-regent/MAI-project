import 'package:flutter/material.dart';
import 'package:mai/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _icon() {
    return Positioned(
      top: 40,
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
      left: 180,
      child: Text(
        '名前',
        style: TextStyle(
          fontSize: 35,

        ),
      ),
    );
  }

  Widget _birthday() {
    return Positioned(
      top: 200,
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
      top:70,
      right: 10,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 50,
          ),
          Icon(
            Icons.account_circle,
            size: 50,
          ),

        ],
      )
    );
  }

  Widget _graffiti() {
    return Positioned(
      top: 370,
      left: 40,
      child: Column(
        children: <Widget>[
          Text(
            '落書き\nなんか書く',
            style: TextStyle(
              fontSize: 30,
            ),
          )

        ],
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
        _graffiti(),
      ],
    );
  }
}