import 'package:flutter/material.dart';
import 'package:trubuy/theme/button_theme.dart';
import 'package:trubuy/theme/input_decoration_theme.dart';

import '../constants.dart';
import 'checkbox_themedata.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      primarySwatch: primaryMaterialColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Plus Jakarta",
      primarySwatch: primaryMaterialColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.black,
      iconTheme:  IconThemeData(color: Colors.white),
      textTheme:  TextTheme(
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      elevatedButtonTheme: darkElevatedButtonThemeData,
      textButtonTheme: darkTextButtonThemeData,
      outlinedButtonTheme: darkOutlinedButtonThemeData,


      inputDecorationTheme: darkInputDecorationTheme,

      checkboxTheme: checkboxThemeData.copyWith(
        checkColor: MaterialStateProperty.all<Color>(Colors.black),
        fillColor: MaterialStateProperty.all<Color>(Colors.white),
        side: const BorderSide(color: Colors.white70),
      ),
      appBarTheme: appBarLightTheme.copyWith(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      scrollbarTheme: scrollbarThemeData.copyWith(
        thumbColor: MaterialStateProperty.all<Color>(Colors.white70),
      ),
      dataTableTheme: dataTableLightThemeData.copyWith(
        dataRowColor: MaterialStateProperty.all<Color>(Colors.grey[800]!),
        headingRowColor: MaterialStateProperty.all<Color>(Colors.grey[900]!),
      ),
    );
  }
}
