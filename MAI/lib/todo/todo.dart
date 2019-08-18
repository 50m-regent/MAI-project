import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../constants.dart';
import 'task_row.dart';

Map<String, dynamic> todo = {};
List<String> _tagList = [];

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
  getTodo();
}

class Todo extends StatefulWidget {
  final _TodoState state = _TodoState();

  _TodoState createState() => state;
}

class _TodoState extends State<Todo> {
  initState() {
    super.initState();
    getTodo();
  }

  FloatingActionButton newTagIcon() => FloatingActionButton(
    onPressed: () => setState(() {
      todo['新しいタグ'] = {
        '新しいタスク': {
          'deadline': 20201231,
          'priority': 0,
        }
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

  Widget _todoList() {
    _tagList = [];
    todo.forEach((_tag, _tasks) => _tagList.add(_tag));

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        top: margin,
        right: margin,
        left: margin,
        bottom: margin * 2,
      ),
      child: ListView.builder(
        itemCount: _tagList.length,
        itemBuilder: (BuildContext context, int index) => TaskRow(_tagList[index]),
      ),
    );
  }

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