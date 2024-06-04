import 'package:flutter/material.dart';
import 'package:navigator/layout/default_layout.dart';
import 'package:navigator/screen/route_one_screen.dart';
import 'package:navigator/screen/route_two_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //시스템 안에서 제공하는 뒤로가기 기능을 false
      // 보통 home에서 뒤로가기로 앱이 꺼지는 것 방지
      child: DefaultLayout(title: 'HomeScreen', children: [
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteOneScreen(
                    number: 123,
                  );
                },
              ),
            );
            print(result);
          },
          child: Text('Push'),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(456,);
        //   },
        //   child: Text('Pop'),
        // ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).maybePop(456,);
        //     // pop을 더 안전하게 할수 있음 maybepop은 팝할 스택이 있을떄만 작동
        //   },
        //   child: Text('Maybe Pop'),
        // ),
        // ElevatedButton(
        //   onPressed: () {
        //     print(Navigator.of(context).canPop());
        //     // canPop 은 pop 가능 여부를 true,false로 알려줌
        //   },
        //   child: Text('Can Pop'),
        // ),
      ]),
    );
  }
}
