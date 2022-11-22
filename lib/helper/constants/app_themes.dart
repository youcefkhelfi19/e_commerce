import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'montserrat',
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    brightness: Brightness.light);
ThemeData darkTheme = ThemeData(
    fontFamily: 'montserrat',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: darkColor,

    backgroundColor: darkColor,
    primaryColor: mainColor,
    brightness: Brightness.dark);
