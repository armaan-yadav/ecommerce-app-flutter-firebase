import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
  ),
);
