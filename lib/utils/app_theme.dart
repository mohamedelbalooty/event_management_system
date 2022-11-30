import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData theme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.mainClr,
    scaffoldBackgroundColor: AppColors.whiteClr,
  );
}
