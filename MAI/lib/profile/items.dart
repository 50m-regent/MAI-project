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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _icon(),
        _name(),
        //_birthday(),
        //_status(),
        // TODO: 落書き
      ],
    );
  }
}