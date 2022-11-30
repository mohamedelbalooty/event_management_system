import 'package:ems/src/views/auth_view/login_tab_view.dart';
import 'package:ems/src/views/auth_view/register_tab_view.dart';
import 'package:ems/utils/app_size_configuration.dart';
import 'package:ems/utils/app_spaces.dart';
import 'package:ems/src/views/shared/shared_widgets/text_widget.dart';
import 'package:ems/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late int _tabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController
        .addListener(() => _handleTabChanging(index: _tabController.index));
    _tabIndex = 0;
  }

  void _handleTabChanging({required int index}) => setState(() {
        _tabIndex = index;
      });

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
            text: _tabIndex == 0 ? 'Login' : 'Register',
            color: AppColors.blackClr,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            padding: AppSpaces.horizontalPadding3,
          ),
          AppSpaces.verticalSpace2,
          TextWidget(
            text: _tabIndex == 0
                ? 'Welcome back, please login and continue...'
                : 'Welcome, please register to see an events.',
            color: AppColors.blackClr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            padding: AppSpaces.horizontalPadding3,
            align: TextAlign.center,
          ),
          AppSpaces.verticalSpace2,
          TabBar(
            controller: _tabController,
            onTap: (int value) => _handleTabChanging(index: value),
            isScrollable: true,
            labelStyle: TextStyle(
              color: AppColors.mainClr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors.blackClr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            labelColor: AppColors.mainClr,
            unselectedLabelColor: AppColors.blackClr,
            indicatorColor: AppColors.mainClr,
            indicatorWeight: 2.5.h,
            tabs: const [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
          ),
          AppSpaces.verticalSpace3,
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LoginTabView(key: UniqueKey()),
                RegisterTabView(key: UniqueKey()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
