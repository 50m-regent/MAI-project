import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:video_player/video_player.dart';

import '../constants.dart';
import 'date.dart';
import 'items.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _videoController = VideoPlayerController.asset('assets/MAI.mp4');
  VoidCallback _listener;

  initState() {
    super.initState();
    _listener = () => mounted ? setState(() {}) : null;
    _videoController..addListener(_listener)..setVolume(0)..initialize();
    _videoController.setLooping(true);
    _videoController.play();
  }

  bool _isUIVisible = true;

  Widget _showUI() => IconButton(
    onPressed: () => setState(() {
      _isUIVisible = _isUIVisible ? false : true;
    }),
    tooltip: _isUIVisible ? 'UI非表示' : 'UI表示',
    icon: Icon(
      Icons.chat,
      color: _isUIVisible ? MyColors.icon : Colors.red[400],
      size: iconSize * 1.5,
    ),
  );

  Widget _icons() => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      height: displaySize.height / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          arMode,
          _showUI(),
        ],
      ),
    ),
  );

  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: <Widget>[
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: VideoPlayer(_videoController),
          ),
        ),
        Container(
          margin: EdgeInsets.all(margin),
          child: Stack(
            children: <Widget>[
              _isUIVisible ? notice : Container(),
              _isUIVisible ? Date() : Container(),
              _isUIVisible ? _icons() : Align(
                alignment: Alignment.bottomRight,
                child: _showUI(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}