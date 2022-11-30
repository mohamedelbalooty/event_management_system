import 'dart:async';
import 'package:ems/core/constants/cache_keys.dart';
import 'package:ems/core/helper/cache_helper.dart';
import 'package:ems/core/helper/dialog_helper.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/src/dartz_extraction.dart';
import 'package:ems/src/services/remote_services/auth_service/auth_service_repository.dart';
import 'package:ems/src/views/auth_view/auth_view.dart';
import 'package:ems/src/views/create_profile_view/create_profile_view.dart';
import 'package:ems/core/helper/toast_helper.dart';
import 'package:ems/src/views/auth_view/verification_view.dart';
import 'package:ems/src/views/layout_view/layout_view.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final NavigationHelper _navigationHelper;
  final DialogHelper _dialogHelper;
  final ToastHelper _toastHelper;
  final CacheHelper _cacheHelper;
  final AuthServiceRepository _authService;
  Timer? _timer;

  AuthViewModel(
      {required NavigationHelper navigationHelper,
      required DialogHelper dialogHelper,
      required ToastHelper toastHelper,
      required CacheHelper cacheHelper,
      required AuthServiceRepository authService})
      : _navigationHelper = navigationHelper,
        _dialogHelper = dialogHelper,
        _toastHelper = toastHelper,
        _cacheHelper = cacheHelper,
        _authService = authService;

  void login({required String email, required String password}) async {
    _dialogHelper.onShowLoading();
    final result = await _authService.login(email: email, password: password);
    result.fold((left) {
      _navigationHelper.onPop();
      _toastHelper.onShowToast(message: left);
    }, (right) async {
      if (_authService.isVerify()) {
        if (_cacheHelper.getBoolData(key: CacheKeys.profileCompleted) != true) {
          _navigationHelper.onPop();
          _navigationHelper.onNavigateAndRemoveUntil(
              page: CreateProfileView(
            userId: _authService.getUser()!.uid,
            email: email,
          ));
        } else {
          _navigationHelper.onPop();
          _navigationHelper.onNavigateAndRemoveUntil(page: const LayoutView());
        }
      } else {
        _navigationHelper.onNavigateAndRemoveUntil(
            page: const VerificationView());
      }
    });
  }

  void register({required String email, required String password}) async {
    _dialogHelper.onShowLoading();
    final result =
        await _authService.register(email: email, password: password);
    result.fold((left) {
      _navigationHelper.onPop();
      _toastHelper.onShowToast(message: left);
    }, (right) async {
      _navigationHelper.onPop();
      if (_authService.isVerify()) {
        _navigationHelper.onNavigateAndRemoveUntil(
            page: CreateProfileView(
                userId: _authService.getUser()!.uid, email: email));
      } else {
        _navigationHelper.onNavigateAndRemoveUntil(
            page: const VerificationView());
      }
    });
  }

  void forgetPassword({required String email}) async {
    _dialogHelper.onShowLoading();
    final result = await _authService.forgetPassword(email: email);
    result.fold((left) {
      _navigationHelper.onPop();
      _toastHelper.onShowToast(message: left);
    }, (right) {
      _navigationHelper.onPop();
      _navigationHelper.onPop();
    });
  }

  void emailVerification() async {
    if (_timer != null) {
      _timer?.cancel();
    }
    final sendEmailVerificationResult =
        await _authService.sendEmailVerification();
    if (sendEmailVerificationResult.isLeft()) {
      _toastHelper.onShowToast(message: sendEmailVerificationResult.asLeft());
    } else {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
        final checkEmailVerificationResult =
            await _authService.checkEmailVerification();
        final isVerified = _authService.isVerify();
        checkEmailVerificationResult.fold((left) {
          _toastHelper.onShowToast(
              message: sendEmailVerificationResult.asLeft());
        }, (right) async {
          if (isVerified) {
            _timer?.cancel();
            _navigationHelper.onNavigateAndRemoveUntil(
                page: CreateProfileView(
                    userId: _authService.getUser()!.uid,
                    email: _authService.getUser()!.email!));
          }
        });
      });
    }
  }

  void logout() async {
    _timer?.cancel();
    _authService.logout();
    _navigationHelper.onNavigateAndRemoveUntil(page: const AuthView());
  }
}
