import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "Settings.dart";
import "CalendarUI.dart";
//import "UI.dart";

class CalendarPage extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage>{
  Widget build(BuildContext context) {
    now = 3;
    //getUIDirection();
    return uiDirection == 0 ? Scaffold(
      endDrawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200], // Colors.white,
      body: Stack(
        children: <Widget>[
          Calendar(),
        ],
      ),
    ) : Scaffold(
      drawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200], // Colors.white,
      body: Stack(
        children: <Widget>[
          Calendar(),
        ],
      ),
    );
  }
}
