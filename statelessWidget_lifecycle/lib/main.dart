import 'package:flutter/material.dart';
import 'package:statelesswidget_lifecycle/screen/home_screen.dart';

void main() {
  // flutter 프레임워크가 실행할 준비될 때까지 기다림
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
