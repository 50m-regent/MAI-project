import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "Settings.dart";
//import "UI.dart";

class DiaryPage extends StatefulWidget {
  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<DiaryPage>{
  Widget _newDiaryIcon() {
    return uiDirection == 0 ? Positioned(
      top: 50,
      right: 40,
      child: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "NewDiary");
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: ICON_SIZE,
        ),
        tooltip: "新しい日記",
      ),
    ) : Positioned(
      top: 50,
      left: 40,
      child: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "NewDiaryPage");
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: ICON_SIZE,
        ),
        tooltip: "新しい日記",
      ),
    );
  }

  Widget build(BuildContext context) {
    now = 1;
    return uiDirection == 0 ? Scaffold(
      endDrawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          _newDiaryIcon(),
        ],
      ),
    ) : Scaffold(
      drawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          _newDiaryIcon(),
        ],
      ),
    );
  }
}
