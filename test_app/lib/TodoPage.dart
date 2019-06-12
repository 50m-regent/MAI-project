import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "Settings.dart";
//import "UI.dart";

class TodoPage extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<TodoPage>{
  Widget build(BuildContext context) {
    now = 4;
    return uiDirection == 0 ? Scaffold(
      endDrawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          
        ],
      ),
    ) : Scaffold(
      drawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
