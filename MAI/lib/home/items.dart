import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../main.dart';
import 'bubble_speech.dart';
import 'package:barcode_scan/barcode_scan.dart';

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

_scan() async {
  final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('friends');
  String _uid = await BarcodeScanner.scan();

  
}

Widget arMode = IconButton(
  onPressed: _scan, //TODO: AR MODE
  tooltip: 'ARモード',
  icon: Icon(
    Icons.camera_alt,
    color: MyColors.darkIcon,
    size: iconSize * 1.5,
  ),
);