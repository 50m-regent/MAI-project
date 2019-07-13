import 'package:flutter/material.dart';
import '../constants.dart';
import 'task_row.dart';

class Todo extends StatefulWidget {
  final state = _TodoState();

  @override
  State createState() => state;
}

class _TodoState extends State {
  Map<String, dynamic> _todo = {};

  FloatingActionButton newTagIcon() => FloatingActionButton.extended(
    onPressed: () => setState(() => _todo['新しいタグ'] = {
      "新しいタスク" : {
        "deadline": 201231,
        "priority": 0
      }
    }),
    backgroundColor: MyColors.icon,
    label: Text(
      '新しいタグを作成',
      style: MyTextStyle(color: Colors.white).normalBold(),
    ),
    icon: Icon(
      Icons.add,
      size: iconSize,
    ),
  );

  List<Map<String, dynamic>> _getTasks() {
    List<Map<String, dynamic>> tasks = [];
    _todo.forEach((_tag, _t) => tasks.add({_tag: _t}));
    return tasks;
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
        itemCount: _todo.length,
        itemBuilder: (BuildContext context, int index) => TaskRow(this, _tasks[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _todo.length == 0 ? Center(
    child: Text(
      'タスク完了！偉い！',
      style: MyTextStyle(color: MyColors.darkIcon).bigBold()
    ),
  ) : _todoList();
}