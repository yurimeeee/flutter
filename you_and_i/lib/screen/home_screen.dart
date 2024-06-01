import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      // backgroundColor: Colors.black,

      body: SafeArea(
        // IOS 상단 노치를 벗어나서 렌더링
        // 시스템 제공 UI 벗어나서 렌더링, 기본적으로 모든 값은 true
        bottom: false,
        child: Column(
          children: [
            _Top(),
            _Bottom(),
          ],
        ),
      ),
    );
  }
}

class _Top extends StatefulWidget {
  const _Top({super.key});

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Expanded(
      child: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // 현재 디바이스의 너비
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Text(
                'You & I',
                style: textTheme.displayLarge,
              ),
              Text(
                '널 만난지',
                style: textTheme.bodyLarge,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyMedium,
              ),
              // GestureDetector(
              //   onTap: (){
              //     showCupertinoDialog(
              //       context: context,
              //       barrierDismissible: true, // 외부 공간 클릭하면 Dialog 닫힘
              //       builder: (BuildContext context) {
              //         return Align(
              //           alignment: Alignment.center, // 위치를 정의하지 않으면 사이즈 설정 불가
              //           child: Container(
              //             color: Colors.white,
              //             height: 300.0,
              //             child: CupertinoDatePicker(
              //               mode: CupertinoDatePickerMode.date,
              //               dateOrder: DatePickerDateOrder.ymd,
              //               onDateTimeChanged: (DateTime date) {
              //                 //선택한 날짜를 콜백으로 받음
              //                 setState(() {
              //                   selectedDate = date;
              //                 });
              //               },
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   child: SizedBox(
              //     height: 100.0,
              //     child: Image.asset('asset/img/heart.png', fit: BoxFit.cover,),
              //   ),
              // ),
              IconButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true, // 외부 공간 클릭하면 Dialog 닫힘
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.center, // 위치를 정의하지 않으면 사이즈 설정 불가
                        child: Container(
                          color: Colors.white,
                          height: 300.0,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.ymd,
                            onDateTimeChanged: (DateTime date) {
                              //선택한 날짜를 콜백으로 받음
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(Icons.favorite),
                iconSize: 60.0,
                color: Colors.white,
              ),
              Text(
                'D + ${now.difference(selectedDate).inDays + 1} ',
                style: textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset('asset/img/you_and_i.png'),
      ),
    );
  }
}
