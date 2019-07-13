import 'dart:io';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  State createState() => _ProfileState();
}

class _ProfileState extends State {
  Future<File> _profileImage;

  final _profile = {
    'name': 'りーぜんと',
    'birthday': '1118',
    'message': '最近進捗が生えすぎるﾄﾎﾎギス'
  };

  _imageSelectorGallery() => setState(() {
    _profileImage = ImagePicker.pickImage(source: ImageSource.gallery);
  });

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
        onPressed: _imageSelectorGallery,
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

  Widget _name() => Text(
    _profile['name'],
    style: MyTextStyle().veryBigBold(),
  );

  Widget _birthday() => Row(
    children: <Widget>[
      Text(
        '誕生日: ',
        style: MyTextStyle().normalBold(),
      ),
      Text(
        '${_profile['birthday'][0] + _profile['birthday'][1]}/${_profile['birthday'][2] + _profile['birthday'][3]}',
        style: MyTextStyle().normal(),
      )
    ],
  );

  Widget _status() => Container(
    height: displaySize.height / 4,
    child: TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      style: MyTextStyle().normal(),
    ),
  );

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
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
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