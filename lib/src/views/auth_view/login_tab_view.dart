import 'package:ems/core/constants/validation_strings.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/src/view_models/auth_view_model.dart';
import 'package:ems/src/views/auth_view/widgets.dart';
import 'package:ems/src/views/auth_view/forget_password_view.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_form_field_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginTabView extends StatefulWidget {
  const LoginTabView({Key? key}) : super(key: key);

  @override
  State<LoginTabView> createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView> {
  late final GlobalKey<FormState> _globalKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
              hint: 'example@gmail.com',
              prefixButton: false,
              prefixIcon: AppIcons.Message,
              validate: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email...!';
                } else if (!RegExp(ValidationStrings.validationEmail)
                    .hasMatch(value)) {
                  return 'Enter valid email...!';
                } else {
                  return null;
                }
              },
            ),
            AppSpaces.verticalSpace2,
            TextFormFieldWidget(
              controller: _passwordController,
              hint: '*.*.*.*.*.*.*.*',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonWidget(
                  title: 'Forget password?',
                  size: 16.sp,
                  onClick: () => sl<NavigationHelper>()
                      .onNavigate(page: const ForgetPasswordView()),
                ),
              ],
            ),
            AppSpaces.verticalSpace4,
            ElevatedButtonWidget(
              title: 'Login',
              titleColor: AppColors.whiteClr,
              buttonColor: AppColors.mainClr,
              minimumSize: Size(AppSpaces.infinitySide, 40.h),
              onClick: () {
                if (_globalKey.currentState!.validate()) {
                  context.read<AuthViewModel>().login(
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
    super.dispose();
  }
}
