import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  const CircleButtonWidget(
      {Key? key,
      required this.side,
      required this.color,
      required this.child,
      required this.onClick})
      : super(key: key);
  final double side;
  final Color color;
  final Widget child;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: side,
        width: side,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0.5, 0.5),
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
