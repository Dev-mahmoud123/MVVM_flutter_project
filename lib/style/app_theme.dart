import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTheme {
  final ThemeData basicTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: Colors.white,
    canvasColor: Colors.white,
    fontFamily: 'Cairo-Regular',
    textSelectionTheme: TextSelectionThemeData(cursorColor:AppColors.blackColor ),
  );
}
