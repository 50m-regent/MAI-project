import 'package:flutter/material.dart';
import '../constants.dart';

class Task extends StatefulWidget {
  final taskRow;
  String tag, title;
  int deadline, priority;

  Task(this.taskRow, {this.tag, this.title, this.deadline, this.priority});

  @override
  State createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController _titleController = TextEditingController();

  Widget _title() {
    _titleController.text = widget.title;
    return Container(
      child: TextFormField(
        controller: _titleController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 20,
        ),
        onEditingComplete: () {
          widget.taskRow.widget.todoList._todo[widget.tag][_titleController.text] = {'deadline': widget.deadline, 'priority': widget.priority};
          widget.taskRow.widget.todoList._todo[widget.tag].remove(widget.title);
        },
      ),
    );
  }

  Widget _deadline() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        widget.deadline.toString(),
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var colors = [MyColors.box, Colors.yellow, Colors.orange, Colors.red];
    var color = colors[widget.priority];
    return Container(
      width: displaySize.width / 3,
      margin: EdgeInsets.only(right: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
        boxShadow: [shadow],
      ),
      child: FlatButton(
        onPressed: () => setState(() {
          widget.priority = (widget.priority + 1) % 4;
          widget.taskRow.widget.todoList._todo[widget.tag][widget.title]['priority'] = widget.priority;
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            //_deadline(),
          ],
        ),
      ),
    );
  }
}