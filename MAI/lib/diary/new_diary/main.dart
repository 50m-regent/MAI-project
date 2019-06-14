import 'package:flutter/material.dart';
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
    return Positioned(
        top: 50,
        right: 40,
        left: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _lockIcon(iconSize: iconSize),
            postIcon(iconSize: iconSize),
          ],
        ),
      );
  }

  _imageSelectorGallery() {
      setState(() {
        _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery);
      });
    }

  Widget _selectPicture({double iconSize}){
    return Positioned(
      top: 200,
      left: 10,
      right: 10,
      child: IconButton(
        onPressed: _imageSelectorGallery,
        tooltip: "写真を追加",
        icon: Icon(
          Icons.add_a_photo,
          color: Colors.grey,
          size: iconSize * 6,
        )
      ),
    );
  }

  Widget _picture({double pictureSize}) {
    return Positioned(
      top: 175,
      left: 10,
      right: 10,
      child: FutureBuilder<File>(
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
            return Text("");
          }
        },
      ),
    );
  }

  Widget _textField() {
    return Positioned(
      top: 370,
      left: 40,
      right: 40,
      child: Container(
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
      ),
    );
  }

  Widget build(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _iconSize = _displaySize.width / 12;
    final double _pictureSize = _displaySize.height * 0.25;
    return Container(
      height: _displaySize.height * 0.8,
      width: _displaySize.width * 0.8,
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: Stack(
          children: <Widget>[ // TODO: UIをColumnに直しましょう
            _lockAndPost(iconSize: _iconSize),
            date(),
            _selectPicture(iconSize: _iconSize),
            _picture(pictureSize: _pictureSize),
            _textField(),
          ],
        ),
      ),
    ); 
  }
}