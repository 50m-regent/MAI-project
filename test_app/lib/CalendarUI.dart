import "package:flutter/material.dart";
import "package:flutter_calendar_carousel/flutter_calendar_carousel.dart" show CalendarCarousel;
import "package:intl/intl.dart";

class Event {
  var date, title, time;
}

class EventList {
  Map<String, List<Event>> list;
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  EventList eventlist;
  //var pressed = int.parse( DateFormat('yyyyMMdd', "ja_JP").format( DateTime.now() ) );

  void _changeDay(DateTime datetime, List<dynamic> list) {
    setState(() {
      //pressed = int.parse( DateFormat('yyyyMMdd', "ja_JP").format(datetime) );
    });
  }

  Widget _calendar() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 50,
      ),
      child: CalendarCarousel<Event>(
        prevDaysTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        daysTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.red[400],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        todayTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        todayButtonColor: MaterialColor(
          0xFF4FC3F7, // Colors.lightBlue[300];
          <int, Color>{
          }
        ),
        nextDaysTextStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
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
        onDayPressed: _changeDay,
      ),
    ); 
  }

  Widget _schedule() {
    return Padding(
      padding: EdgeInsets.only(
        top: 470,
        left: 20,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 23,
            ),
            child: Text(
              "Schedule",
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _calendar(),
        _schedule(),
      ],
    );
  }
}