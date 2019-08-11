import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import '../constants.dart';

class AddFriendIcon extends StatelessWidget {
  scan() async {
    //String barcode = await BarcodeScanner.scan();
    //print(barcode);
  }

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: scan,
    child: Icon(
      Icons.add,
      color: Colors.white,
      size: iconSize,
    ),
    tooltip: "フレンド追加",
  );
}