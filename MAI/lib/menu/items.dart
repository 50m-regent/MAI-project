import 'package:flutter/material.dart';
import '../constants.dart';

final _homeIcon =     Icons.home;
final _diaryIcon =    Icons.book;
final _calendarIcon = Icons.today;
final _todoIcon =     Icons.assignment;
final _profileIcon =  Icons.account_circle;
final _friendIcon =   Icons.group;

final _homeColor =     Colors.orange;
final _diaryColor =    Colors.pinkAccent;
final _calendarColor = Colors.lightBlue[300];
final _todoColor =     Colors.yellowAccent[400];
final _profileColor =  Colors.red[400];
final _friendColor =   Colors.green[400];

BottomNavigationBarItem _iconTemplate({IconData icon, String title, Color color}) => BottomNavigationBarItem(
  icon: Icon(
    icon,
    color: MyColors.icon,
  ),
  activeIcon: Icon(
    icon,
    color: MyColors.theme,
  ),
  title: Text(
    title,
    style: TextStyle(
      color: MyColors.icon,
    ),
  ),
);

BottomNavigationBarItem _home =     _iconTemplate(icon: _homeIcon,     title: 'Home',     color: _homeColor);
BottomNavigationBarItem _diary =    _iconTemplate(icon: _diaryIcon,    title: 'Diary',    color: _diaryColor);
BottomNavigationBarItem _calendar = _iconTemplate(icon: _calendarIcon, title: 'Calendar', color: _calendarColor);
BottomNavigationBarItem _todo =     _iconTemplate(icon: _todoIcon,     title: 'Todo',     color: _todoColor);
BottomNavigationBarItem _profile =  _iconTemplate(icon: _profileIcon,  title: 'Profile',  color: _profileColor);
BottomNavigationBarItem _friend =   _iconTemplate(icon: _friendIcon,   title: 'Friends',  color: _friendColor);

List<BottomNavigationBarItem> buttons = [
  _home,
  _diary,
  _calendar,
  _todo,
  _profile,
  _friend,
];