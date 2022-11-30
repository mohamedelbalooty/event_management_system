import 'package:ems/core/constants/validation_strings.dart';
import 'package:ems/src/view_models/auth_view_model.dart';
import 'package:ems/src/views/auth_view/widgets.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_form_field_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterTabView extends StatefulWidget {
  const RegisterTabView({Key? key}) : super(key: key);

  @override
  State<RegisterTabView> createState() => _RegisterTabViewState();
}

class _RegisterTabViewState extends State<RegisterTabView> {
  late final GlobalKey<FormState> _globalKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: SingleChildScrollView(
        padding: AppSpaces.horizontalPadding3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              controller: _emailController,
              hint: 'Email',
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
            AppSpaces.verticalSpace2,
            TextFormFieldWidget(
              controller: _passwordController,
              hint: 'Password',
              prefixButton: false,
              prefixIcon: AppIcons.Password,
              isSecure: true,
              validate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password...!';
                } else if (value.trim().length < 8) {
                  return 'Enter valid password...!';
                } else {
                  return null;
                }
              },
            ),
            AppSpaces.verticalSpace2,
            TextFormFieldWidget(
              controller: _passwordConfirmController,
              hint: 'Confirm Password',
              prefixButton: false,
              prefixIcon: AppIcons.Password,
              isSecure: true,
              validate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm your password...!';
                } else if (value.trim().length < 8) {
                  return 'Enter valid confirmation password...!';
                } else if (_passwordController.text !=
                    _passwordConfirmController.text) {
                  return 'Enter the same password...!';
                } else {
                  return null;
                }
              },
            ),
            AppSpaces.verticalSpace4,
            ElevatedButtonWidget(
              title: 'Register',
              titleColor: AppColors.whiteClr,
              buttonColor: AppColors.mainClr,
              minimumSize: Size(AppSpaces.infinitySide, 40.h),
              onClick: () {
                if (_globalKey.currentState!.validate()) {
                  context.read<AuthViewModel>().register(
                      email: _emailController.text,
                      password: _passwordController.text);
                }
              },
            ),
            AppSpaces.verticalSpace6,
            SocialAuthenticationWidget(
              key: UniqueKey(),
              facebookAuth: () {},
              googleAuth: () {},
            ),
            AppSpaces.verticalSpace3,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'By register, you agree our',
                  color: AppColors.blackClr,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center,
                ),
                TextButtonWidget(
                  title: 'Terms',
                  size: 14.sp,
                  decoration: TextDecoration.underline,
                  onClick: () {},
                ),
              ],
            ),
            AppSpaces.verticalSpace6,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }
}
