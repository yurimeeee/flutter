// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ThemeData {
//
//   static const ColorScheme lightColorScheme = ColorScheme(
//     primary: Color(0xFFB93C5D),
//     primaryContainer: Color(0xFF117378),
//     secondary: Color(0xFFEFF3F3),
//     secondaryContainer: Color(0xFFFAFBFB),
//     background: Color(0xFFE6EBEB),
//     surface: Color(0xFFFAFBFB),
//     onBackground: Colors.white,
//     // error: _lightFillColor,
//     // onError: _lightFillColor,
//     // onPrimary: _lightFillColor,
//     onSecondary: Color(0xFF322942),
//     onSurface: Color(0xFF241E30),
//     brightness: Brightness.light,
//   );
//   static const _light = FontWeight.w300;
//   static const _regular = FontWeight.w400;
//   static const _medium = FontWeight.w500;
//   static const _semiBold = FontWeight.w600;
//   static const _bold = FontWeight.w700;
//
//   static final TextTheme _textTheme = TextTheme(
//     headlineMedium: TextStyle(fontFamily: 'SUITE', fontWeight: _bold, fontSize: 20.0),
//     bodySmall: TextStyle(fontFamily: 'SUITE', fontWeight: _semiBold, fontSize: 16.0),
//     headlineSmall: TextStyle(fontFamily: 'SUITE', fontWeight: _medium, fontSize: 16.0),
//     titleMedium: TextStyle(fontFamily: 'SUITE', fontWeight: _medium, fontSize: 16.0),
//     labelSmall: TextStyle(fontFamily: 'SUITE', fontWeight: _medium, fontSize: 12.0),
//     bodyLarge: TextStyle(fontFamily: 'SUITE', fontWeight: _regular, fontSize: 14.0),
//     titleSmall: TextStyle(fontFamily: 'SUITE', fontWeight: _medium, fontSize: 14.0),
//     bodyMedium: TextStyle(fontFamily: 'SUITE', fontWeight:_regular, fontSize: 16.0),
//     titleLarge: TextStyle(fontFamily: 'SUITE', fontWeight: _bold, fontSize: 16.0),
//     labelLarge: TextStyle(fontFamily: 'SUITE', fontWeight: _semiBold, fontSize: 14.0),
//   );
//
//
//   static final ThemeData themeData = ThemeData(
//     textTheme: _textTheme,
//     primarySwatch: Colors.blue,
//   );
// }

import 'package:flutter/material.dart';

class CustomTheme {
  static const Color _primaryColor = Color(0xFF729BF1);
  static const Color _secondaryColor = Color(0xFF03DAC6);
  static const Color _textColor = Color(0xFF5A5A5A);
  static const Color _lightTextColor = Color(0xFFA4A4A4);
  static const Color _backgroundColor = Color(0xFFF9FAFD);
  static const Color _errorColor = Color(0xFFFBAAB3);

  static final ColorScheme _colorScheme = ColorScheme(
    primary: _primaryColor,
    primaryContainer: Color(0xFF3700B3),
    secondary: _secondaryColor,
    secondaryContainer: Color(0xFF018786),
    surface: Colors.white,
    background: _backgroundColor,
    error: _errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _bold,
        fontSize: 24.0,
        color: _textColor),
    bodySmall: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _semiBold,
        fontSize: 16.0,
        color: _textColor),
    headlineSmall: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _medium,
        fontSize: 16.0,
        color: _textColor),
    titleMedium: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _medium,
        fontSize: 16.0,
        color: _textColor),
    labelSmall: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _medium,
        fontSize: 12.0,
        color: _textColor),
    bodyLarge: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _regular,
        fontSize: 14.0,
        color: _textColor),
    titleSmall: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _medium,
        fontSize: 14.0,
        color: _textColor),
    bodyMedium: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _regular,
        fontSize: 16.0,
        color: _textColor),
    titleLarge: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _bold,
        fontSize: 16.0,
        color: _textColor),
    labelLarge: TextStyle(
        fontFamily: 'SUITE',
        fontWeight: _semiBold,
        fontSize: 14.0,
        color: _textColor),
  );

  static final ThemeData themeData = ThemeData(
    textTheme: _textTheme,
    colorScheme: _colorScheme,
    scaffoldBackgroundColor:
        _colorScheme.background, // Use color scheme background
    appBarTheme: AppBarTheme(
      backgroundColor: _colorScheme.primary, // Use primary color for AppBar
      titleTextStyle: TextStyle(color: _colorScheme.onPrimary, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: _colorScheme.primary, // Button primary color
          foregroundColor: _colorScheme.onPrimary, // Button text color
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          minimumSize: Size(88, 42),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          )),

    ),
  );
}
