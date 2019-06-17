import 'package:flutter/material.dart';
import 'package:mai/constants.dart';

Widget newTaskIcon(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _iconSize = _displaySize.width / 12;
    return FloatingActionButton(
      onPressed: () {
        
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: _iconSize,
      ),
      tooltip: "新しいタスク",
      backgroundColor: ICON_COLOR,
    );
  }

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}