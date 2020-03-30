import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      headline2: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: Colors.blue,
      ),
    ),
  );
}
