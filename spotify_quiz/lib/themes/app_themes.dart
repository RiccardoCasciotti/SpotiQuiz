import 'package:flutter/material.dart';

enum AppTheme {
  dark,
  light,
  purple,
  gold,
}

final appThemeData = {
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  ),
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 255, 255, 255),
  ),
  AppTheme.purple: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 144, 0, 139),
  ),
  AppTheme.gold: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 216, 163, 2),
  ),
};
