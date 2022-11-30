import 'dart:io';
import 'package:ems/core/helper/dialog_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/src/view_models/create_profile_view_model.dart';
import 'package:ems/src/views/shared/shared_widgets/icon_button_widget.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickerButtonWidget extends StatelessWidget {
  const ImagePickerButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateProfileViewModel>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () => sl<DialogHelper>().onShowDialog(
            color: AppColors.whiteClr,
            dialog: const ImagePickerDialogWidget(),
          ),
          child: Container(
            height: 150.w,
            width: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainClr, width: 3),
              color: AppColors.whiteClr,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.3),
                  offset: const Offset(0.5, 0.5),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Center(
              child: provider.pickedImage != null
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(
                          File(provider.pickedImage!.path),
                        ),
                      ),
                    )
                  : Icon(
                      AppIcons.Image,
                      color: AppColors.thirdClr,
                      size: 50.sp,
                    ),
            ),
          ),
        );
      },
    );
  }
}

class ImagePickerDialogWidget extends StatelessWidget {
  const ImagePickerDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: AppSpaces.infinitySide,
      decoration: const BoxDecoration(
        color: AppColors.whiteClr,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          TextWidget(
            text: 'Choose your image',
            color: AppColors.mainClr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          AppSpaces.verticalSpace4,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButtonWidget(
                icon: AppIcons.Camera,
                iconColor: AppColors.mainClr,
                iconSize: 40.sp,
                onClick: () => context
                    .read<CreateProfileViewModel>()
                    .pickImage(source: ImageSource.camera),
              ),
              IconButtonWidget(
                icon: AppIcons.Image_2,
                iconColor: AppColors.mainClr,
                iconSize: 40.sp,
                onClick: () => context
                    .read<CreateProfileViewModel>()
                    .pickImage(source: ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChooseTypeRadioWidget extends StatelessWidget {
  const ChooseTypeRadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: 'Male',
            title: TextWidget(
              text: 'Male',
              color: AppColors.greyClr,
              fontSize: 16.sp,
            ),
            groupValue: context.watch<CreateProfileViewModel>().userType,
            onChanged: (value) => context
                .read<CreateProfileViewModel>()
                .chooseUserType(value: value!),
            selected: true,
            activeColor: AppColors.mainClr,
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: 'Female',
            title: TextWidget(
              text: 'Female',
              color: AppColors.greyClr,
              fontSize: 16.sp,
            ),
            groupValue: context.watch<CreateProfileViewModel>().userType,
            onChanged: (value) => context
                .read<CreateProfileViewModel>()
                .chooseUserType(value: value!),
            activeColor: AppColors.mainClr,
            autofocus: true,
          ),
        ),
      ],
    );
  }
}
