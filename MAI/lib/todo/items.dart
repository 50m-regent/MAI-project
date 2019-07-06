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
    backgroundColor: MyColors.icon,
    label: Text(
      '新しいタグを作成',
      style: MyTextStyle(color: Colors.white).normalBold(),
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
  TextEditingController _titleController = TextEditingController();

  Task(this.parent, {this.tag, this.title, this.deadline, this.priority});

  Widget _title(String title) {
    _titleController.text = title;
    return Container(
      child: TextFormField(
        controller: _titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: TextStyle( //TODO: text style整理
          fontSize: 20,
        ),
        onEditingComplete: () {
          print('46: ${parent.parent._todo}');
          parent.parent._todo[tag][_titleController.text] = {'deadline': deadline, 'priority': priority};
          parent.parent._todo[tag].remove(title);
          print('49: ${parent.parent._todo}');
          parent.parent._file.writeAsStringSync(json.encode(parent.parent._todo));
          parent.parent._getJSON();
          print('52: ${parent.parent._todo}');
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
    var colors = [MyColors.box, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[priority];
    return Container(
      width: width,
      margin: EdgeInsets.only(right: margin), //TODO: padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
        boxShadow: [SHADOW],
      ),
      child: FlatButton(
        onPressed: (() {
          // print('元:${parent.parent._todo[tag][title]['priority']}');
          priority = ++priority % 4;
          parent.parent._todo[tag][title]['priority'] = priority;
          parent.parent._file.writeAsStringSync(json.encode(parent.parent._todo));
          parent.parent._getJSON();
          // print('新:${parent.parent._todo[tag][title]['priority']}');
          // TODO: そーとするとバグルお^^
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
  TextEditingController _tagController = TextEditingController();

  TaskRow({this.tasks});

  _newTask() {
    tasks[tag]['新しいタスク'] = {'deadline': 190630, 'priority': 0};
    parent._todo[tag] = tasks[tag];
    parent._file.writeAsStringSync(json.encode(parent._todo));
    parent._getJSON();
  }

  Widget _newTaskIcon(double size) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: MyColors.icon,
      ),
      onPressed: (() {
        _newTask();
      }),
      tooltip: '新しいタスク',
      iconSize: size * 2,
    );
  }

  _deleteTag() {
    print('132: ${parent._todo}');
    parent._todo.remove(tag);
    parent._file.writeAsStringSync(json.encode(parent._todo));
    parent._getJSON();
    print('136: ${parent._todo}');
  }

  Widget _deleteTagIcon(double size) {
    return IconButton(
      icon: Icon(
        Icons.remove,
        color: MyColors.icon,
      ),
      onPressed: (() {
        _deleteTag();
      }),
      tooltip: 'タグ削除',
      iconSize: size * 2,
    );
  }

  Widget _taskTag(double size) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: _tagController,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 30,
            ),
            onEditingComplete: (() {
              parent._todo[_tagController.text] = parent._todo[tag];
              parent._todo.remove(tag);
              parent._file.writeAsStringSync(json.encode(parent._todo));
              parent._getJSON();
            }),
          ),
        ),
        _newTaskIcon(size),
        _deleteTagIcon(size),
      ],
    );
  }

  Widget widget(_TodoListState parent, {double margin, double height}) {
    List<Task> _taskList = [];
    this.parent = parent;

    tasks.forEach((_k, _v) {
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

    //_taskList.sort( (b, a) => a.priority.compareTo(b.priority) );
    // TODO: ソーとするとバグルお^^

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
  File _file;
  bool _fileExists = false;
  Map<String, dynamic> _todo;

  _getJSON() {
    getApplicationDocumentsDirectory().then( (Directory _dir) {
      print(_dir.path);
      try {
        _file = File(_dir.path + '/todo_list.json');
      } catch(e) {
        print('AAAAAAAAAAAAAAAAAAAAAAAA');
        _file.createSync();
        _todo = {};
        _file.writeAsStringSync(json.encode(_todo));
      }
      
      _fileExists = _file.existsSync();
      _todo = json.decode(_file.readAsStringSync());

      setState(() {});
    });
    print('268: $_todo');
  }

  _newTag() {
    print('240: $_todo');
    _todo['新しいタグ'] = {
      "新しいタスク" : {
        "deadline": 201231,
        "priority": 0
      }
    };
    _file.writeAsStringSync(json.encode(_todo));
    _getJSON();
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
        left: margin,
        bottom: margin * 2,
      ),
      child: ListView.builder(
        itemCount: _todo.length,
        itemBuilder: (BuildContext context, int index) {
          TaskRow _row = TaskRow(tasks: _tasks[index]);
          return _row.widget(
            this,
            margin: margin / 2,
            height: rowHeight,
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
    return _fileExists && _todo.length != 0 ? _list(
      margin: _margin,
      rowHeight: _rowHeight,
    ) : Center(
      child: Text(
        'タスク完了！偉い！',
        style: TextStyle(
          fontSize: 30,
          color: MyColors.icon,
        ),
      ),
    );
  }
}