import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../main.dart';
//import 'package:image_picker/image_picker.dart';
//TODO: あん

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _mainReference = FirebaseDatabase.instance.reference().child(user.uid).child('profile');
  Future<File> _profileImage;
  Map<dynamic, dynamic> _profile = {'name': '', 'birthday': '0101', 'message': ''};

  _getProfile() => setState(() {
    _mainReference.once().then((DataSnapshot snapshot) {
      _profile = snapshot.value;
    });
  });

  @override
  initState() {
    super.initState();
    setState(() {
      _mainReference.once().then((DataSnapshot snapshot) {
        if(snapshot.value == null) {
          _mainReference.update({
            'name': '名前',
            'birthday': '0101',
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
    color: MyColors.darkIcon,
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
        onEditingComplete: () async {
          await _mainReference.update({'name': _nameController.text});
          _getProfile();
        },
      ),
    );
  }

  Widget _status() {
    _messageController.text = _profile['message'];
    return Container(
      height: displaySize.height / 4,
      child: TextFormField(
        controller: _messageController,
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: MyTextStyle().normal,
        onEditingComplete: () {
          _mainReference.update({'message': _messageController.text});
          _getProfile();
        },
      ),
    );
  }

  Widget _colorIcon(Color color) => FlatButton(
    onPressed: (() {}), //TODO: 押した処理
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [shadow],
      ),
    ),
  );

  Widget _palette() { //TODO: なんか実装
    List<Widget> _colors = [
      _colorIcon(Colors.pinkAccent),
      _colorIcon(Colors.orangeAccent),
      _colorIcon(Colors.lightGreenAccent),
      _colorIcon(Colors.lightBlueAccent),
      _colorIcon(Colors.blueAccent),
      _colorIcon(Colors.red),
      _colorIcon(Colors.redAccent),
    ];
    return Container(
      height: displaySize.height / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'パレッチュ',
            style: MyTextStyle().bigBold,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colors.length,
              itemBuilder: (BuildContext context, int index) => _colors[index],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(margin),
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
                ],
              ),
            ],
          ),
          _status(),
          _palette(), //TODO: 自分のQRコード
        ],
      ),
    );
  }
}