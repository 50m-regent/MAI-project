import 'package:flutter/material.dart';
import '../constants.dart';

final _homeIcon =     Icons.home;
final _diaryIcon =    Icons.book;
final _calendarIcon = Icons.today;
final _todoIcon =     Icons.assignment;
final _profileIcon =  Icons.account_circle;
final _friendIcon =   Icons.group;

BottomNavigationBarItem _iconTemplate(IconData icon) => BottomNavigationBarItem(
  icon: Icon(
    icon,
    color: MyColors.icon,
  ),
  activeIcon: Icon(
    icon,
    color: MyColors.theme,
  ),
  title: Container(),
);

BottomNavigationBarItem _home =     _iconTemplate(_homeIcon);
BottomNavigationBarItem _diary =    _iconTemplate(_diaryIcon);
BottomNavigationBarItem _calendar = _iconTemplate(_calendarIcon);
BottomNavigationBarItem _todo =     _iconTemplate(_todoIcon);
BottomNavigationBarItem _profile =  _iconTemplate(_profileIcon);
BottomNavigationBarItem _friend =   _iconTemplate(_friendIcon);

List<BottomNavigationBarItem> buttons = [
  _home,
  _diary,
  _calendar,
  _todo,
  _profile,
  _friend,
];