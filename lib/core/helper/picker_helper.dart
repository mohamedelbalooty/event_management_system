import 'package:flutter/material.dart';
import 'navigation_helper.dart';

class PickerHelper {
  final NavigationHelper _navigator;

  const PickerHelper({required NavigationHelper navigator})
      : _navigator = navigator;

  Future<DateTime> onShowDatePicker() async => await showDatePicker(
        context: _navigator.navigationKey.currentContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
      ) ?? DateTime.now();
}
