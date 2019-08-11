import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:image_picker/image_picker.dart';
//TODO: あん

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('profile');
  Future<File> _profileImage;
  Map<dynamic, dynamic> _profile = {'name': '', 'message': ''};

  _getProfile() => setState(() {
    _mainReference.once().then((DataSnapshot snapshot) {
      _profile = snapshot.value;
    });
  });

  @override
  initState() {
    super.initState();
    _mainReference.once().then((DataSnapshot snapshot) {
      setState(() {
        if(snapshot.value == null) {
          _mainReference.update({
            'name': '名前',
            'message': ''
          });
        }
        _getProfile();
      });
    });
  }

  TextEditingController _nameController = TextEditingController(), _messageController = TextEditingController();

  Widget _defaultIcon = Icon(
    Icons.account_circle,
    color: MyColors.icon,
    size: iconSize * 3,
  );

  Widget _icon() => FutureBuilder<File>(
    future: _profileImage,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) => Container(
      height: iconSize * 4,
      width: iconSize * 4,
      child: FlatButton(
        //onPressed: () => setState(() => _profileImage = ImagePicker.pickImage(source: ImageSource.gallery)),
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
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        style: MyTextStyle().veryBigBold,
        onEditingComplete: () => setState(() {
          _mainReference.update({'name': _nameController.text});
          _getProfile();
        }),
      ),
    );
  }

  Widget _status() {
    _messageController.text = _profile['message'];
    return Container(
      child: TextFormField(
        controller: _messageController,
        maxLines: 2,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: MyTextStyle().normal,
        onEditingComplete: () => setState(() {
          _mainReference.update({'message': _messageController.text});
          _getProfile();
        }),
      ),
    );
  }

  Widget _qrCode() {
    final _qrCode = QrImage(
      data: user.uid,
      size: displaySize.width * 0.7,
    );
    final _title = Text(
      'MAI QRコード',
      style: MyTextStyle(color: MyColors.icon).bigBold,
    );
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _title,
          ],
        ),
        _qrCode,
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _icon(),
              _name(),
            ],
          ),
          _status(),
          _qrCode(),
        ],
      ),
    );
  }
}