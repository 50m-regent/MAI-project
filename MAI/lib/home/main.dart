import 'package:flutter/material.dart';

import '../constants.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;
    margin = displaySize.width / 12;
    iconSize = displaySize.width / 12;
    return Home();
  }
}