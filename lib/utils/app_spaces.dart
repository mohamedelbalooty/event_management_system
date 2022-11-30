import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSpaces{
    static const double infinitySide = double.infinity;

    static final SizedBox verticalSpace1 = SizedBox(height: 5.h);
    static final SizedBox verticalSpace2 = SizedBox(height: 10.h);
    static final SizedBox verticalSpace3 = SizedBox(height: 15.h);
    static final SizedBox verticalSpace4 = SizedBox(height: 20.h);
    static final SizedBox verticalSpace5 = SizedBox(height: 25.h);
    static final SizedBox verticalSpace6 = SizedBox(height: 30.h);

    static final SizedBox horizontalSpace1 = SizedBox(width: 5.w);
    static final SizedBox horizontalSpace2 = SizedBox(width: 10.w);
    static final SizedBox horizontalSpace3 = SizedBox(width: 15.w);
    static final SizedBox horizontalSpace4 = SizedBox(width: 20.w);
    static final SizedBox horizontalSpace5 = SizedBox(width: 25.w);
    static final SizedBox horizontalSpace6 = SizedBox(width: 30.w);

    static const EdgeInsetsGeometry verticalPadding1 = EdgeInsets.symmetric(vertical: 5);
    static const EdgeInsetsGeometry verticalPadding2 = EdgeInsets.symmetric(vertical: 10);
    static const EdgeInsetsGeometry verticalPadding3 = EdgeInsets.symmetric(vertical: 15);

    static const EdgeInsetsGeometry horizontalPadding1 =
    EdgeInsets.symmetric(horizontal: 5);
    static const EdgeInsetsGeometry horizontalPadding2 =
    EdgeInsets.symmetric(horizontal: 10);
    static const EdgeInsetsGeometry horizontalPadding3 =
    EdgeInsets.symmetric(horizontal: 15);

}