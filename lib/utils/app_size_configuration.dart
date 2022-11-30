import 'package:flutter/material.dart';

abstract class AppSizeConfiguration {
  static late final MediaQueryData mediaQuery;
  static late final double screenHeight;
  static late final double screenWidth;
  static bool isInitialized = false;

  static void onInit(BuildContext context) {
    if (isInitialized != true) {
      mediaQuery = MediaQuery.of(context);
      screenHeight = mediaQuery.size.height;
      screenWidth = mediaQuery.size.width;
      isInitialized = true;
    }
  }
}
