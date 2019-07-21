import 'package:flutter/material.dart'; //TODO: import確認
import '../constants.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;
    margin = displaySize.width / 12;
    iconSize = displaySize.width / 12;
    return Home();
  }
}