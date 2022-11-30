import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.color = AppColors.whiteClr,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Poppins',
    this.overflow = TextOverflow.visible,
    this.padding = EdgeInsets.zero,
    this.height,
    this.align,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextOverflow overflow;
  final EdgeInsetsGeometry padding;
  final double? height;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          overflow: overflow,
          height: height,
        ),
        textAlign: align,
      ),
    );
  }
}
