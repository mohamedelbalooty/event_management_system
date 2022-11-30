import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatelessWidget {
  const SvgImageWidget(
      {Key? key,
      required this.image,
      required this.height,
      required this.width,
      this.padding = EdgeInsets.zero})
      : super(key: key);
  final String image;
  final double height, width;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        image,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
