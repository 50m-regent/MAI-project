// Format Verified 1

import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../main.dart';
import '../../constants.dart';
import 'constants.dart';

class NewDiaryPage extends StatefulWidget {
  @override
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiaryPage> {
  String _text;              // 文章
  bool _isLocked = false;     // 鍵かどうか
  Future<File> _imageFile; // 画像ファイル

  Widget _date() { // 日付
    final String _date = DateFormat('MM月dd日(E)', "ja_JP").format(DateTime.now());

    return Row(
      children: <Widget>[
        Text(
          _date,
          style: NewDiaryTextStyles.date,
        ),
      ],
    );
  }

  Widget _lockIcon() { // 鍵アイコン
    Color    _lockColor   = MyColors.icon;         // 色
    IconData _lockIcon    = NewDiaryIcons.lockOff; // アイコン

    if(_isLocked) { // 鍵がかかっていたら色とアイコン変更
      _lockColor = NewDiaryColors.lock;
      _lockIcon  = NewDiaryIcons.lockOn;
    }

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () => setState(() => _isLocked = _isLocked ? false : true),
          icon: Icon(
            _lockIcon,
            color: _lockColor,
            size:  iconSize,
          ),
        ),
      ],
    );
  }

  Widget _post(BuildContext context) => FlatButton( // 投稿ボタン
    onPressed: () {
      final DatabaseReference _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('diary');
      final String            _date          = DateFormat('MMdd').format( DateTime.now() );
      _mainReference.update({
        _date: {
          'text': _text,
          'lock': _isLocked ? true: false,
        }
      });
      Navigator.pop(context);
    },
    child: Text(
      '投稿',
      style: NewDiaryTextStyles.post,
    )
  );

  Widget _picture() => FutureBuilder<File>( // 写真
    future:  _imageFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) => FlatButton(
      onPressed: () {}, //() => setState(() => _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery)), //
      child: Container(
        height: displaySize.height / 4,
        child:  snapshot.connectionState == ConnectionState.done && snapshot.data != null ? Image.file(
          snapshot.data) : Icon(
            Icons.add_a_photo,
            color: MyColors.icon,
            size: iconSize * 3,
        ),
      ),
    ),
  );

  Widget _textField() => Container( // 文章
    height: displaySize.height / 3,
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 100,
      style: NewDiaryTextStyles.text,
      decoration: InputDecoration(
        hintText: "内容を入力...",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      onChanged: (text) => _text = text,
    ),
  );

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: _date(),
    titleTextStyle: MyTextStyle().normalBold,
    content: Container(
      width: displaySize.width,
      child:ListView(
        children: <Widget>[
          _lockIcon(),
          _picture(),
          _textField(),
        ],
      ),
    ),
    actions: <Widget>[
      _post(context),
    ],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}