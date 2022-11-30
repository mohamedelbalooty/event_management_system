import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.iconSize,
      required this.onClick,
      this.padding = const EdgeInsets.all(8.0),
      this.constraints})
      : super(key: key);
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onClick;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onClick,
        padding: padding,
        constraints: constraints,
        icon: Icon(icon),
        color: iconColor,
        iconSize: iconSize);
  }
}
