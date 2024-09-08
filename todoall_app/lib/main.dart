import 'package:flutter/material.dart';
import 'package:todoall_app/screen/home_screen.dart';
import 'package:todoall_app/themes%20/theme_data.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Theme Example',
    theme: CustomTheme.themeData,
    home: HomeScreen(),
  ),);
}
