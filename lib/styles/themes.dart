import 'package:flutter/material.dart';


ThemeData pinkAndDarkGrayTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF383B49),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
       overflow: TextOverflow.fade,
    ),
  ),
    indicatorColor:  Color(0xFFCC0066),


  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
  ),
colorScheme: const ColorScheme.light(
  primary: Color(0xFFCC0066),
  secondary: Color(0xFF383B49),
)

);
ThemeData blueAndDarkGrayTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF0c0032),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
       overflow: TextOverflow.fade,
    ),
  ),

  sliderTheme: const SliderThemeData(
    activeTrackColor: Color(0xFFCC0066),
    inactiveTrackColor: Color(0xFFFFFFFF),
    activeTickMarkColor: Color(0xFFCC0066),
    inactiveTickMarkColor: Color(0xFFFFFFFF)

  ),
  indicatorColor:  Color(0xFFEDF5E1),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFEDF5E1),
    unselectedItemColor: Colors.white38,
  ),
colorScheme: const ColorScheme.light(
  primary: Color(0xFF383B49),
  secondary: Color(0xFF05386B),
)

);
ThemeData redAndPinkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1A1A1D),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
       overflow: TextOverflow.fade,
    ),
  ),


  indicatorColor:  const Color(0xFFEDF5E1),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFEDF5E1),
    unselectedItemColor: Colors.white38,
  ),
colorScheme: const ColorScheme.light(
  primary: Color(0xFF383B49),
  secondary: Color(0xFFc3073f),
)

);
ThemeData beigeAndTealTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF2c3531),
  cardColor: const Color(0xFF116466),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
       overflow: TextOverflow.fade,
    ),
  ),

  indicatorColor:  const Color(0xFFEDF5E1),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFEDF5E1),
    unselectedItemColor: Colors.white38,
  ),
colorScheme: const ColorScheme.light(
  primary: Color(0xFF116466),
  secondary: Color(0xFFd9b08c),
)

);
