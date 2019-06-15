import 'package:flutter/material.dart';
import "package:flutter_calendar_carousel/flutter_calendar_carousel.dart" show CalendarCarousel;

TextStyle _textStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
}

TextStyle _textStyleWColor({Color color, double fontSize}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );
}

Widget _calendar() {
  return Expanded(
    child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CalendarCarousel(
              prevDaysTextStyle: _textStyle(17),//grayのとこ
              daysTextStyle: _textStyle(20),//月の日にち
              weekendTextStyle: _textStyleWColor(
                color: Colors.red[400],//週末は赤色
                fontSize: 20,
              ),
              todayTextStyle: _textStyle(20),//今日の記述
              todayButtonColor: MaterialColor(
                0xFF4FC3F7, // Colors.lightBlue[300];
                <int, Color>{//ColorDataに変換
                }
              ),
              nextDaysTextStyle: _textStyle(17),//次の日
              weekdayTextStyle: TextStyle(//曜日の記述
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,//boldは太字
              ),
              headerTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
              headerMargin: EdgeInsets.only(
                top: 16,
                bottom: 16,
                right: 200,
              ),
              showHeaderButton: false,
              //onDayPressed: //TODO: 日付変更
            ),
          ),
  );
}

Widget _schedule() {
  return Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Schedule",//文字おいてる
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
}

Widget calendar(BuildContext context) {//わからんこっから
  final Size _displaySize = MediaQuery.of(context).size;
  final double _margin = _displaySize.width / 12;
  return Column(
    children: <Widget>[
      SizedBox(height: _margin),
      _calendar(),
      _schedule(),
    ],
  );
}
