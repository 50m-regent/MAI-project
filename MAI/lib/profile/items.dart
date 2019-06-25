import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _profilleImage;

  Widget _iconget() {
    return Positioned(
      top: 40,
      left: 30,
      child: IconButton(
        onPressed: _imagepicker,
        icon: Icon(
          Icons.add_circle,
          color: Colors.grey,
          size: 130,
        )
      ),
    );
  }

  Widget _imagepicker() {
    setState(() {
      _profilleImage = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  Widget _iconprint({double pictureSize}) {
    return Positioned(
      top: 50,
      left: 30,
      right: 180,
      child: FutureBuilder<File>(
        future: _profilleImage,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return FlatButton(
              onPressed: _imagepicker,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.file(
                    snapshot.data,
                    height: pictureSize,
                ),
              )
              )
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }


  Widget _name() {
    return Positioned(
      top: 100,
      left: 180,
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
            'Birthday:',
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _iconget(),
        _iconprint(),
        _name(),
        _birthday(),
        _status(),
        _sns(),
        _graffiti(),
      ],
    );
  }
}