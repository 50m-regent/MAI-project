import 'package:flutter/material.dart';

import '../constants.dart';
import 'todo.dart';

class TodoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Todo _todo = Todo();
    return Scaffold(
      backgroundColor: MyColors.background,
      body: _todo,
      floatingActionButton: Column(
        children: <Widget>[
          Container(height: margin, width: 0),
          _todo.state.newTagIcon(),
        ],
      ),
    );
  }
}