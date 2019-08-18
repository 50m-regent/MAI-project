import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'todo.dart';
import '../constants.dart';

class Task extends StatefulWidget {
  final String tag;
  String title;

  Task(this.tag, this.title);

  @override
  State createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController _titleController = TextEditingController();

  initState() {
    super.initState();
    _titleController.text = widget.title;
  }

  Widget _title() => Container(
    child: TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      style: MyTextStyle().largeBold,
      onEditingComplete: () => setState(() {
        todo[widget.tag][_titleController.text] = todo[widget.tag][widget.title];
        todo[widget.tag].remove(widget.title);
        widget.title = _titleController.text;
        saveTodo();
      }),
    ),
  );

  Widget _deadline() => Row(
    children: <Widget>[
      Text(
        DateFormat('M/d').format(
          DateTime.parse(todo[widget.tag][widget.title]['deadline'].toString())
        ).toString(),
        style: MyTextStyle().large,
      ),
      Text(
        'まで',
        style: MyTextStyle().normal,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [MyColors.box, Colors.yellow, Colors.orange, Colors.red];
    final Color color = colors[todo[widget.tag][widget.title]['priority']];
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
        onPressed: () => setState(() {
          todo[widget.tag][widget.title]['priority'] = (todo[widget.tag][widget.title]['priority'] + 1) % 4;
          saveTodo();
        }),
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