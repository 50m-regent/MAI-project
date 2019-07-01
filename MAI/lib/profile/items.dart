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
    return Positioned(
      top: 60,
      child: FutureBuilder<File>(
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
      ),
    );
  }

  Widget _name() {
    return Positioned(
      top: 100,
      left: 150,
      child: Text(
        '名前',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _birthday() {
    return Positioned(
      top: 190,
      left: 50,
      child: Row(
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
      )
    );
  }


  Widget _status() {
    return Positioned(
      top:240,
      left: 40,
      child: Column(
        children: <Widget>[
          Text(
            "一言",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '仕事中',
            style:TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sns() {
    return Positioned(
      top:70,
      right: 10,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.alternate_email,
            size: 50,
            color: Colors.blue,
          ),
          Icon(
            Icons.alternate_email,
            size: 50,
            color: Colors.purpleAccent,
          ),
        ],
      )
    );
  }

  Widget _graffiti() {
    return Positioned(
      top: 380,
      left: 40,
      child: Column(
        children: <Widget>[
          Text(
            'フリースペース',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _colorIcon(Color color) { // 色のアイコンのもと
    return FlatButton(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: (() {}), //押した処理,
    );
  }

  Widget _palette() {
    return Positioned(
      top: 450,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _colorIcon(Colors.pinkAccent),
          _colorIcon(Colors.orangeAccent),
          _colorIcon(Colors.lightGreenAccent),
          _colorIcon(Colors.lightBlueAccent),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _displaySize = MediaQuery.of(context).size;
    final double _size = _displaySize.width / 3;
    return Stack(
      children: <Widget>[
        _icon(size: _size),
        _name(),
        _birthday(),
        _status(),
        _sns(),
        _graffiti(),
        _palette(),
      ],
    );
  }
}