import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.title,
    required this.onClick,
    this.color = AppColors.mainClr,
    this.size = 16,
    this.decoration,
  }) : super(key: key);
  final String title;
  final VoidCallback onClick;
  final Color color;
  final double size;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          decoration: decoration,
        ),
      ),
    );
  }
}
