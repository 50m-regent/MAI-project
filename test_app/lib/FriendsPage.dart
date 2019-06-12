import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "Settings.dart";
//import "UI.dart";

class FriendsPage extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<FriendsPage>{
  Widget build(BuildContext context) {
    now = 6;
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
