import 'package:flutter/material.dart';
import 'todo.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo _todo = Todo();
    return Scaffold(
      body: _todo,
      floatingActionButton: _todo.state.newTagIcon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}