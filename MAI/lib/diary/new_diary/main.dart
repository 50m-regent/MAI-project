import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mai/constants.dart';
import 'dart:io';
import 'items.dart';

class NewDiaryPage extends StatefulWidget {
  @override //TODO: ここもpopup
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiaryPage> {
  final IconData lockIconOff = Icons.lock_outline;
  final IconData lockIconOn = Icons.lock_open;

  String _diary;
  int _lockFlag = 0;
  Future<File> _galleryFile;

  Widget _lockIcon() {
    Color _lockColor = MyColors.darkIcon;
    String _lockTooltip = "公開";
    IconData _lockIcon = lockIconOff;
    if(_lockFlag == 1){
      _lockColor = Colors.red[400];
      _lockTooltip = "非公開";
      _lockIcon = lockIconOn;
    }
    return IconButton(
      onPressed: () => setState(() => _lockFlag = 1 - _lockFlag),
      tooltip: _lockTooltip,
      icon: Icon(
        _lockIcon,
        color: _lockColor,
        size: iconSize,
      ),
    );
  }

  Widget _postIcon = IconButton(
    onPressed: () {}, // TODO: 投稿
    tooltip: "投稿",
    icon: Icon(
      Icons.library_books,
      color: MyColors.darkIcon,
      size: iconSize,
    )
  );

  Widget _lockAndPost() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _lockIcon(),
      _postIcon,
    ],
  );

  Widget _selectPicture = Icon(
    Icons.add_a_photo,
    color: MyColors.darkIcon,
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
        _diary = text;
      },
    ),
  );

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("ja_JP");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: Container(
      padding: EdgeInsets.all(margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _lockAndPost(),
          date(),
          _picture(),
          _textField(),
        ],
      ),
    ),
  );
}