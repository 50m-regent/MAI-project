import 'package:flutter/material.dart';
import 'items.dart';

// todoリスト
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: newTaskIcon(context),
      body: TodoList(),
    );
  }
}