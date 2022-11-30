import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/di_injection.dart' as di;
import 'package:ems/src/views/auth_view/auth_view.dart';
import 'package:ems/src/views/layout_view/layout_view.dart';
import 'package:ems/src/views/onboarding_view/onboarding_view.dart';
import 'package:ems/utils/app_providers.dart';
import 'package:ems/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/cache_keys.dart';
import 'core/helper/cache_helper.dart';

class EmsApp extends StatefulWidget {
  const EmsApp({Key? key}) : super(key: key);

  @override
  State<EmsApp> createState() => _EmsAppState();
}

class _EmsAppState extends State<EmsApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: AppProviders.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          title: 'EMS',
          navigatorKey: di.sl<NavigationHelper>().navigationKey,
          theme: AppTheme.theme,
          home: child,
        ),
      ),
      child: (di.sl<CacheHelper>().getBoolData(key: CacheKeys.onBoarding) != true)
          ? const OnBoardingView()
          : (di.sl<CacheHelper>().getBoolData(key: CacheKeys.isLogged) != true)
          ? const AuthView()
          : const LayoutView(),
    );
  }
}
