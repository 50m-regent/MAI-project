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

class _Task {
  String tag, title;
  int deadline, priority;

  _Task({this.tag, this.title, this.deadline, this.priority});

  Map<String, dynamic> toJson() {
    return {
      tag: {
        'title': title,
        'deadline': deadline,
        'priority': priority
      }
    };
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  File _jsonFile;
  String _path;
  final String _fileName = 'todo_list.json';
  bool _fileExists = false;
  Map<String, dynamic> _todo;

  _getJSON() {
    getApplicationDocumentsDirectory().then( (Directory _dir) {
      _path = _dir.path;
      _jsonFile = File('$_path/$_fileName');
      _fileExists = _jsonFile.existsSync();
      if (_fileExists) {
        setState(() {
          _todo = json.decode(_jsonFile.readAsStringSync());
        });
      } else {
        setState(() {
          _jsonFile.createSync();
          _fileExists = true;
          _todo = {};
        });
      }
    });
  }

  @override
  initState() {
    super.initState();
    _getJSON();
  }

  List<_Task> _getTasks() {
    List<_Task> _tasks = [];
    _todo.forEach((_tag, _t) {
      _t.forEach((_title, _v) {
        _tasks.add(_Task(
          tag: _tag,
          title: _title,
          deadline: _v['deadline'],
          priority: _v['priority'],
        ));
      });
    });
    return _tasks;
  }

  Widget _title(String title) {
    return Positioned(
            left: 20,
            top: 40,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
  }

  Widget _tag(String tag) {
    return Positioned(
            left: 10,
            top: 10,
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          );
  }

  Widget _deadline(int deadline) {
    return Positioned(
            left: 200,
            top: 50,
            child: Text(
              deadline.toString(),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          );
  }

  Widget _task(_Task task) {
    var colors = [Colors.grey, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[task.priority];
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: color,
      ),
      child: Stack(
        children: <Widget>[
          _title(task.title),
          _tag(task.tag),
          _deadline(task.deadline),
        ],
      ),
    );
  }

  Widget _list() {
    List<_Task> _tasks = _getTasks();
    
    return _fileExists ? Container(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (BuildContext context, int index) {
          if(_fileExists) {
            return _task(_tasks[index]);
          }
        },
      )
    ) : Center(
      child: Text(
        'タスク完了！偉い！',
        style: TextStyle(
          fontSize: 30,
          color: ICON_COLOR,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _list(),
    );
  }
}