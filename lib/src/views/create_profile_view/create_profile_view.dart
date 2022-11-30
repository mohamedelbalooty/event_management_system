import 'package:ems/core/helper/picker_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/src/models/user_model.dart';
import 'package:ems/src/view_models/create_profile_view_model.dart';
import 'package:ems/src/views/shared/shared_widgets/elevated_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_form_field_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({Key? key, required this.userId, required this.email})
      : super(key: key);
  final String userId, email;

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  late final GlobalKey<FormState> _globalKey;

  late final TextEditingController _firstNameController;

  late final TextEditingController _lastNameController;

  late final TextEditingController _mobileNumberController;

  late final TextEditingController _dateController;

  late String _birthDate;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _mobileNumberController = TextEditingController();
    _dateController = TextEditingController();
    _birthDate = '';
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
              AppSpaces.verticalSpace6,
              AppSpaces.verticalSpace4,
              TextWidget(
                text: 'Create Profile',
                color: AppColors.blackClr,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                padding: AppSpaces.horizontalPadding3,
              ),
              AppSpaces.verticalSpace2,
              const ImagePickerButtonWidget(),
              AppSpaces.verticalSpace3,
              TextFormFieldWidget(
                controller: _firstNameController,
                hint: 'First Name',
                prefixButton: false,
                prefixIcon: AppIcons.User,
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your first name...!';
                  } else {
                    return null;
                  }
                },
              ),
              AppSpaces.verticalSpace2,
              TextFormFieldWidget(
                controller: _lastNameController,
                hint: 'Last Name',
                prefixButton: false,
                prefixIcon: AppIcons.User1,
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your last name...!';
                  } else {
                    return null;
                  }
                },
              ),
              AppSpaces.verticalSpace2,
              TextFormFieldWidget(
                controller: _mobileNumberController,
                hint: 'Mobile Number',
                keyboardType: TextInputType.number,
                prefixButton: false,
                prefixIcon: AppIcons.Call,
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your mobile number...!';
                  } else if (value.length < 8) {
                    return 'Enter valid mobile number...!';
                  } else {
                    return null;
                  }
                },
              ),
              AppSpaces.verticalSpace2,
              TextFormFieldWidget(
                controller: _dateController,
                hint: 'Date Of Birth',
                prefixButton: false,
                prefixIcon: AppIcons.Calendar,
                readOnly: true,
                onTap: () async {
                  final result = await sl<PickerHelper>().onShowDatePicker();
                  _dateController.text =
                      '${result.day}-${result.month}-${result.year}';
                  _birthDate = result.toString();
                },
                validate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm your password...!';
                  } else {
                    return null;
                  }
                },
              ),
              AppSpaces.verticalSpace2,
              const ChooseTypeRadioWidget(),
              AppSpaces.verticalSpace4,
              Consumer<CreateProfileViewModel>(
                builder: (context, provider, child) {
                  return ElevatedButtonWidget(
                    title: 'Save',
                    titleColor: AppColors.whiteClr,
                    buttonColor: AppColors.mainClr,
                    minimumSize: Size(AppSpaces.infinitySide, 40.h),
                    onClick: () {
                      if (_globalKey.currentState!.validate()) {
                        provider.createProfile(
                          userModel: UserModel(
                            id: widget.userId,
                            email: widget.email,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            mobileNumber: _mobileNumberController.text,
                            birthDate: _birthDate,
                            gender: provider.userType,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              AppSpaces.verticalSpace5,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
