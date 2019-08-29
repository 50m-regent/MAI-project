import 'package:flutter/material.dart';

import 'todo.dart';
import '../constants.dart';
import 'task.dart';

class TaskRow extends StatefulWidget {
  String tag;
  TaskRow(this.tag);

  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  List<Task> _taskList = [];
  TextEditingController _tagController = TextEditingController();

  initState() {
    super.initState();
    _tagController.text = widget.tag;
    todo[widget.tag].forEach((_title, _tasks) => _taskList.add(Task(widget.tag, _title)));
    _taskList.sort( (b, a) => todo[widget.tag][a.title]['priority'].compareTo(todo[widget.tag][b.title]['priority']) );
  }

  Widget _newTaskIcon() => IconButton(
    tooltip: '新しいタスク',
    iconSize: iconSize,
    icon: Icon(
      Icons.add,
      color: MyColors.icon,
    ),
    onPressed: () => setState(() {
      if(todo[widget.tag]['新しいタスク'] == null){
        _taskList.add(Task(widget.tag, '新しいタスク'));
        todo[widget.tag]['新しいタスク'] = {'deadline': 20201231, 'priority': 0};
        saveTodo();
      }
    }),
  );

  Widget _deleteTagIcon() => IconButton(
    icon: Icon(
      Icons.remove,
      color: MyColors.icon,
    ),
    tooltip: 'タグ削除',
    iconSize: iconSize,
    onPressed: () => setState(() {
      todo.remove(widget.tag);
      saveTodo();
      dispose();
    }),
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
          onEditingComplete: () => setState(() {
            todo[_tagController.text] = todo[widget.tag];
            todo.remove(widget.tag);
            widget.tag = _tagController.text;
            saveTodo();
          }),
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