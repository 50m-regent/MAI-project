import 'package:flutter/material.dart';
import 'items.dart';

// メニュー
List<BottomNavigationBarItem> menu() {
  // 全部のアイコン配列に入れる
  return [
    home(),
    diary(),
    weather(),
    calendar(),
    todo(),
    profile(),
    friends(),
  ];
}