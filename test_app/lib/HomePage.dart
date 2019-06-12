import "package:flutter/material.dart";
import "Constants.dart";
import "Settings.dart";
import "MenuUI.dart";

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage>{
  _notificationChange() {
    setState(() {
      notificationFlag = 1 - notificationFlag;
    });
  }

  _flipUi() {
    setState(() {
      uiDirection = 1 - uiDirection;
    });
  }

  Widget _notificationIcon() {
    var _notificationColor = Colors.red;
    var _notificationTooltip = "通知OFF";
    var _notificationIcon = NOTIFICATION_ICON_OFF;
    if(notificationFlag == 1){
      _notificationColor = MaterialColor(
        0xFFFFFFFF,
        <int, Color>{
        }
      );
      _notificationTooltip = "通知ON";
      _notificationIcon = NOTIFICATION_ICON_ON;
    }
    return IconButton(
      onPressed: _notificationChange,
      tooltip: _notificationTooltip,
      icon: Icon(
        _notificationIcon,
        color: _notificationColor,
        size: ICON_SIZE,
      ),
    );
  }

  Widget _flipIcon() {
    return IconButton(
      onPressed: _flipUi,
      tooltip: "UI反転",
      icon: Icon(
        Icons.autorenew,
        color: Colors.white,
        size: ICON_SIZE,
      )
    );
  }

  Widget _notificationAndFlip() {
    return uiDirection == 0 ? Positioned(
        top: 50,
        right: 40,
        left: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _notificationIcon(),
            _flipIcon(),
          ],
        ),
      ) : Positioned(
        top: 50,
        right: 40,
        left: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _flipIcon(),
            _notificationIcon(),
          ],
        ),
      );
  }

  Widget build(BuildContext context) {
    now = 0;
    return uiDirection == 0 ? Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      endDrawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          _notificationAndFlip(),
        ],
      ),
    ) : Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      drawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          _notificationAndFlip(),
        ],
      ),
    );
  }
}