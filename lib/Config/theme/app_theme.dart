import 'package:atelyam/Config/constants/constants.dart';
import 'package:atelyam/Config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: gilroyRegular,
    colorSchemeSeed: AppColors.kPrimaryColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20),
      elevation: 0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent.withOpacity(0)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
