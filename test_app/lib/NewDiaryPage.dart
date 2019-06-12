import 'dart:io';
import "package:flutter/material.dart";
import "Constants.dart";
import "MenuUI.dart";
import "Settings.dart";
import "package:intl/intl.dart";
import "package:image_picker/image_picker.dart";

class NewDiaryPage extends StatefulWidget {
  @override
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiaryPage> {
  var _diary;
  Future<File> _galleryFile;

  _lockChange() {
    setState(() {
    lockFlag = 1 - lockFlag;
    });
  }

  Widget _lockIcon() {
    var _lockColor = Colors.white;
    var _lockTooltip = "公開";
    var _lockIcon = LOCK_ICON_OFF;
    if(lockFlag == 1){
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
        color: Colors.white,
        size: ICON_SIZE,
      )
    );
  }

  Widget _lockAndPost() {
    return uiDirection == 0 ? Positioned(
        top: 50,
        right: 40,
        left: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _lockIcon(),
            _postIcon(),
          ],
        ),
      ) : Positioned(
        top: 50,
        right: 40,
        left: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _postIcon(),
            _lockIcon(),
          ],
        ),
      );
  }

  Widget _date() {
    var date = DateFormat('MM月dd日(E)', "en_US").format( DateTime.now() );
    return Positioned(
      top: 120,
      left: 43,
      child: Text(
        date,
        style: TextStyle(
          color: Colors.black,
          fontSize: 29,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _imageSelectorGallery() {
      setState(() {
        _galleryFile = ImagePicker.pickImage(source: ImageSource.gallery);
      });
    }

  Widget _selectPicture(){
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
          size: 120,
        )
      ),
    );
  }

  Widget _picture() {
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
                height: 200,
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
    return uiDirection == 0 ? Scaffold(
      endDrawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          _lockAndPost(),
          _date(),
          _selectPicture(),
          _picture(),
          _textField(),
        ],
      ),
    ) : Scaffold(
      drawer: Drawer(
        child: menu(context),
      ),
      backgroundColor: BACKGROUND_COLOR[200],
      body: Stack(
        children: <Widget>[
          _lockAndPost(),
          _date(),
          _selectPicture(),
          _picture(),
          _textField(),
        ],
      ),
    );
  }
}