import 'package:ems/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  void onShowToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: AppColors.whiteClr,
        backgroundColor: AppColors.mainClr.withOpacity(0.8),
        fontSize: 16.sp);
  }
}
