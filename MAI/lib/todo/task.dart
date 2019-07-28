import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo.dart';
import '../constants.dart';

class Task extends StatefulWidget {
  String tag, title;
  int deadline, priority;

  Task({this.tag, this.title, this.deadline, this.priority});

  @override
  State createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController _titleController = TextEditingController();

  _getList() => setState(() {
    mainReference.once().then((DataSnapshot snapshot) {
      todo = snapshot.value;
    });
  });

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
          mainReference.child(widget.tag).child(_titleController.text).update({'deadline': widget.deadline, 'priority': widget.priority});
          mainReference.child(widget.tag).child(widget.title).remove();
          widget.title = _titleController.text;
          _getList();
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
        color: color,
      ),
      child: FlatButton(
        onPressed: () {
          widget.priority = (widget.priority + 1) % 4;
          mainReference.child(widget.tag).child(widget.title).child('priority').set(widget.priority);
          _getList();
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