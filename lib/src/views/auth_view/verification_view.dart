import 'package:ems/src/view_models/auth_view_model.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/svg_image_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_asset_paths.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthViewModel>().emailVerification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSpaces.horizontalPadding3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpaces.verticalSpace6,
            AppSpaces.verticalSpace4,
            TextWidget(
              text: 'Email Verification',
              color: AppColors.blackClr,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              padding: AppSpaces.horizontalPadding3,
            ),
            AppSpaces.verticalSpace2,
            TextWidget(
              text:
                  'Please verify your email address, we sent you an link to verify your email.',
              color: AppColors.blackClr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              padding: AppSpaces.horizontalPadding3,
              align: TextAlign.center,
            ),
            AppSpaces.verticalSpace2,
            TextWidget(
              text:
                  '"If you don\'t receive any verification, check your email spam folder"',
              color: AppColors.blackClr,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              padding: AppSpaces.horizontalPadding3,
              align: TextAlign.center,
            ),
            AppSpaces.verticalSpace6,
            SvgImageWidget(
              image: AppAssetPaths.verification,
              height: 230.h,
              width: 220.w,
            ),
            AppSpaces.verticalSpace4,
            ElevatedButtonWidget(
              title: 'Resend For Email',
              titleColor: AppColors.whiteClr,
              buttonColor: AppColors.mainClr,
              minimumSize: Size(AppSpaces.infinitySide, 40.h),
              onClick: () => context.read<AuthViewModel>().emailVerification(),
            ),
            AppSpaces.verticalSpace2,
            TextButtonWidget(
              title: 'Cancel',
              color: AppColors.mainClr,
              size: 16.sp,
              onClick: () => context.read<AuthViewModel>().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
