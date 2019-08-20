// Format Verified 1

import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'calendar/constants.dart';
import 'constants.dart';
import 'friends/main.dart';
import 'menu/items.dart';
import 'home/main.dart';
import 'diary/main.dart';
import 'calendar/main.dart';
import 'todo/main.dart';
import 'todo/todo.dart';
import 'profile/main.dart';

FirebaseUser user;

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  bool _isLoading = true;
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
    currentIndex: _now,
    items: buttons,
    onTap: (int index) => setState(() {
      _now = index;
    }),
  );

  _signIn() async {
    user = await FirebaseAuth.instance.signInAnonymously();
    getSchedule();
  }

  _getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      MyColors.theme = Color(prefs.getInt('theme') ?? 0xFFF44336);
      switch(MyColors.theme.toString()) {
        case 'Color(0xfff44336)': // red
          MyColors.background  = Colors.red[50];
          break;
        case 'Color(0xffff9800)': // orange
          MyColors.background  = Colors.orange[50];
          break;
        case 'Color(0xffffeb3b)': // yellow
          MyColors.background  = Colors.yellow[50];
          break;
        case 'Color(0xff4caf50)': // green
          MyColors.background  = Colors.green[50];
          break;
        case 'Color(0xff2196f3)': // blue
          MyColors.background  = Colors.blue[50];
          break;
        case 'Color(0xff9c27b0)': // purple
          MyColors.background  = Colors.purple[50];
          break;
        case 'Color(0xff9e9e9e)': // grey
          MyColors.background  = Colors.grey[50];
          break;
        case 'Color(0xff3f51b5)': // indigo
          MyColors.background  = Colors.indigo[50];
          break;
        default:
          MyColors.background  = Colors.red[50];
      }
    });
  }

  _load() {
    setState(() {
      Future.delayed(
        Duration(seconds: 3),
        () async {
          setState(() {
            _isLoading = false;
          });
        }
      );
    });
  }

  @override
  initState() {
    super.initState();
    initializeDateFormatting("ja_JP");
    _load();
    _signIn();
    _getTheme();
    getTodo();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.theme,
      ),
      home: _isLoading ? Scaffold(
        backgroundColor: MyColors.background,
        body: Center(
          child: CircularProgressIndicator(), //TODO: アイコン
        ),
      ) : Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: MyColors.background,
        body: _pageList[_now],
        appBar: _appBar(),
        bottomNavigationBar: _menu(),
      ),
    );
}

main() => runApp(MyApp());