import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.onClick,
    this.title = '',
    this.isCustom = false,
    this.customChild = const SizedBox(),
    this.buttonColor = AppColors.mainClr,
    this.titleColor = AppColors.whiteClr,
    this.padding = EdgeInsets.zero,
    this.fixedSize,
    this.minimumSize,
  }) : super(key: key);
  final String title;
  final Color buttonColor;
  final Color titleColor;
  final bool isCustom;
  final Widget customChild;
  final VoidCallback onClick;
  final EdgeInsetsGeometry padding;
  final Size? fixedSize, minimumSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          fixedSize: MaterialStateProperty.all<Size?>(fixedSize),
          minimumSize: MaterialStateProperty.all<Size?>(minimumSize),
        ),
        child: !isCustom
            ? TextWidget(
                text: title,
                color: titleColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              )
            : customChild,
      ),
    );
  }
}
