import 'package:canlendar_schedulert/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const Calendar({
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final defaultBoxdecoration = BoxDecoration(
      // 각각 날짜 스타일 변경
      borderRadius: BorderRadius.circular(6.0,),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1.0,
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600]!,
      fontWeight: FontWeight.w500,
    );

    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      focusedDay: focusedDay,
      //선택된 날짜를 표기
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,
      headerStyle: HeaderStyle(
        formatButtonVisible: false, // 2weeks button
        titleCentered: true, // 타이틀 가운데 정렬
        titleTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true, // 현재 날짜 표기
        todayDecoration: defaultBoxdecoration.copyWith(color: primaryColor),
        todayTextStyle: defaultTextStyle.copyWith(color: Colors.white),
        defaultDecoration: defaultBoxdecoration,
        defaultTextStyle: defaultTextStyle,
        weekendDecoration: defaultBoxdecoration,
        weekendTextStyle: defaultTextStyle,
        selectedDecoration: defaultBoxdecoration.copyWith(
          border: Border.all(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        selectedTextStyle: defaultTextStyle.copyWith( color: primaryColor),
        outsideDecoration: defaultBoxdecoration.copyWith(border: Border.all(color: Colors.transparent)),
      ),
    );
  }
}
