import 'package:flutter/material.dart';
import 'items.dart';

// todoリスト
class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Widget _body = TodoList();
    return Scaffold(
      body: _body,
      floatingActionButton: newTagIcon(context, _body),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}