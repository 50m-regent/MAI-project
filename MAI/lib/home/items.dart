import 'package:flutter/material.dart';
import '../constants.dart';
import 'bubble_speech.dart';

Widget notice = Align(
  alignment: Alignment.topCenter,
  child: SpeechBubble(
    color: MyColors.box,
    child: Text(
      '今日は〇〇時から\n〇〇の予定です！',
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