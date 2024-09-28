import 'package:flutter/material.dart';

import 'colors.dart';

class Theming
{
  static  ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellow1,
      unselectedItemColor: AppColors.grey5,
  ),
  scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.black,
    )
  );
}