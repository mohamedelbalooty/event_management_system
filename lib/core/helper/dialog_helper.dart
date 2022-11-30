import 'package:ems/src/views/shared/shared_widgets/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'navigation_helper.dart';

class DialogHelper {
  final NavigationHelper _navigator;

  const DialogHelper({required NavigationHelper navigator})
      : _navigator = navigator;

  void onShowDialog({required Widget dialog, required Color color}) =>
      showDialog(
        context: _navigator.navigationKey.currentContext!,
        builder: (_) => AlertDialog(
          backgroundColor: color,
          content: dialog,
        ),
      );

  void onShowLoading() => showGeneralDialog(
        context: _navigator.navigationKey.currentContext!,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) => const SpinnerWidget(),
      );
}
