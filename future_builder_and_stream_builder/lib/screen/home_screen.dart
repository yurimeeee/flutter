import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//future안에서 값이 반환될 때마다 빌더를 새로 실행하게 됨
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: streamNumber(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          // snapshot.data // future에서 반환해주는 값을 받음

          print('----data----');
          print(snapshot.connectionState);
          print(snapshot.data);

          // ConnectionState.none; -> Future 또는 Stream이 입력되지 않은 상태
          // ConnectionState.active; -> Stream에서만 존재 / 스트림 아직 진행중
          // ConnectionState.done; -> Future 또는 Stream이 종료되었을 때
          // ConnectionState.waiting; -> 실행중

          if (snapshot.connectionState == ConnectionState.active) {
            // 다른 위젯을 보여줌
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(snapshot.data.toString()),
                ],
              ),
            );
          }

          // error
          if (snapshot.hasError) {
            final error = snapshot.error;

            return Center(
              child: Text('에러: $error'),
            );
          }
          // 데이터가 존재하는지 확인
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Center(
              child: Text(data.toString()),
            );
          }
          return Center(
            child: Text('데이터가 없습니다'),
          );
        },
      ),
      // body: FutureBuilder<int>(
      //   future: getNumber(),
      //   builder: (BuildContext context, AsyncSnapshot<int> snapshot){
      //     // snapshot.data // future에서 반환해주는 값을 받음
      //
      //     print('----data----');
      //     print(snapshot.connectionState);
      //     print(snapshot.data);
      //
      //     // ConnectionState.none; -> Future 또는 Stream이 입력되지 않은 상태
      //     // ConnectionState.active; -> Stream에서만 존재 / 스트림 아직 진행중
      //     // ConnectionState.done; -> Future 또는 Stream이 종료되었을 때
      //     // ConnectionState.waiting; -> 실행중
      //
      //     if(snapshot.connectionState == ConnectionState.active){
      //       // 다른 위젯을 보여줌
      //     }
      //
      //     // error
      //     if(snapshot.hasError){
      //      final error = snapshot.error;
      //
      //      return Center(
      //        child: Text('에러: $error'),
      //      );
      //     }
      //     // 데이터가 존재하는지 확인
      //     if(snapshot.hasData){
      //       final data = snapshot.data;
      //       return Center(
      //         child: Text(data.toString()),
      //       );
      //     }
      //     return Center(
      //       child: Text('데이터가 없습니다'),
      //     );
      //   },
      // ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));
    final random = Random();
    // throw '에러!!';
    return random.nextInt(100);
  }

  Stream<int> streamNumber() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));

      // if (i == 5) {
      //   throw '에러!!';
      // }
      yield i;
    }
  }
}
