import 'package:flutter/material.dart';
import 'constants.dart';
import 'friends/main.dart';
import 'menu/items.dart';
import 'home/main.dart';
import 'diary/main.dart';
import 'calendar/main.dart';
import 'todo/main.dart';
import 'profile/main.dart';

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  int _now = 0;
  final _pageList = [
    HomePage(),
    DiaryPage(),
    CalendarPage(),
    TodoPage(),
    ProfilePage(),
    FriendsPage(),
  ];
  final _titleList = [
    'ホーム',
    '日記',
    'カレンダー',
    'Todoリスト',
    'プロフィール',
    '友達',
  ];

  AppBar _appBar() => AppBar(
    backgroundColor: MyColors.box,
    title: Text(
      _titleList[_now],
      style: MyTextStyle().largeBold(),
    ),
  );

  BottomNavigationBar _menu() => BottomNavigationBar(
    backgroundColor: MyColors.box,
    currentIndex: _now,
    items: buttons,
    onTap: (int index) => setState(() {
      _now = index;
    }),
  );

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      backgroundColor: MyColors.background,
      body: _pageList[_now],
      appBar: _appBar(),
      bottomNavigationBar: _menu(),
    ),
  );
}

main() => runApp(MyApp());