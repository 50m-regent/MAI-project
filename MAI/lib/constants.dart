import 'package:flutter/material.dart';

Size DISPLAY_SIZE;
double ICON_SIZE;
double MARGIN;

// 背景色 TODO: ARと背景切り替え可能かな
const Color BACKGROUND_COLOR = MaterialColor(
  0xFFE0F7FA,
  <int, Color>{},
); // Colors.cyan[50]
// アイコンの色
const Color ICON_COLOR = Colors.grey;

// 鍵アイコン
const IconData LOCK_ICON_ON = Icons.lock_outline;
const IconData LOCK_ICON_OFF = Icons.lock_open;