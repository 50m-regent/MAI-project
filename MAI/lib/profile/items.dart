import 'dart:io';
import 'package:mai/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<File> _profileImage;

  _imageSelectorGallery() {
    setState(() {
      _profileImage = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  Widget _defaultIcon() {
    return Center(
      child: Icon(
        Icons.account_circle,
        color: ICON_COLOR,
        size: ICON_SIZE * 4,
      ),
    );
  }

  Widget _icon() {
    return FutureBuilder<File>(
        future: _profileImage,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          return Container(
            height: ICON_SIZE * 4,
            width: ICON_SIZE * 4,
            child: FlatButton(
              onPressed: _imageSelectorGallery,
              child: snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null ? Container(
                child: CircleAvatar(
                  backgroundImage: FileImage(
                    snapshot.data,
                  ),
                ),
              ) : _defaultIcon(),
            ),
          );
        },
    );
  }

  Widget _name() {
    return Text(
        '名前',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
    );
  }

  Widget _birthday() {
    return Row(
        children: <Widget>[
          Text(
            '誕生日: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '7/19',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
    );
  }

  Widget _status() {
    return Container(
      height: DISPLAY_SIZE.height / 4,
      child: TextFormField(
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'ステータスメッセージ',
          labelStyle: TextStyle(
            fontSize: 22,
          ),
        ),
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }


  Widget _colorIcon(Color color) { // 色のアイコンのもと
    return FlatButton(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(5, 5),
              blurRadius: 5,
            ),
          ],
        ),
      ),
      onPressed: (() {}), //押した処理,
    );
  }

  Widget _palette() {
    List<Widget> _colors = [
      _colorIcon(Colors.pinkAccent),
      _colorIcon(Colors.orangeAccent),
      _colorIcon(Colors.lightGreenAccent),
      _colorIcon(Colors.lightBlueAccent),
    ];
    return Container(
      height: DISPLAY_SIZE.height / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'カラー',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colors.length,
              itemBuilder: (BuildContext context, int index) {
                return _colors[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MARGIN * 2,
        bottom: MARGIN,
        left: MARGIN,
        right: MARGIN,
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            _icon(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _name(),
                _birthday(),
              ],
            ),
          ],
        ),
        _status(),
        _palette(),
      ],
    ),
    );
  }
}