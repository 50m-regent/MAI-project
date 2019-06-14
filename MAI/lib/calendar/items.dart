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
              prevDaysTextStyle: _textStyle(17),
              daysTextStyle: _textStyle(20),
              weekendTextStyle: _textStyleWColor(
                color: Colors.red[400],
                fontSize: 20,
              ),
              todayTextStyle: _textStyle(20),
              todayButtonColor: MaterialColor(
                0xFF4FC3F7, // Colors.lightBlue[300];
                <int, Color>{
                }
              ),
              nextDaysTextStyle: _textStyle(17),
              weekdayTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
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
                "Schedule",
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

Widget calendar(BuildContext context) {
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
