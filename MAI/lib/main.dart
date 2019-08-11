import 'package:flutter/material.dart';
import 'constants.dart';
import 'friends/main.dart';
import 'menu/items.dart';
import 'home/main.dart';
import 'diary/main.dart';
import 'calendar/main.dart';
import 'todo/main.dart';
import 'profile/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';

FirebaseUser user;

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  int _now = 0;
  // アプリのページ一覧
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
    'フレンド',
  ];

  AppBar _appBar() => AppBar(
    title: Text(
      _titleList[_now],
      style: MyTextStyle(color: Colors.white).largeBold,
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

  _signIn() async => user = await FirebaseAuth.instance.signInAnonymously();

  @override
  initState() {
    super.initState();
    _signIn();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ja_JP");
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MyColors.theme,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: MyColors.background,
        body: _pageList[_now],
        appBar: _appBar(),
        bottomNavigationBar: _menu(),
      ),
    );
  }
}

main() => runApp(MyApp());