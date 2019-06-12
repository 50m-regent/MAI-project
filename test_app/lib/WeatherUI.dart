import "package:flutter/material.dart";
import 'package:test_app/Constants.dart';

Widget _weatherIcon(int weather) {
  var icon = <IconData>[
    Icons.wb_sunny,
    Icons.wb_cloudy,
    Icons.beach_access,
    Icons.ac_unit
  ];
  var color = <Color>[
    SUNNY_COLOR[600],
    CLOUDY_COLOR,
    RAIN_COLOR,
    SNOW_COLOR[50],
  ];
  return Icon(
    icon[weather],
    color: color[weather],
    size: 40,
  );
}

Widget _time(String time) {
  return Text(
    time,
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _temperature(int temperature) {
  return Text(
    "$temperature℃",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _rainyPercent(int percent) {
  return Text(
    "$percent%",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _date({int month, int day, int wday}) {
  var weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  return Text(
    "$month/$day (${weekdays[wday]})",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
    ),
  );
}

Widget _timeWeather({int weather, String time, int temperature, int percent}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _weatherIcon(weather),
      SizedBox(height: 5),
      _time(time),
      _temperature(temperature),
      _rainyPercent(percent),
    ],
  );
}

Widget weeklyWeather() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 40, top: 120),
        child: SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 24, bottom: 20),
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(110),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(10, 10),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          _date(
                            month: 5,
                            day: 24,
                            wday: 5
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[350].withAlpha(150),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                _timeWeather(
                                  weather: 0,
                                  time: "6:00",
                                  temperature: 25,
                                  percent: 10
                                ),
                                SizedBox(width: 15),
                                _timeWeather(
                                  weather: 2,
                                  time: "12:00",
                                  temperature: 21,
                                  percent: 80
                                ),
                                SizedBox(width: 15),
                                _timeWeather(
                                  weather: 3,
                                  time: "16:00",
                                  temperature: -30,
                                  percent: 100
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
}

Widget place() {
  return Column(
    children: <Widget>[
      
    ],
  );
}

Widget weather() {
  return Stack(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: place(),
      ),
    ],
  );
}