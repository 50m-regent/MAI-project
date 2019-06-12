import "package:flutter/material.dart";
import 'package:test_app/Constants.dart';
import "Settings.dart";

Widget icon(BuildContext context, {String pageName, Color color, IconData icon}) {
  return Row(
    children: <Widget>[
      SizedBox(
        width: 60,
      ),
      IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, pageName);
        },
        icon: Icon(icon,
          color: color,
          size: ICON_SIZE,
        ),
      ),
      SizedBox(
        width: 15,
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          pageName,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget homeIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = Colors.orange;
  }
  return icon(
    context,
    pageName: "Home",
    color: color,
    icon: Icons.home,
  );
}

Widget profileIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFFEF5350,
      <int, Color>{
      }
    );
    // Colors.red[400];
  }
  return icon(
    context,
    pageName: "Profile",
    color: color,
    icon: Icons.account_circle,
  );
}

Widget diaryIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFFF48FB1,
      <int, Color>{
      }
    );
    // Colors.pink[200];
  }
  return icon(
    context,
    pageName: "Diary",
    color: color,
    icon: Icons.book,
  );
}

Widget weatherIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFF536DFE,
      <int, Color>{
      }
    );
    // Colors.indigoAccent[100];
  }
  return icon(
    context,
    pageName: "Weather",
    color: color,
    icon: Icons.cloud,
  );
}

Widget calendarIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFF4FC3F7,
      <int, Color>{
      }
    );
    // Colors.lightBlue[300];
  }
  return icon(
    context,
    pageName: "Calendar",
    color: color,
    icon: Icons.today,
  );
}

Widget todoIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFFFFEA00,
      <int, Color>{
      }
    );
    // Colors.yellowAccent[400];
  }
  return icon(
    context,
    pageName: "Todo",
    color: color,
    icon: Icons.assignment,
  );
}

Widget friendsIcon(BuildContext context, {bool colored = false}) {
  var color = UNSELECTED_COLOR;
  if(colored){
    color = MaterialColor(
      0xFF66BB6A,
      <int, Color>{
      }
    );
    // Colors.green[400];
  }
  return icon(
    context,
    pageName: "Friends",
    color: color,
    icon: Icons.group,
  );
}

List<Widget> icons(BuildContext context, {int color}) {
  var colorFlag = [false, false, false, false, false, false, false];
  colorFlag[color] = true;
  return [
    homeIcon(context, colored: colorFlag[0]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    diaryIcon(context, colored: colorFlag[1]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    weatherIcon(context, colored: colorFlag[2]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    calendarIcon(context, colored: colorFlag[3]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    todoIcon(context, colored: colorFlag[4]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    profileIcon(context, colored: colorFlag[5]),
    SizedBox(height: GAP_BETWEEN_ICONS),
    friendsIcon(context, colored: colorFlag[6]),
  ];
}

Widget menu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70),
      child: ListView(
        children: icons(context, color: now),
      ),
    );
  }