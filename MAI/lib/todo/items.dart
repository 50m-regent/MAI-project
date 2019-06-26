import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'package:path_provider/path_provider.dart';

Widget newTaskIcon(BuildContext context) {
  final Size _displaySize = MediaQuery.of(context).size;
  final double _iconSize = _displaySize.width / 12;
  return FloatingActionButton(
    onPressed: () { //TODO: 新しいタスク
        
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

class Task {
  String tag, title;
  int deadline, priority;

  Task({this.tag, this.title, this.deadline, this.priority});

  Map<String, dynamic> toJson() {
    return {
      tag: {
        'title': title,
        'deadline': deadline,
        'priority': priority
      }
    };
  }

  Widget _title(String title) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(title),
          //_deadline(deadline), //TODO: 日付
        ],
      ),
    );
  }
}

class TaskRow {
  Map<String, dynamic> tasks;

  TaskRow({this.tasks});

  Widget _taskTag(String tag) {
    return Row(
      children: <Widget>[
        Text(
          tag,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ]
    );
  }

  Widget widget({double margin, double height}) {
    String _tag;
    List<Task> _taskList = [];

    tasks.forEach((_k, _v) {
      _tag = _k;
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

    return Container(
      padding: EdgeInsets.only(bottom: margin),
      height: height, 
      child: Column(
        children: <Widget>[
          _taskTag(_tag),
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
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final String _fileName = 'todo_list.json';
  bool _fileExists = false;
  Map<String, dynamic> _todo;

  _getJSON() {
    getApplicationDocumentsDirectory().then( (Directory _dir) {
      print(_dir.path);
      File _jsonFile = File(_dir.path + '/$_fileName');
      _fileExists = _jsonFile.existsSync();

      setState(() {
        if (_fileExists) {
          _todo = json.decode(_jsonFile.readAsStringSync());
        } else {
          _jsonFile.createSync();
          _fileExists = true;
          _todo = {};
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
            margin: margin / 2,
            height: rowHeight
          );
        },
      )
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
    final double _rowHeight = _displaySize.width / 2.5;
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