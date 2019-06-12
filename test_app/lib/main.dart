import "package:flutter/material.dart";
import "HomePage.dart";
import "DiaryPage.dart";
import "NewDiaryPage.dart";
import "WeatherPage.dart";
import "CalendarPage.dart";
import "TodoPage.dart";
import "ProfilePage.dart";
import "FriendsPage.dart";

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white.withAlpha(230),
      ),
      routes: <String, WidgetBuilder> {
        "Home": (BuildContext context) => HomePage(),
        "Diary": (BuildContext context) => DiaryPage(),
        "NewDiary": (BuildContext context) => NewDiaryPage(),
        "Weather": (BuildContext context) => WeatherPage(),
        "Calendar": (BuildContext context) => CalendarPage(),
        "Todo": (BuildContext context) => TodoPage(),
        "Profile": (BuildContext context) => ProfilePage(),
        "Friends": (BuildContext context) => FriendsPage(),
      },
    );
  }
}

