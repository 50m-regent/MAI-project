import 'package:flutter/material.dart';
import '../constants.dart';
import 'task_row.dart';
import 'package:firebase_database/firebase_database.dart';
import '../main.dart';

Map<String, dynamic> todo = {};

class Todo extends StatefulWidget {
  final state = _TodoState();

  @override
  State createState() => state;
}

class _TodoState extends State {
  final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('todo');

  FloatingActionButton newTagIcon() => FloatingActionButton.extended(
    onPressed: () => setState(() {
      todo['新しいタグ'] = {
        "新しいタスク" : {
          "deadline": 20201231,
          "priority": 0
        }
      };
      _mainReference.push().set(todo);
    }),
    backgroundColor: MyColors.icon,
    label: Text(
      '新しいタグを作成',
      style: MyTextStyle(color: Colors.white).normalBold,
    ),
    icon: Icon(
      Icons.add,
      size: iconSize,
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

  _onAdded(Event e) => setState(() => print(e.snapshot.value));

  @override
  initState() {
    super.initState();
    _mainReference.onChildAdded.listen(_onAdded);
  }

  @override
  Widget build(BuildContext context) => todo.length == 0 ? Center(
    child: Text(
      'タスク完了！偉い！',
      style: MyTextStyle(color: MyColors.darkIcon).bigBold,
    ),
  ) : _todoList();
}