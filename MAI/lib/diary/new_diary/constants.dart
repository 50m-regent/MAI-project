// Format Verified 1

import 'package:flutter/material.dart';

import '../../constants.dart';

class NewDiaryTextStyles {                                              // 日記作成ページのTextStyle
  static TextStyle get date => MyTextStyle().bigBold;                   // 日付
  static TextStyle get post => MyTextStyle(color: MyColors.theme).mini; // 投稿
  static TextStyle get text => MyTextStyle().normal;                    // 文章
}

class NewDiaryIcons {                                // 日記作成ページのアイコン
  static IconData get lockOn  => Icons.lock_outline; // 鍵あり
  static IconData get lockOff => Icons.lock_open;    // 鍵なし
}

class NewDiaryColors {
  static Color get lock => Colors.red[400]; // 鍵色
}

const double borderRadius = 20;