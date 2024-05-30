import 'package:flutter/material.dart';

void main() {
  //플러터 앱을 실행
  runApp(
    //화면에 보여줄 위젯을 추가
    //MaterialApp은 항상 최상위에 위치, 런앱의 가장 첫번쨰는 MaterialApp.
    //Scaffold는 바로 아래에 위치. (Scaffold = 기본구조)
    //위젯 -> Widget 화면에 구조를 생성
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'hello world',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
  );
}
