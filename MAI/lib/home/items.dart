import 'package:flutter/material.dart';
import 'package:mai/constants.dart';
import 'bubble_speech.dart';
import 'date.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isUIVisible = true;

  Widget _scheduleNotice = Align(
    alignment: Alignment.topCenter,
    child: SpeechBubble(
      color: MyColors.box,
      child: Text(
        '今日は〇〇時から\n〇〇の予定です！',
        style: MyTextStyle().normalBold(),
      ),
    ),
  );
  Widget _diaryNotice = Align(
    alignment: Alignment(-1, 0.4),
    child: SpeechBubble(
      nipLocation: NipLocation.RIGHT,
      color: MyColors.box,
      child: Text(
        '今日の日記を\n書いてみよう！',
        style: MyTextStyle().normalBold(),
      ),
    ),
  );
  Widget _todoNotice = Align(
    alignment: Alignment(1, 0.4),
    child: SpeechBubble(
      nipLocation: NipLocation.LEFT,
      color: MyColors.box,
      child: Text(
        '〇〇をしよう！',
        style: MyTextStyle().normalBold(),
      ),
    ),
  );
  Widget _arMode = IconButton(
    onPressed: (() {}), //TODO: AR MODE
    icon: Icon(
      Icons.camera_alt,
      color: MyColors.darkIcon,
      size: ICON_SIZE * 1.5,
    ),
  );

  _switchUI() {
    setState(() {
      _isUIVisible = _isUIVisible ? false : true;
    });
  }

  Widget _showUI() => IconButton(
    onPressed: _switchUI, //TODO: UIチラ見せ
    icon: Icon(
      Icons.chat,
      color: _isUIVisible ? MyColors.darkIcon : Colors.red[400],
      size: ICON_SIZE * 1.5,
    ),
  );

  Widget _maiTemp = Align(
    alignment: Alignment(0, -0.3),
    child: Text(
      'MAIさん(仮)',
      style: MyTextStyle(color: Colors.white). bigBold(),
    ),
  );

  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      child: Container(
        margin: EdgeInsets.all(MARGIN),
        child: Stack(
          children: <Widget>[
            _scheduleNotice,
            _diaryNotice,
            _todoNotice,
            Date(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: DISPLAY_SIZE.height / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _arMode,
                    _showUI(),
                  ],
                ),
              ),
            ),

            _maiTemp,
          ],
        ),
      ),
    );
  }
}