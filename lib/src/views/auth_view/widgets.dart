import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/circle_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthenticationWidget extends StatelessWidget {
  const SocialAuthenticationWidget({
    Key? key,
    required this.facebookAuth,
    required this.googleAuth,
  }) : super(key: key);
  final VoidCallback facebookAuth, googleAuth;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: 'Or Contact With',
          color: AppColors.blackClr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          align: TextAlign.center,
        ),
        AppSpaces.verticalSpace2,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButtonWidget(
              side: 40.h,
              color: Colors.blueAccent.shade700,
              onClick: facebookAuth,
              child: TextWidget(
                text: 'f',
                color: AppColors.whiteClr,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpaces.horizontalSpace3,
            CircleButtonWidget(
              side: 40.h,
              color: Colors.red.shade600,
              onClick: googleAuth,
              child: TextWidget(
                text: 'G',
                color: AppColors.whiteClr,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
