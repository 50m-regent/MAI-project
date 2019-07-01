import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'package:path_provider/path_provider.dart';

Widget newTagIcon(BuildContext context, TodoList parent) {
  final Size _displaySize = MediaQuery.of(context).size;
  final double _iconSize = _displaySize.width / 12;
  return FloatingActionButton.extended(
    onPressed: parent._state._newTag,
    backgroundColor: ICON_COLOR,
    label: Text(
      '新しいタグを作成',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
    icon: Icon(
      Icons.add,
      size: _iconSize,
    ),
  );
}

class Task {
  TaskRow parent;
  String tag, title;
  int deadline, priority;

  Task(this.parent, {this.tag, this.title, this.deadline, this.priority});

  Widget _title(String title) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
        ),
        onChanged: (text) {
          parent.parent._todo[parent.tag][text] = {'deadline': deadline, 'priority': priority};
          parent.parent._todo[parent.tag].remove(title);
          parent.parent._file.writeAsStringSync(json.encode(parent.parent._todo));
          title = text;
        },
      ),
    );
  }

  Widget _deadline(int deadline) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        deadline.toString(),
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

  Widget widget({double margin, double width}) {
    var colors = [Colors.grey, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[priority];
    return Container(
      width: width,
      margin: EdgeInsets.only(right: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: color,
      ),
      child: FlatButton(
        onPressed: (() {
          parent.parent._todo[tag][title]['priority'] = ++priority % 4;
          parent.parent.setState(() {});
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(title),
            //_deadline(deadline), //TODO: 日付
          ],
        ),
      ),
    );
  }
}

class TaskRow {
  _TodoListState parent;
  Map<String, dynamic> tasks;
  String tag;

  TaskRow({this.tasks});

  _newTask() {
    tasks[tag]['新しいタスク'] = {'deadline': 190630, 'priority': 0};
    parent._todo[tag] = tasks[tag];
    parent.setState(() {});
    parent._file.writeAsStringSync(json.encode(parent._todo));
  }

  Widget _newTaskIcon(double size) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: ICON_COLOR,
      ),
      onPressed: (() {
        _newTask();
      }),
      tooltip: "新しいタスク",
      iconSize: size * 2,
    );
  }

  Widget _taskTag(double size) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: tag,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextStyle(
              fontSize: 30,
            ),
            onChanged: ((text) {
              parent._todo[text] = parent._todo[tag];
              parent._todo.remove(tag);
              parent._file.writeAsStringSync(json.encode(parent._todo));
              tag = text;
            }),
          ),
        ),
        _newTaskIcon(size),
      ],
    );
  }

  Widget widget(_TodoListState parent, {double margin, double height}) {
    List<Task> _taskList = [];
    this.parent = parent;

    tasks.forEach((_k, _v) {
      tag = _k;
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

    return Container(
      padding: EdgeInsets.only(bottom: margin),
      height: height, 
      child: Column(
        children: <Widget>[
          _taskTag(margin),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return _taskList[index].widget(
                  margin: margin,
                  width: height
                );
              },
            ),
          ),
        ],
      ),
    );
  } 
}

class TodoList extends StatefulWidget {
  final _TodoListState _state = _TodoListState();

  @override
  _TodoListState createState() => _state;
}

class _TodoListState extends State<TodoList> {
  final String _fileName = 'todo_list.json';
  File _file;
  bool _fileExists = false;
  Map<String, dynamic> _todo;

  _newTag() {
    _todo['新しいタグ'] = {
      "新しいタスク" : {
        "deadline": 201231,
        "priority": 0
      }
    };
    _file.writeAsStringSync(json.encode(_todo));
    setState(() {});
  }

  _getJSON() {
    getApplicationDocumentsDirectory().then( (Directory _dir) {
      print(_dir.path);
      _file = File(_dir.path + '/$_fileName');
      _fileExists = _file.existsSync();

      setState(() {
        if (_fileExists) {
          _todo = json.decode(_file.readAsStringSync());
        } else {
          _file.createSync();
          _fileExists = true;
          _todo = {};
          _newTag();
        }
      });
    });
  }

  List<Map<String, dynamic>> _getTasks() {
    List<Map<String, dynamic>> tasks = [];
    _todo.forEach((_tag, _t) {
      tasks.add({_tag: _t});
    });
    return tasks;
  }

  Widget _list({double margin, double rowHeight}) {
    List<Map<String, dynamic>> _tasks = _getTasks();
    return Container(
      padding: EdgeInsets.only(
        top: margin,
        right: margin,
        left: margin
      ),
      child: ListView.builder(
        itemCount: _todo.length,
        itemBuilder: (BuildContext context, int index) {
          TaskRow _row = TaskRow(tasks: _tasks[index]);
          return _row.widget(
            this,
            margin: margin / 2,
            height: rowHeight
          );
        },
      ),
    );
  }

  @override
  void initState() {
    _getJSON();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _margin = _displaySize.width / 12;
    final double _rowHeight = _displaySize.width / 2.3;
    return _fileExists ? _list(
      margin: _margin,
      rowHeight: _rowHeight,
    ) : Center( //TODO: UI調節
      child: Text(
        'タスク完了！偉い！',
        style: TextStyle(
          fontSize: 30,
          color: ICON_COLOR,
        ),
      ),
    );
  }
}