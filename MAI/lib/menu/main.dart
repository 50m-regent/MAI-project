import 'package:flutter/material.dart';
import 'items.dart';

// メニュー
List<BottomNavigationBarItem> buttons() {
  // 全部のアイコン配列に入れる
  return [
    home(),
    diary(),
    calendar(),
    todo(),
    profile(),
    friends(),
  ];
}