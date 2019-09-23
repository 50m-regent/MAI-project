import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants.dart';
import '../main.dart';
import 'items.dart';

Future<File> profileImage;
Map<dynamic, dynamic> _profile = {'name': '', 'message': ''};

final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('profile');
final _storageReference = FirebaseStorage.instance.ref().child('icons/' + user.uid + '.jpg');

getProfile() {
  _mainReference.once().then((DataSnapshot snapshot) {
    if(snapshot.value != null) {
      _profile = snapshot.value;
    }
  });
  _storageReference.getData(1000000).then((data) {
    if(data != null) {
      //profileImage = (Image.memory(data));
    }
  });
}

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController(), _messageController = TextEditingController();

  Widget _defaultIcon = Icon(
    Icons.account_circle,
    color: MyColors.icon,
    size: iconSize * 3,
  );

  Widget _icon() => FutureBuilder<File>(
    future: profileImage,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) => Container(
      height: iconSize * 4,
      width: iconSize * 4,
      child: FlatButton(
        onPressed: () => setState(() => profileImage = ImagePicker.pickImage(source: ImageSource.gallery)),
        child: snapshot.connectionState == ConnectionState.done && snapshot.data != null ? Container(
          child: CircleAvatar(
            backgroundImage: FileImage(
              snapshot.data,
            ),
          ),
        ) : _defaultIcon,
      ),
    ),
  );

  Widget _name() {
    _nameController.text = _profile['name'];
    return Container(
      width: displaySize.width / 2,
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: MyTextStyle().veryBigBold,
        onEditingComplete: () => setState(() {
          _mainReference.update({'name': _nameController.text});
          _profile['name'] = _nameController.text;
        }),
      ),
    );
  }

  Widget _status() {
    _messageController.text = _profile['message'];
    return Container(
      child: TextField(
        controller: _messageController,
        maxLength: 40,
        style: MyTextStyle().normal,
        onEditingComplete: () => setState(() {
          _mainReference.update({'message': _messageController.text});
          _profile['message'] = _messageController.text;
        }),
      ),
    );
  }

  static Widget _paletteTitle = Row(
    children: <Widget>[
      Text(
        'テーマカラー',
        style: MyTextStyle().largeBold,
      ),
    ],
  );

  static Widget _palette = Container(
    height: displaySize.height / 5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _paletteTitle,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            palette[0],
            palette[1],
            palette[2],
            palette[3],
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            palette[4],
            palette[5],
            palette[6],
            palette[7],
          ],
        ),
      ],
    ),
  );

  static final Widget _qr = Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Text(
            'My QRコード',
            style: MyTextStyle().largeBold,
          ),
        ],
      ),
      QrImage(
        data: user.uid,
        size: displaySize.height / 3,
      ),
    ],
  );
  
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(margin),
    child: ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            _icon(),
            _name(),
          ],
        ),
        _status(),
        _palette,
        Container(height: margin),
        _qr,
      ],
    ),
  );
}