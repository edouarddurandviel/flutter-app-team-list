import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme(
    // Decide how you want to apply your own custom them, to the MaterialApp
    brightness: Brightness.light,
    primary: Colors.white,
    primaryVariant: TabColors.tabBarTitle,
    secondary: TabColors.tabBarIconColor,
    secondaryVariant: Colors.red,
    background: TabColors.appBarDetailBackground,
    surface: TabColors.appBarDetailBackground,
    onBackground: TabColors.tabBarTitle,
    onSurface: TabColors.tabBarTitle,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.red.shade400);

/// Now that we have ColorScheme and TextTheme, we can create the ThemeData
var t = ThemeData.from(colorScheme: colorScheme);

class TabColors {
  const TabColors();

  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);

  //static const Color planetCard = const Color(0xFF434273);
  static const Color planetCard = const Color(0xFF8685E5);
  //static const Color planetListBackground = const Color(0xFF3E3963);
  static const Color listeTilesBackground = const Color(0xFF736AB7);
  static const Color planetTitle = const Color(0xFFFFFFFF);
  static const Color planetLocation = const Color(0x66FFFFFF);
  static const Color planetDistance = const Color(0x66FFFFFF);

  static const Color tabBarTitle = const Color.fromRGBO(12, 35, 92, 1);
  static const Color tabBarIconColor = const Color(0xFFFFFFFF);
  static const Color tabBarBackground = const Color.fromRGBO(217, 48, 37, 1);
  static const Color tabBarGradientStart = const Color.fromRGBO(217, 48, 37, 1);
  static const Color tabBarGradientEnd = const Color.fromRGBO(217, 48, 37, .2);
  static const Color appBarGradientStart =
      const Color.fromRGBO(217, 48, 37, .2);
  static const Color appBarGradientEnd = const Color.fromRGBO(217, 48, 37, .2);

  static const Color formFields = const Color.fromRGBO(74, 74, 74, 1);
}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {
  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
      color: TabColors.appBarTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
      fontSize: 20.0);

  static const TextStyle planetTitle = const TextStyle(
      color: TabColors.planetTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle formFields = const TextStyle(
      color: Colors.grey,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 18.0);

  static const TextStyle listTile = const TextStyle(
      color: TabColors.planetTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 15.0);

  static const TextStyle listInk = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
      fontSize: 25.0);
  static const TextStyle listEmail = const TextStyle(
      color: Colors.grey,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 11.0);
  static const TextStyle listTitle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
      fontSize: 15.0);
}
