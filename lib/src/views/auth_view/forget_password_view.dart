import 'package:ems/core/constants/validation_strings.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/src/view_models/auth_view_model.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/icon_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_form_field_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:ems/utils/app_size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late final GlobalKey<FormState> _globalKey;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSpaces.horizontalPadding3,
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpaces.verticalSpace5,
              SizedBox(
                height: kBottomNavigationBarHeight,
                width: AppSpaces.infinitySide,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButtonWidget(
                      icon: AppIcons.Arrow___Left_Circle,
                      iconColor: AppColors.mainClr,
                      iconSize: 34.sp,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onClick: () => sl<NavigationHelper>().onPop(),
                    ),
                  ],
                ),
              ),
              AppSpaces.verticalSpace6,
              AppSpaces.verticalSpace2,
              TextWidget(
                text: 'Forget Password',
                color: AppColors.blackClr,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                padding: AppSpaces.horizontalPadding3,
              ),
              AppSpaces.verticalSpace2,
              TextWidget(
                text:
                    'Please enter your registered email, we will send you an link to reset your password.',
                color: AppColors.blackClr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                padding: AppSpaces.horizontalPadding3,
                align: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              TextFormFieldWidget(
                controller: _emailController,
                hint: 'Email Address',
                prefixButton: false,
                prefixIcon: AppIcons.Message,
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email...!';
                  } else if (!RegExp(ValidationStrings.validationEmail).hasMatch(value)) {
                    return 'Enter valid email...!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: AppSizeConfiguration.screenHeight * 0.2),
              ElevatedButtonWidget(
                title: 'Send Now',
                titleColor: AppColors.whiteClr,
                buttonColor: AppColors.mainClr,
                minimumSize: Size(AppSpaces.infinitySide, 40.h),
                onClick: () {
                  if (_globalKey.currentState!.validate()) {
                    context
                        .read<AuthViewModel>()
                        .forgetPassword(email: _emailController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
