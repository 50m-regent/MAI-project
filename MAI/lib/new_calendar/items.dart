import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

TextStyle _textStyle({double fontSize, Color color = Colors.black}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

Widget _markList() {
  return Container(
    child: Column(),
  );
}

Widget _mark(Color color) {
  return Container(
    height: 4.0,
    width: 4.0,
    color: color,
  );
}

class _CalendarHeader extends StatelessWidget {
  _CalendarHeader({
    @required this.headerTitle,
    this.headerMargin,
    @required this.textStyle,
  });

  final String headerTitle;
  final EdgeInsetsGeometry headerMargin;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => Container(
    margin: headerMargin,
    child: Row(
      children: <Widget>[
        Text(headerTitle, style: textStyle),
      ]
    ),
  );
}

class _WeekdayRow extends StatelessWidget {
  _WeekdayRow(
    this.firstDayOfWeek, {
    @required this.weekdayMargin,
    @required this.weekdayTextStyle,
    @required this.localeDate,
  });

  final EdgeInsets weekdayMargin;
  final TextStyle weekdayTextStyle;
  final DateFormat localeDate;
  final int firstDayOfWeek;

  Widget _weekdayContainer(String weekDay) => Expanded(
    child: Container(
      margin: weekdayMargin,
      child: Center(
        child: Text(
          weekDay,
          style: weekdayTextStyle,
        ),
      ),
    ),
  );

  List<Widget> _renderWeekDays() {
    List<Widget> list = [];

    /// because of number of days in a week is 7, so it would be easier to count it til 7.
    for (var i = firstDayOfWeek, count = 0;
    count < 7;
    i = (i + 1) % 7, count++) {
      String weekDay = localeDate.dateSymbols.SHORTWEEKDAYS[i];
      list.add(_weekdayContainer(weekDay));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: _renderWeekDays(),
  );
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final TextStyle _otherDaysTextStyle = _textStyle(
    fontSize: 17,
    color: Colors.grey,
  );
  final TextStyle _daysTextStyle = _textStyle(fontSize: 20);
  final TextStyle _selectedDayTextStyle = _textStyle(
    fontSize: 20,
    color: Colors.white,
  );
  final double _dayPadding = 2.0;
  final Color _todayBorderColor = Colors.red[400];
  final Color _selectedDayButtonColor = MaterialColor(
    0xFF4FC3F7, // Colors.lightBlue[300];
    <int, Color>{}
  );
  final TextStyle _weekdayTextStyle = _textStyle(fontSize: 17);
  final TextStyle _headerTextStyle = _textStyle(fontSize: 29);
  final TextStyle _weekendTextStyle = _textStyle(
    fontSize: 20,
    color: Colors.red[400],
  );
  final EdgeInsets _headerMargin = EdgeInsets.only(
    top: 16,
    bottom: 16,
    right: 200,
  );
  final EdgeInsets _weekDayMargin = EdgeInsets.only(bottom: 4.0);
  PageController _controller = PageController(
    initialPage: 1,
    keepPage: true,
  );
  List<DateTime> _dates = List(3);
  DateTime _selectedDate = DateTime.now();
  int _startWeekday = 0;
  int _endWeekday = 0;
  DateFormat _localeDate;
  int _firstDayOfWeek;
  // final TextStyle selectedDayTextStyle;
  // final EventList<T> markedDatesMap;
  // final Function(DateTime, List<T>) onDayPressed;
  // final bool markedDateShowIcon;
  // final Color markedDateIconBorderColor;
  // final int markedDateIconMaxShown;
  // final double markedDateIconMargin;
  // final double markedDateIconOffset;
  // final MarkedDateIconBuilder<T> markedDateIconBuilder;
  // final bool markedDateMoreShowTotal; // null - no indicator, true - show the total events, false - show the total of hidden events
  // final Decoration markedDateMoreCustomDecoration;
  // final TextStyle markedDateMoreCustomTextStyle;
  // final Function(DateTime) onCalendarChanged;

  @override
  initState() {
    super.initState();
    initializeDateFormatting();
    _localeDate = DateFormat.yMMM('ja_JP');
    _firstDayOfWeek = (_localeDate.dateSymbols.FIRSTDAYOFWEEK + 1) % 7;
    _setDate();
  }

  List<DateTime> _getDaysInWeek([DateTime selectedDate]) {
    if (selectedDate == null) selectedDate = new DateTime.now();

    var _firstDayOfCurrentWeek = Utils.firstDayOfWeek(selectedDate);
    var _lastDayOfCurrentWeek = Utils.lastDayOfWeek(selectedDate);

    return Utils.daysInRange(_firstDayOfCurrentWeek, _lastDayOfCurrentWeek).toList();
  }

  _setDatesAndWeeks() {
    DateTime date0 = DateTime(this._selectedDate.year, this._selectedDate.month - 1, 1);
    DateTime date1 = DateTime(this._selectedDate.year, this._selectedDate.month, 1);
    DateTime date2 = DateTime(this._selectedDate.year, this._selectedDate.month + 1, 1);

    DateTime now = this._selectedDate;
    List<DateTime> week0 = _getDaysInWeek(now.subtract(new Duration(days: 7)));
    List<DateTime> week1 = _getDaysInWeek(now);
    List<DateTime> week2 = _getDaysInWeek(now.add(new Duration(days: 7)));

    _startWeekday = date1.weekday - _firstDayOfWeek;
    _endWeekday = date2.weekday - _firstDayOfWeek;
    this._dates = [
      date0,
      date1,
      date2,
    ];
  }

  _setDate([int page = -1]) {
    if (page == -1) {
      setState(() {
        _setDatesAndWeeks();
      });
    } else if (page == 1) {
      return;
    } else {
      List<DateTime> dates = this._dates;
      if (page == 0) {
        dates[2] = DateTime(dates[0].year, dates[0].month + 1, 1);
        dates[1] = DateTime(dates[0].year, dates[0].month, 1);
        dates[0] = DateTime(dates[0].year, dates[0].month - 1, 1);
        page = page + 1;
      } else if (page == 2) {
        dates[0] = DateTime(dates[2].year, dates[2].month - 1, 1);
        dates[1] = DateTime(dates[2].year, dates[2].month, 1);
        dates[2] = DateTime(dates[2].year, dates[2].month + 1, 1);
        page = page - 1;
      }

      setState(() {
        _startWeekday = dates[page].weekday - _firstDayOfWeek;
        _endWeekday = dates[page + 1].weekday - _firstDayOfWeek;
        this._dates = dates;
      });

      _controller.animateToPage(
        page,
        duration: Duration(milliseconds: 1),
        curve: Threshold(0.0)
      );
    }
  }

  _onDayPressed(DateTime date) {
    _selectedDate = date;
    _setDate();
  }

  AnimatedBuilder _builder(int slideIndex) {
    double screenWidth = MediaQuery.of(context).size.width;
    int totalItemCount = DateTime(
        _dates[slideIndex].year,
        _dates[slideIndex].month + 1,
        0,
      ).day +
        _startWeekday +
        (7 - _endWeekday);
    int year = _dates[slideIndex].year;
    int month = _dates[slideIndex].month;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page - slideIndex;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            // height: Curves.easeOut.transform(value) * widget.height,
            width: Curves.easeOut.transform(value) * screenWidth,
            child: child,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
                padding: EdgeInsets.zero,
                children: List.generate(totalItemCount, (index) {
                  bool _isToday =
                      DateTime.now().day == index + 1 - _startWeekday &&
                        DateTime.now().month == month &&
                        DateTime.now().year == year;
                  bool _isSelectedDay = _selectedDate != null &&
                      _selectedDate.year == year &&
                      _selectedDate.month == month &&
                      _selectedDate.day == index + 1 - _startWeekday;
                  bool _isPrevMonthDay = index < _startWeekday;
                  bool _isNextMonthDay = index >=
                      (DateTime(year, month + 1, 0).day) + _startWeekday;
                  bool _isThisMonthDay = !_isPrevMonthDay && !_isNextMonthDay;

                  DateTime _now = DateTime(year, month, 1);
                  TextStyle _textStyle;
                  if (_isPrevMonthDay) {
                    _now = _now.subtract(Duration(days: _startWeekday - index));
                    _textStyle = _otherDaysTextStyle;
                  } else if (_isThisMonthDay) {
                    _now = DateTime(year, month, index + 1 - _startWeekday);
                    _textStyle = _isSelectedDay
                        ? _selectedDayTextStyle
                        : _daysTextStyle;
                  } else {
                    _now = DateTime(year, month, index + 1 - _startWeekday);
                    _textStyle = _otherDaysTextStyle;
                  }
                  bool _isSelectable = true;
                  return Container(
                    margin: EdgeInsets.all(_dayPadding),
                    child: FlatButton(
                      color:
                          _isSelectedDay && _selectedDayButtonColor != null
                              ? _selectedDayButtonColor
                              : Colors.transparent,
                      onPressed: () => _onDayPressed(_now),
                      padding: EdgeInsets.all(_dayPadding),
                      shape: CircleBorder(
                        side: BorderSide(
                          color: _isToday ? _todayBorderColor : Colors.transparent,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: DefaultTextStyle(
                              style: (_localeDate.dateSymbols.WEEKENDRANGE.contains(
                                  (index - 1 + _firstDayOfWeek) % 7)) && !_isSelectedDay && !_isToday
                                    ? _otherDaysTextStyle
                                    : _isSelectable ? 
                                      _weekendTextStyle
                                   : _textStyle,
                            child: Text(
                              '${_now.day}',
                              maxLines: 1,
                              style: (_localeDate.dateSymbols.WEEKENDRANGE.contains(
                                  (index - 1 + _firstDayOfWeek) % 7)) &&
                                    !_isSelectedDay &&
                                    _isThisMonthDay &&
                                    ! _isToday
                                      ?_weekendTextStyle
                                      : _isPrevMonthDay || _isNextMonthDay
                                        ? _otherDaysTextStyle
                                        : _isSelectedDay
                                          ? _selectedDayTextStyle
                                          : _daysTextStyle,
                              ),
                            ),
                          ),
                          /*
                          markedDatesMap != null
                              ? _renderMarkedMapContainer(now)
                              : _renderMarked(now),
                          */
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            _CalendarHeader(
              headerMargin: _headerMargin,
              headerTitle: '${_localeDate.format(this._dates[1])}',
              textStyle: _headerTextStyle,
            ),
            _WeekdayRow(
              _firstDayOfWeek,
              weekdayMargin: _weekDayMargin,
              weekdayTextStyle: _weekdayTextStyle,
              localeDate: _localeDate,
            ),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                physics: ScrollPhysics(),
                onPageChanged: (index) {
                  this._setDate(index);
                },
                controller: _controller,
                itemBuilder: (context, index) {
                  return _builder(index);
                },
                pageSnapping: false,
            )),
          ],
        ),
    );
  }
}