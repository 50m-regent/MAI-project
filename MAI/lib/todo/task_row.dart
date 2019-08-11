import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'todo.dart';
import '../constants.dart';
import 'task.dart';

class TaskRow extends StatefulWidget {
  final todoList;
  final tasks;
  TaskRow(this.todoList, this.tasks);

  @override
  State createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  String tag;
  List<Task> _taskList = [];
  TextEditingController _tagController = TextEditingController();

  @override
  initState() {
    super.initState();
    widget.tasks.forEach((_k, _v) {
      tag = _k;
      _tagController.text = tag;
      _v.forEach((_title, _t) {
        _taskList.add(
          Task(
            tag: _k,
            title: _title,
            deadline: _t['deadline'],
            priority: _t['priority'],
          )
        );
      });
    });
    _taskList.sort( (b, a) => a.priority.compareTo(b.priority) );
  }

  _getList() => setState(() {
    mainReference.once().then((DataSnapshot snapshot) {
      todo = snapshot.value;
    });
  });

  Widget _newTaskIcon() => IconButton(
    tooltip: '新しいタスク',
    iconSize: iconSize,
    icon: Icon(
      Icons.add,
      color: MyColors.icon,
    ),
    onPressed: () {
      _taskList.add(
        Task(
          tag: tag,
          title: '新しいタスク',
          deadline: 20201231,
          priority: 0,
        )
      );
      mainReference.child(tag).child('新しいタスク').update({'deadline': 20201231, 'priority': 0});
      _getList();
    },
  );

  Widget _deleteTagIcon() => IconButton(
    icon: Icon(
      Icons.remove,
      color: MyColors.icon,
    ),
    tooltip: 'タグ削除',
    iconSize: iconSize,
    onPressed: () {
      mainReference.child(tag).remove();
      _getList();
    },
  );

  Widget _taskTag() => Row(
    children: <Widget>[
      Container(
        width: displaySize.width / 2,
        child: TextFormField(
          controller: _tagController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: MyTextStyle().bigBold,
          onEditingComplete: () {
            mainReference.child(tag).child(_tagController.text).update(todo[tag]);
            mainReference.child(tag).remove();
            tag = _tagController.text;
            _getList();
          },
        ),
      ),
      _newTaskIcon(),
      _deleteTagIcon(),
    ],
  );

  @override
  Widget build(BuildContext context) => Container(
    height: 200,
    child: Column(
      children: <Widget>[
        _taskTag(),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _taskList.length,
            itemBuilder: (BuildContext context, int index) => _taskList[index],
          ),
        ),
      ],
    ),
  );
}