import 'package:flutter/material.dart';
import '../constants.dart';
import 'bubble_speech.dart';

Widget scheduleNotice = Align(
  alignment: Alignment.topCenter,
  child: SpeechBubble(
    color: MyColors.box,
    child: Text(
      '今日は〇〇時から\n〇〇の予定です！',
      style: MyTextStyle().normalBold,
    ),
  ),
);

Widget diaryNotice = Align(
  alignment: Alignment(-1, 0.4),
  child: SpeechBubble(
    nipLocation: NipLocation.RIGHT,
    color: MyColors.box,
    child: Text(
      '今日の日記を\n書いてみよう！',
      style: MyTextStyle().normalBold,
    ),
  ),
);

Widget todoNotice = Align(
  alignment: Alignment(1, 0.4),
  child: SpeechBubble(
    nipLocation: NipLocation.LEFT,
    color: MyColors.box,
    child: Text(
      '〇〇をしよう！',
      style: MyTextStyle().normalBold,
    ),
  ),
);

Widget arMode = IconButton(
  onPressed: (() {}), //TODO: AR MODE
  tooltip: 'ARモード',
  icon: Icon(
    Icons.camera_alt,
    color: MyColors.darkIcon,
    size: iconSize * 1.5,
  ),
);