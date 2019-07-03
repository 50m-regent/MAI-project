import 'dart:io';
import 'package:mai/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _profileImage;

  _imageSelectorGallery() {
    setState(() {
      _profileImage = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  Widget _defaultIcon({double size}) {
    return Icon(
      Icons.account_circle,
      color: ICON_COLOR,
      size: size,
    );
  }

  Widget _icon({double size}) {
    return FutureBuilder<File>(
        future: _profileImage,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          return FlatButton(
            onPressed: _imageSelectorGallery,
            child: Container(
              height: size,
              width: size,
              child: snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null ? Container(
                child: CircleAvatar(
                  backgroundImage: FileImage(
                    snapshot.data,
                  ),
                ),
              ) : _defaultIcon(size: size),
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
            '誕生日:',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '7/19',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
    );
  }

  Widget _status() {
    return Container(
        child: Column(
        children: <Widget>[
          Text(
            "一言",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          /*Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),*/
        ],
      ),
    );
  }


  Widget _graffiti() {
    return Column(
        children: <Widget>[
          Text(
            'フリースペース',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
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
        ),
      ),
      onPressed: (() {}), //押した処理,
    );
  }

  Widget _palette() {
    return Column(
      children:[
        Text(
          'パレット',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _colorIcon(Colors.pinkAccent),
            _colorIcon(Colors.orangeAccent),
            _colorIcon(Colors.lightGreenAccent),
            _colorIcon(Colors.lightBlueAccent),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _margin = _displaySize.width / 12;
    final double _size = _displaySize.width / 3;
    return Container(
      margin: EdgeInsets.all(_margin),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _icon(size: _size,),
                _name(),
              ],
            ),
            _birthday(),
          ],
        ),
        _status(),
        _palette(),
      ],
    ),
    );
  }
}