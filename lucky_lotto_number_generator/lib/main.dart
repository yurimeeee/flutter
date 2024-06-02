import 'package:flutter/material.dart';
import 'package:lucky_lotto_number_generator/const/colors.dart';
import 'package:lucky_lotto_number_generator/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'suite',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: fontColor,
          fontWeight: FontWeight.w700,
          fontSize: 32.0,
        ),
        bodyMedium: TextStyle(
          color: fontColor,
          fontSize: 20.0,
        ),
      ),
    ),
    home: HomeScreen(),
  ));
}
