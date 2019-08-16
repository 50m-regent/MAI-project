import 'package:flutter/material.dart';
import '../constants.dart';

final _homeIcon =     Icons.home;
final _diaryIcon =    Icons.book;
final _calendarIcon = Icons.today;
final _todoIcon =     Icons.assignment;
final _profileIcon =  Icons.account_circle;
final _friendIcon =   Icons.group;

BottomNavigationBarItem _iconTemplate({IconData icon, String title}) => BottomNavigationBarItem(
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

BottomNavigationBarItem _home =     _iconTemplate(icon: _homeIcon,     title: 'Home');
BottomNavigationBarItem _diary =    _iconTemplate(icon: _diaryIcon,    title: 'Diary');
BottomNavigationBarItem _calendar = _iconTemplate(icon: _calendarIcon, title: 'Calendar');
BottomNavigationBarItem _todo =     _iconTemplate(icon: _todoIcon,     title: 'Todo');
BottomNavigationBarItem _profile =  _iconTemplate(icon: _profileIcon,  title: 'Profile');
BottomNavigationBarItem _friend =   _iconTemplate(icon: _friendIcon,   title: 'Friends');

List<BottomNavigationBarItem> buttons = [
  _home,
  _diary,
  _calendar,
  _todo,
  _profile,
  _friend,
];