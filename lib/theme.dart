import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xffe1f2ff),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    ),
  );
}