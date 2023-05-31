import 'package:CotizApp/ui/values/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: appBarColor
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: appBarColor,

  )
);
