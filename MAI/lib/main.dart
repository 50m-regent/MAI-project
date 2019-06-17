import 'package:flutter/material.dart';
import 'menu/main.dart';
import 'home/main.dart';
import 'diary/main.dart';
import 'calendar/main.dart';
import 'todo/main.dart';
import 'profile/main.dart';

// main
void main() {
  runApp(MyApp());
}

// アプリ本体
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

// アプリ本体の変数を保持するやつ(実質こっちが中身)
class _MyAppState extends State<MyApp> {
  // 今のページ
  int _now = 0;
  // ページリスト
  final _pageList = [
    HomePage(),
    DiaryPage(),
    CalendarPage(),
    TodoPage(),
    ProfilePage(),
    Text('Friends'),
    Text('NewDiary'),
  ];

  // 起動時に実行されるやつ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // TODO: 背景3D
        body: _pageList[_now], // アプリの画面
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _now,
          onTap: (int index) {
            setState(() {
              _now = index;
            });
          },
          items: menu(),
        ), // 下のメニュー
      ),
    );
  }
}