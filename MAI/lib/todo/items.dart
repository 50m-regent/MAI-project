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

  Widget _title(String title) {
    return Container(
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
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

  Widget _task(Task task) {
    var colors = [Colors.grey, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[task.priority];
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(task.title),
          _deadline(task.deadline),
        ],
      ),
    );
  }

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

   List<Map<String, dynamic>> _getTasks() {
    List<Map<String, dynamic>> tasks = [];
    _todo.forEach((_tag, _t) {
      tasks.add({_tag: _t});
    });
    return tasks;
  }

  Widget _row(Map<String, dynamic> tasks) {
    String tag;
    List<Task> taskList = [];

    tasks.forEach((_tag, _v) {
      tag = _tag;
      _v.forEach((_title, _t) {
        taskList.add(
          Task(
            tag: _tag,
            title: _title,
            deadline: _t['deadline'],
            priority: _t['priority'],
          )
        );
      });
    });

    taskList.sort( (a, b) => a.priority.compareTo(b.priority) );

    return Container(
      padding: EdgeInsets.only(top: 16),
      height: 200,
      child: Column(
        children: <Widget>[
          _taskTag(tag),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return _task(taskList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _list() {
    List<Map<String, dynamic>> _tasks = _getTasks();
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30),
      child: ListView.builder(
        itemCount: _todo.length,
        itemBuilder: (BuildContext context, int index) {
          return _row(_tasks[index]);
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
    return _fileExists ? _list() : Center( //TODO: UI調節
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