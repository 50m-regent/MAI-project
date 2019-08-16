import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo.dart';
import '../constants.dart';

class Task extends StatefulWidget {
  final String tag, title;
  final int deadline, priority;

  Task({this.tag, this.title, this.deadline, this.priority});

  @override
  State createState() => _TaskState(
    title: title,
    priority: priority,
  );
}

class _TaskState extends State<Task> {
  String title;
  int priority;

  _TaskState({this.title, this.priority});

  TextEditingController _titleController = TextEditingController();

  Widget _title() {
    _titleController.text = widget.title;
    return Container(
      child: TextFormField(
        controller: _titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: MyTextStyle().largeBold,
        onEditingComplete: () {
          todo[widget.tag][_titleController.text] = {'deadline': widget.deadline, 'priority': widget.priority};
          todo[widget.tag].remove(widget.title);
          title = _titleController.text;
          saveTodo();
        },
      ),
    );
  }

  Widget _deadline() {
    return Row(
      children: <Widget>[
        Text(
          DateFormat('M/d').format(
            DateTime.parse(widget.deadline.toString())
          ).toString(),
          style: MyTextStyle().large,
        ),
        Text(
          'まで',
          style: MyTextStyle().normal,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var colors = [MyColors.box, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[widget.priority];
    return Container(
      width: displaySize.width / 2,
      margin: EdgeInsets.only(right: margin, bottom: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: color,
          width: 3,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          priority = (widget.priority + 1) % 4;
          todo[widget.tag][widget.title]['priority'] = widget.priority;
          saveTodo();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            _deadline(),
          ],
        ),
      ),
    );
  }
}