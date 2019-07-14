import 'package:flutter/material.dart';
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
            this,
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

  Widget _newTaskIcon() => IconButton(
    icon: Icon(
      Icons.add,
      color: MyColors.icon,
    ),
    onPressed: () => setState(() {
      widget.tasks[tag]['新しいタスク'] = {'deadline': 20201231, 'priority': 0};
      widget.todoList.todo[tag] = widget.tasks[tag];
    }),
    tooltip: '新しいタスク',
    iconSize: iconSize * 1.5,
  );

  Widget _deleteTagIcon() => IconButton(
    icon: Icon(
      Icons.remove,
      color: MyColors.icon,
    ),
    onPressed: () => setState(() => widget.todoList.todo.remove(tag)),
    tooltip: 'タグ削除',
    iconSize: iconSize * 1.5,
  );

  Widget _taskTag() => Row(
    children: <Widget>[
      Expanded(
        child: TextFormField(
          controller: _tagController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: MyTextStyle().bigBold,
          onEditingComplete: () => setState(() {
            widget.todoList._todo[_tagController.text] = widget.todoList._todo[tag];
            widget.todoList._todo.remove(tag);
          }),
        ),
      ),
      _newTaskIcon(),
      _deleteTagIcon(),
    ],
  );

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(bottom: margin),
    height: displaySize.height / 4,
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