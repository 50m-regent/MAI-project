import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../constants.dart';
import 'task_row.dart';

Map<dynamic, dynamic> todo = {};

getTodo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String tmp = prefs.getString('todo');
  if(tmp != null){
    todo = json.decode(tmp);
  }
}

saveTodo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('todo', json.encode(todo));
}

class Todo extends StatefulWidget {
  final _TodoState state = _TodoState();

  @override
  _TodoState createState() => state;
}

class _TodoState extends State<Todo> {
  _TodoState() {
    getTodo();
  }

  FloatingActionButton newTagIcon() => FloatingActionButton(
    onPressed: () => setState(() {
      todo['新しいタスク'] = {
        'deadline': 20201231,
        'priority': 0,
      };
      saveTodo();
    }),
    backgroundColor: MyColors.theme,
    child: Icon(
      Icons.add,
      size: iconSize,
      color: Colors.white,
    ),
  );

  List<Map<String, dynamic>> _getTasks() {
    List<Map<String, dynamic>> _tasks = [];
    todo.forEach((_tag, _t) => _tasks.add({_tag: _t}));
    return _tasks;
  }

  Widget _todoList() {
    List<Map<String, dynamic>> _tasks = _getTasks();
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        top: margin,
        right: margin,
        left: margin,
        bottom: margin * 2,
      ),
      child: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) => TaskRow(this, _tasks[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => todo.length == 0 ? Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'タスクは消化済みです！',
          style: MyTextStyle(color: MyColors.icon).bigBold,
        ),
      ],
    ),
  ) : _todoList();
}