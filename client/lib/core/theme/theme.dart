import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.blackColor,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppPallete.pinkColor,
      cursorColor: Colors.white,
      selectionHandleColor: Colors.white,
    ),
  );
}
