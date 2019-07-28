import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mai/constants.dart';
import 'dart:io';
import '../../main.dart';
import 'items.dart';

class NewDiaryPage extends StatefulWidget {
  @override
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiaryPage> {
  final IconData lockIconOn = Icons.lock_outline;
  final IconData lockIconOff = Icons.lock_open;

  String _text;
  bool _lockFlag = false;
  Future<File> _galleryFile;

  Widget _lockIcon() {
    Color _lockColor = MyColors.icon;
    String _lockTooltip = "公開";
    IconData _lockIcon = lockIconOff;
    if(_lockFlag){
      _lockColor = Colors.red[400];
      _lockTooltip = "非公開";
      _lockIcon = lockIconOn;
    }
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () => setState(() => _lockFlag = _lockFlag ? false : true),
        tooltip: _lockTooltip,
        icon: Icon(
          _lockIcon,
          color: _lockColor,
          size: iconSize,
        ),
      ),
    );
  }

  Widget _post(BuildContext context) => FlatButton(
    onPressed: () {
      final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('diary');
      final _date = DateFormat('MMdd').format( DateTime.now() );
      _mainReference.update({
        _date: {
          'text': _text,
          'lock': _lockFlag ? true: false,
        }
      });
      Navigator.pop(context);
    },
    child: Text(
      '投稿',
      style: MyTextStyle(color: MyColors.theme).mini,
    )
  );

  Widget _selectPicture = Icon(
    Icons.add_a_photo,
    color: MyColors.icon,
    size: iconSize * 3,
  );

  Widget _picture() => FutureBuilder<File>(
    future: _galleryFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) => FlatButton(
      onPressed: () => setState(() => _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery)),
      child: Container(
        height: displaySize.height / 4,
        child: snapshot.connectionState == ConnectionState.done && snapshot.data != null ? Image.file(
          snapshot.data,
        ) : _selectPicture,
      ),
    ),
  );

  Widget _textField() => Expanded(
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 100,
      style: TextStyle(
        fontSize: 22,
        height: 1.3,
      ),
      decoration: InputDecoration(
        hintText: "内容を入力...",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      onChanged: (text) {
        _text = text;
      },
    ),
  );

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: date(),
    titleTextStyle: MyTextStyle().normalBold,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _lockIcon(),
        _picture(),
        _textField(),
      ],
    ),
    actions: <Widget>[
      _post(context),
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}