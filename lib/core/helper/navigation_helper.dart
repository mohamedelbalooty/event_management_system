import 'package:flutter/material.dart';

class NavigationHelper {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> onNavigate({required Widget page}) =>
      navigationKey.currentState!.push(MaterialPageRoute(builder: (_) => page));

  Future<dynamic> onReplacementNavigate({required Widget page}) =>
      navigationKey.currentState!
          .pushReplacement(MaterialPageRoute(builder: (_) => page));

  Future<dynamic> onNavigateAndRemoveUntil({required Widget page}) =>
      navigationKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => page), (route) => false);

  void onPop() => navigationKey.currentState!.pop();
}
