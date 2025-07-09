import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffFFFFFF);

  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primary,
      ),
    ),
    scaffoldBackgroundColor: black,
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      showUnselectedLabels: false,
      selectedItemColor: white,
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
