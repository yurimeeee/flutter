import 'package:canlendar_schedulert/component/calendar.dart';
import 'package:canlendar_schedulert/component/custom_text_filed.dart';
import 'package:canlendar_schedulert/component/schedule_bottom.dart';
import 'package:canlendar_schedulert/component/schedule_card.dart';
import 'package:canlendar_schedulert/component/today_banner.dart';
import 'package:canlendar_schedulert/const/colors.dart';
import 'package:canlendar_schedulert/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? focusedDay;
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2024, 6, 8): [
      Schedule(
        id: 1,
        startTime: 11,
        endTime: 12,
        content: '플러터 공부하기',
        date: DateTime.utc(2024, 3, 8),
        color: categoryColors[0],
        createAt: DateTime.now().toUtc(),
      ),
      Schedule(
        id: 2,
        startTime: 14,
        endTime: 16,
        content: 'Next.js 공부하기',
        date: DateTime.utc(2024, 6, 8),
        color: categoryColors[3],
        createAt: DateTime.now().toUtc(),
      ),
    ]
  };
  // Map<key , value>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return ScheduleBottom();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 6, 1),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskCount: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: ListView.separated(
                  itemCount: schedules.containsKey(selectedDay)
                      ? schedules[selectedDay]!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    //화면에 위젯 보일때 실행

                    //선택된 날짜에 해당되는 일정 리스트로 저장
                    //특정 날짜를 schedules에 넣으면 해당 일자의 스케줄을 가져올 수 있음
                    //List<Schedule>
                    final selectedSchedules = schedules[selectedDay];
                    final scheduleModel = selectedSchedules![index];
                    return ScheduleCard(
                      startTime: scheduleModel.startTime,
                      endTime: scheduleModel.endTime,
                      content: scheduleModel.content,
                      color: Color(
                        int.parse(
                          'FF${scheduleModel.color}',
                          radix: 16,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    //위젯 사이사이에 들어갈 것을 빌드
                    return SizedBox(height: 8.0);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }

    return date.isAtSameMomentAs(selectedDay!);
  }
}
