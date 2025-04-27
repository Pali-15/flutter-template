import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSwitcher {
  static final ValueNotifier<bool> _lightThemeNotifier =
      ValueNotifier<bool>(true);

  static ValueNotifier<bool> get lightThemeNotifier => _lightThemeNotifier;

  static switchTheme() =>
      _lightThemeNotifier.value = !_lightThemeNotifier.value;
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: AppColors.grey100,
    primary: AppColors.grey300,
    secondary: AppColors.grey200,
    inversePrimary: Colors.black,
    primaryContainer: AppColors.grey300,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.black),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
      ),
    ),
    titleLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGrey,
      ),
    ),
    titleMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGrey,
      ),
    ),
    bodyLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGrey,
      ),
    ),
    bodyMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGrey,
      ),
    ),
    bodySmall: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.darkGrey,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColors.darkGrey,
    primary: Colors.grey[700]!,
    secondary: AppColors.grey,
    inversePrimary: AppColors.grey200,
    primaryContainer: AppColors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[300]!,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.white),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    titleLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    titleMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bodyLarge: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bodyMedium: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bodySmall: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  ),
);

class AppColors {
  static Color grey100 = Colors.grey[100]!;
  static Color grey200 = Colors.grey[200]!;
  static Color grey300 = Colors.grey[300]!;
  static Color grey = Colors.grey[850]!;
  static Color lightGrey = Colors.grey[400]!;
  static Color darkGrey = Colors.grey[900]!;

  static Color green = Colors.green;
  static Color dangerColor = Colors.red;
  static Color blue = Colors.blue;
}
