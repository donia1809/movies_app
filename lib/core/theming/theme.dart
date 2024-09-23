import 'package:flutter/material.dart';

import 'colors.dart';

class Theming
{
  static  ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellow1,
      unselectedItemColor: AppColors.white2,
  ),
  scaffoldBackgroundColor: AppColors.black,
  );
}