import 'package:ems/utils/app_spaces.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpaces.infinitySide,
      width: AppSpaces.infinitySide,
      color: Colors.black26.withOpacity(0.1),
      child: Center(
        child: SpinKitCircle(color: AppColors.thirdClr, size: 50.h),
      ),
    );
  }
}
