import 'package:flutter/material.dart';
import 'constants.dart';
import 'friends/main.dart';
import 'menu/main.dart';
import 'home/main.dart';
import 'diary/main.dart';
import 'calendar/main.dart';
import 'todo/main.dart';
import 'profile/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

// アプリ本体
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

// アプリ本体の変数を保持するやつ(実質こっちが中身)
class _MyAppState extends State<MyApp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  FirebaseUser _user;

  Future<FirebaseUser> _loginWithTwitter() async {
    var twitterLogin = TwitterLogin(
      consumerKey: 'P5NCJjsnvU77p3idiq8nSoulw',
      consumerSecret: 'aYYpmczJuAlAdZ0aVUoOiRDbq2rJho8PSi5BNy3NlBNisquev4',
    );

    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        FirebaseUser user = await _auth.signInWithTwitter(
            authToken: session.token, authTokenSecret: session.secret);
        return user;
        break;
      case TwitterLoginStatus.cancelledByUser:
        debugPrint(result.status.toString());
        return null;
        break;
      case TwitterLoginStatus.error:
        debugPrint(result.errorMessage.toString());
        return null;
        break;
    }
    return null;
  }

  _logIn() {
    _loginWithTwitter().then((response) {
      if (response != null) {
        _user = response;
        isLogged = true;
        setState(() {});
      }
    });
  }

  // 今のページ
  int _now = 0;
  // ページリスト
  final _pageList = [
    HomePage(),
    DiaryPage(),
    CalendarPage(),
    TodoPage(),
    ProfilePage(),
    FriendsPage(),
  ];

  // 起動時に実行されるやつ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: /*isLogged ?*/ Scaffold(
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
      )/* : Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TwitterSignInButton(
              onPressed: _logIn,
            ),
          ],
        ), 
      )*/,
    );
  }
}

// main
main() {
  runApp(MyApp());
}