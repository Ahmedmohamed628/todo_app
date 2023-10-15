import 'dart:ui';
import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color primaryDark = Color(0xff5D9CEC);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff383838);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color grayColor = Color(0xff8a8a95);
  static Color backgroundDark = Color(0xff060E1E);
  static Color blackDark = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(backgroundColor: primaryLight, elevation: 0),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: grayColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: primaryLight,
        unselectedItemColor: grayColor,
        backgroundColor: Colors.transparent,
        elevation: 0),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryLight,
        shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 4))),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: blackDark),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: grayColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: primaryDark,
      unselectedItemColor: whiteColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryDark,
        shape: StadiumBorder(side: BorderSide(color: blackDark, width: 4))),
  );
}
