import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "ProfileUI.dart";
import "Settings.dart";
//import "UI.dart";

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage>{
  Widget build(BuildContext context) {
    now = 5;
    return uiDirection == 0 ? Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      endDrawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          accountProfile(),
        ],
      ),
    ) : Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      drawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          accountProfile(),
        ],
      ),
    );
  }
}
