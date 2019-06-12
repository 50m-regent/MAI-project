import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "WeatherUI.dart";
import "Settings.dart";
//import "UI.dart";

class WeatherPage extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherPage>{
  Widget build(BuildContext context) {
    now = 2;
    return uiDirection == 0 ? Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      endDrawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          // weeklyWeather(),
        ],
      ),
    ) : Scaffold(
      backgroundColor: BACKGROUND_COLOR[200],
      drawer: Drawer(
        child: menu(context),
      ),
      body: Stack(
        children: <Widget>[
          // weeklyWeather(),
        ],
      ),
    );
  }
}
