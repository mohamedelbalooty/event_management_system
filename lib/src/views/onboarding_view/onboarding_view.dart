import 'package:ems/core/constants/cache_keys.dart';
import 'package:ems/core/helper/cache_helper.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/src/views/auth_view/auth_view.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/svg_image_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_asset_paths.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_size_configuration.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfiguration.onInit(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSpaces.verticalSpace6,
          AppSpaces.verticalSpace4,
          TextWidget(
            text: 'Welcome to EMS!',
            color: AppColors.blackClr,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            padding: AppSpaces.horizontalPadding3,
          ),
          TextWidget(
            text: 'Event Management System',
            color: AppColors.blackClr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            padding: AppSpaces.horizontalPadding3,
          ),
          AppSpaces.verticalSpace5,
          SvgImageWidget(
            image: AppAssetPaths.onBoarding,
            height: 180.h,
            width: 180.h,
            padding: AppSpaces.horizontalPadding3,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteClr,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 5,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpaces.verticalSpace5,
                TextWidget(
                  text: 'The social media platform designed to get you offline',
                  color: AppColors.blackClr,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center,
                  padding: AppSpaces.horizontalPadding3,
                ),
                AppSpaces.verticalSpace5,
                TextWidget(
                  text:
                      'EMS is an app where users can leverage their social network to create, discover, share and monetize events or services.',
                  color: AppColors.blackClr,
                  fontSize: 14.sp,
                  align: TextAlign.center,
                  padding: AppSpaces.horizontalPadding3,
                ),
                AppSpaces.verticalSpace5,
                ElevatedButtonWidget(
                    title: 'Get Started',
                    titleColor: AppColors.mainClr,
                    buttonColor: AppColors.whiteClr,
                    padding: AppSpaces.horizontalPadding3,
                    minimumSize: Size(AppSpaces.infinitySide, 40.h),
                    onClick: () async {
                      await sl<CacheHelper>()
                          .setBoolData(key: CacheKeys.onBoarding, value: true);
                      sl<NavigationHelper>()
                          .onReplacementNavigate(page: const AuthView());
                    }),
                AppSpaces.verticalSpace5,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
