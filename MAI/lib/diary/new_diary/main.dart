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

  Widget _lockIcon({double iconSize}) {
    Color _lockColor = Colors.white;
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
        size: iconSize,
      ),
    );
  }

  Widget _lockAndPost({double iconSize}) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _lockIcon(iconSize: iconSize),
            postIcon(iconSize: iconSize),
          ],
      );
  }

  _imageSelectorGallery() {
      setState(() {
        _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery);
      });
    }

  Widget _selectPicture({double iconSize}){
    return IconButton(
        onPressed: _imageSelectorGallery,
        tooltip: "写真を追加",
        icon: Icon(
          Icons.add_a_photo,
          color: Colors.grey,
          size: iconSize * 5,
        )
    );
  }

  Widget _picture({double pictureSize}) {
    return FutureBuilder<File>(
        future: _galleryFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return FlatButton(
              onPressed: _imageSelectorGallery,
              child: Image.file(
                snapshot.data,
                height: pictureSize,
              ),
            );
          } else {
            return Container();
          }
        },
    );
  }

  Widget _textField() {
    return Container(
        height: 470,
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
    final Size _displaySize = MediaQuery.of(context).size;
    final double _iconSize = _displaySize.width / 12;
    final double _pictureSize = _displaySize.height * 0.25;
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Column(
          children: <Widget>[
            _lockAndPost(iconSize: _iconSize),
            date(),
            _selectPicture(iconSize: _iconSize),
            _picture(pictureSize: _pictureSize),
            _textField(),
          ],
        ),
    ); 
  }
}