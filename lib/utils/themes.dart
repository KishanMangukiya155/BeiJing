import 'package:flutter/material.dart';

class BeijingTheme {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
