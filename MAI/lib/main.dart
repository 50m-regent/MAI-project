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
    backgroundColor: MyColors.box,
    title: Text(
      _titleList[_now],
      style: MyTextStyle().largeBold,
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

  anonymousLogin() {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) async {
      if (user != null) {
        var isAnonymous = user.isAnonymous;
        var uid = user.uid;
        print(
            'In FirestoreServices, isAnonymous = $isAnonymous and uid = $uid');
      } else {
        FirebaseAuth.instance.signInAnonymously().then((user) {
          print(
              'In FirestoreServices, isAnonymous = ${user.isAnonymous} and uid = ${user.uid}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    anonymousLogin();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: MyColors.background,
        body: _pageList[_now],
        appBar: _appBar(),
        bottomNavigationBar: _menu(),
      ),
    );
  }
}

main() => runApp(MyApp());