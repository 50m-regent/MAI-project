// Format Verified 1

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class Palette extends StatefulWidget {
  final Color color;

  Palette({this.color});

  @override
  _PaletteState createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  _changeTheme() async {
    MyColors.theme = widget.color;

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', MyColors.theme.value);
    print(MyColors.theme.value);

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(
          'テーマカラーの変更は、アプリを一度再起動してから反映されます。',
          style: MyTextStyle().mini,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              exit(0);
            },
            child: Text(
              '再起動',
              style: MyTextStyle(color: MyColors.theme).mini,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '後で',
              style: MyTextStyle(color: MyColors.theme).mini,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    height: margin,
    width:  margin,
    decoration: BoxDecoration(
      color: widget.color,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: FlatButton(
      onPressed: _changeTheme,
      child: null,
    ),
  );
}

List<Palette> palette = [ // パレット
  Palette(color: Colors.red),
  Palette(color: Colors.orange),
  Palette(color: Colors.yellow),
  Palette(color: Colors.green),
  Palette(color: Colors.blue),
  Palette(color: Colors.purple),
  Palette(color: Colors.grey),
  Palette(color: Colors.indigo),
];