import 'package:flutter/material.dart';
import 'package:navigator/layout/default_layout.dart';
import 'package:navigator/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argumnets = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(children: [
      Text('argumnets $argumnets'),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('pop'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/three',
            arguments: 11111,
          );
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (BuildContext context){
          //     return RouteThreeScreen();
          //   })
          // );
        },
        child: Text('push route three'),
      ),
      OutlinedButton(
        onPressed: () {
          /// [HomeScreen, RouteOneScreen, RouteTwoScreen]
          /// push - [HomeScreen, RouteOneScreen, RouteTwoScreen, RouteThreeScreen]
          /// push는 계속 추가
          /// push replacement - [HomeScreen, RouteOneScreen, RouteThreeScreen]
          /// replacement는 맨위의 스크린을 제거하고 대체
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return RouteThreeScreen();
            }),
          );
        },
        child: Text('push replacement'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(
          '/three'
          );
        },
        child: Text('push replacement Named'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route){
                // 만약 삭제할거면 false 반환
                // 삭제 안한거면 true 반환

                // 어떤 라우트를 삭제할지 조건문으로 정할 수 있음
                return route.settings.name == '/';
              }
          );
        },
        child: Text('push Named And Remove Until'),
      )
    ], title: 'RouteTwoScreen');
  }
}
