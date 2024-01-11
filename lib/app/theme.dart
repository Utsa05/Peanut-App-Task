import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peanut_app_task/app/extension.dart';

import 'constatns/app_size.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Colors.indigo;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color bgColor = Color.fromARGB(255, 238, 238, 238);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color redColor = Colors.red;

  static ThemeData appTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(elevation: 0.0, color: primaryColor),
      textTheme: TextTheme(
        titleLarge: const TextStyle().titleLarge(),
        titleMedium: const TextStyle().titleMid(),
        titleSmall: const TextStyle().titleSmall(),
        bodyLarge: const TextStyle().bodyLarge(),
        bodyMedium: const TextStyle().bodyMid(),
        bodySmall: const TextStyle().bodyLarge(),
        displayLarge: const TextStyle().displayLarge(),
        displayMedium: const TextStyle().displayMid(),
        displaySmall: const TextStyle().displaySmall(),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        height: AppSize.s60,
      ));
}
