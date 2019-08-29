import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:barcode_scan/barcode_scan.dart';
import '../constants.dart';
import '../main.dart';

final DatabaseReference _ref = FirebaseDatabase.instance.reference().child(user.uid).child('friends');


class AddFriendIcon extends StatelessWidget {
  scan() async {
    String barcode = await BarcodeScanner.scan();
    _ref.push().set(barcode);
    print(barcode);
  }

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    backgroundColor: MyColors.theme,
    onPressed: scan,
    child: Icon(
      Icons.add,
      color: Colors.white,
      size: iconSize,
    ),
    tooltip: "フレンド追加",
  );
}