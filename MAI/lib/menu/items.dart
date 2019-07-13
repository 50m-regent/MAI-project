import 'package:flutter/material.dart';
import '../constants.dart';

BottomNavigationBarItem _iconTemplate({
    IconData icon,
    String title,
    Color color,
  }) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      color: MyColors.icon,
    ),
    activeIcon: Icon(
      icon,
      color: color,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: MyColors.icon,
      ),
    ),
  );
}

BottomNavigationBarItem home() {
  return _iconTemplate(
    icon: Icons.home,
    title: 'Home',
    color: Colors.orange,
  );
}

BottomNavigationBarItem diary() {
  return _iconTemplate(
    icon: Icons.book,
    title: 'Diary',
    color: MaterialColor(
      0xFFF48FB1,
      <int, Color>{}
    ),
  );
}

BottomNavigationBarItem calendar() {
  return _iconTemplate(
    icon: Icons.today,
    title: 'Calendar',
    color: MaterialColor(
      0xFF4FC3F7,
      <int, Color>{}
    ), // Colors.lightBlue[300]
  );
}

BottomNavigationBarItem todo() {
  return _iconTemplate(
    icon: Icons.assignment,
    title: 'Todo',
    color: MaterialColor(
      0xFFFFEA00,
      <int, Color>{}
    ), // Colors.yellowAccent[400]
  );
}

BottomNavigationBarItem profile() {
  return _iconTemplate(
    icon: Icons.account_circle,
    title: 'Profile',
    color: MaterialColor(
      0xFFEF5350,
      <int, Color>{}
    ), // Colors.red[400]
  );
}

BottomNavigationBarItem friends() {
  return _iconTemplate(
    icon: Icons.group,
    title: 'Friends',
    color: MaterialColor(
      0xFF66BB6A,
      <int, Color>{}
    ), // Colors.green[400]
  );
}

List<BottomNavigationBarItem> buttons = [
  home(),
  diary(),
  calendar(),
  todo(),
  profile(),
  friends(),
];