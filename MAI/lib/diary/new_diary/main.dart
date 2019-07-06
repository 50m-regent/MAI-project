import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mai/constants.dart';
import 'dart:io';
import 'items.dart';

class NewDiaryPage extends StatefulWidget {
  @override
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiaryPage> {
  String _diary;
  int _lockFlag = 0;
  Future<File> _galleryFile;

  _lockChange() {
    setState(() {
    _lockFlag = 1 - _lockFlag;
    });
  }

  Widget _lockIcon() {
    Color _lockColor = MyColors.darkIcon;
    String _lockTooltip = "公開";
    IconData _lockIcon = LOCK_ICON_OFF;
    if(_lockFlag == 1){
      _lockColor = Colors.red[400];
      _lockTooltip = "非公開";
      _lockIcon = LOCK_ICON_ON;
    }
    return IconButton(
      onPressed: _lockChange,
      tooltip: _lockTooltip,
      icon: Icon(
        _lockIcon,
        color: _lockColor,
        size: ICON_SIZE,
      ),
    );
  }

  Widget _postIcon() {
    return IconButton(
      onPressed: () {
        // TODO: 投稿
      },
      tooltip: "投稿",
      icon: Icon(
        Icons.library_books,
        color: MyColors.darkIcon,
        size: ICON_SIZE,
      )
    );
  }

  Widget _lockAndPost() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _lockIcon(),
            _postIcon(),
          ],
      );
  }

  _imageSelectorGallery() {
      setState(() {
        _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery);
      });
    }

  Widget _selectPicture(){
    return Icon(
      Icons.add_a_photo,
      color: MyColors.darkIcon,
      size: ICON_SIZE * 3,
    );
  }

  Widget _picture() {
    return FutureBuilder<File>(
        future: _galleryFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            return FlatButton(
              onPressed: _imageSelectorGallery,
              child: Container(
                height: DISPLAY_SIZE.height / 4,
                child: snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null ? Image.file(
                    snapshot.data,
                ) : _selectPicture(),
              ),
            );
        },
    );
  }

  Widget _textField() {
    return Expanded(
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
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("ja_JP");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        body: Container(
          padding: EdgeInsets.all(MARGIN),
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
}