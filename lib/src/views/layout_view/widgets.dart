import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/di_injection.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:ems/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'create_event_view/create_event_view.dart';

class CreateEventFloatingButtonWidget extends StatelessWidget {
  const CreateEventFloatingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.mainClr,
      child: Icon(
        AppIcons.Plus,
        color: AppColors.whiteClr,
        size: 28.sp,
      ),
      onPressed: () =>
          sl<NavigationHelper>().onNavigate(page: const AddEventView()),
    );
  }
}

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget(
      {Key? key, required this.activeIndex, required this.onTap})
      : super(key: key);
  final int activeIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        AppIcons.Home,
        AppIcons.Bag,
        AppIcons.Chat,
        AppIcons.Profile
      ],
      activeIndex: activeIndex,
      iconSize: 28.sp,
      leftCornerRadius: 15,
      rightCornerRadius: 15,
      activeColor: AppColors.mainClr,
      inactiveColor: AppColors.blackClr,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      backgroundColor: AppColors.whiteClr,
      onTap: onTap,
      //other params
    );
  }
}
