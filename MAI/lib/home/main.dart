import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'items.dart';

// ホーム
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DISPLAY_SIZE = MediaQuery.of(context).size;
    MARGIN = DISPLAY_SIZE.width / 12;
    ICON_SIZE = DISPLAY_SIZE.width / 12;
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Home(),
    );
  }
}