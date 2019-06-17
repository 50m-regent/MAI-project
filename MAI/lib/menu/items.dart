import 'package:flutter/material.dart';
import 'package:mai/constants.dart';

// 下のメニューのアイコンのテンプレ
BottomNavigationBarItem _iconTemplate({
    IconData icon, // アイコン
    String title, // タイトル
    Color color, // 選択時の色
  }) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      color: ICON_COLOR,
    ), // アイコン
    activeIcon: Icon(
      icon,
      color: color,
    ), // 選択時のアイコン
    title: Text(
      title,
      style: TextStyle(
        color: ICON_COLOR,
      ),
    ), // 下の文字
  );
}

// ホーム
BottomNavigationBarItem home() {
  return _iconTemplate(
    icon: Icons.home,
    title: 'Home',
    color: Colors.orange,
  );
}

// 日記
BottomNavigationBarItem diary() {
  return _iconTemplate(
    icon: Icons.book,
    title: 'Diary',
    color: MaterialColor(
      0xFFF48FB1,
      <int, Color>{}
    ), // Colors.pink[200]
  );
}

// カレンダー
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

// とぅどぅ
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

// プロフィール
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

// フレンド
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