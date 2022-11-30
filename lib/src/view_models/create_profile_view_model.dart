import 'dart:io';
import 'package:ems/core/constants/cache_keys.dart';
import 'package:ems/core/constants/constant_strings.dart';
import 'package:ems/core/helper/cache_helper.dart';
import 'package:ems/core/helper/dialog_helper.dart';
import 'package:ems/core/helper/image_picker_helper.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/core/helper/toast_helper.dart';
import 'package:ems/src/models/user_model.dart';
import 'package:ems/src/services/remote_services/create_profile_service/create_profile_service_impl.dart';
import 'package:ems/src/services/remote_services/create_profile_service/create_profile_service_repository.dart';
import 'package:ems/src/views/layout_view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileViewModel with ChangeNotifier {
  final NavigationHelper _navigationHelper;
  final DialogHelper _dialogHelper;
  final ToastHelper _toastHelper;
  final CacheHelper _cacheHelper;
  final ImagePickerHelper _imagePickerHelper;
  final CreateProfileServiceRepository _createProfileService;

  CreateProfileViewModel(
      {required NavigationHelper navigationHelper,
      required DialogHelper dialogHelper,
      required ToastHelper toastHelper,
      required CacheHelper cacheHelper,
      required ImagePickerHelper imagePickerHelper,
      required CreateProfileServiceImpl createProfileService})
      : _navigationHelper = navigationHelper,
        _dialogHelper = dialogHelper,
        _toastHelper = toastHelper,
        _cacheHelper = cacheHelper,
        _imagePickerHelper = imagePickerHelper,
        _createProfileService = createProfileService;

  XFile? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  String _userType = 'Male';

  String get userType => _userType;

  void pickImage({required ImageSource source}) async {
    try {
      _pickedImage = await _imagePickerHelper.pickImage(source: source);
      _navigationHelper.onPop();
    } catch (exception) {
      _toastHelper.onShowToast(message: ConstantStrings.constImageFailure);
    }
    notifyListeners();
  }

  void chooseUserType({required String value}) {
    _userType = value;
    notifyListeners();
  }

  void createProfile({required UserModel userModel}) async {
    if (_pickedImage != null) {
      _dialogHelper.onShowLoading();
      final result = await _createProfileService.createProfile(
        userModel: userModel,
        image: File(pickedImage!.path),
      );
      result.fold((left) {
        _navigationHelper.onPop();
        _toastHelper.onShowToast(message: left);
      }, (right) async {
        await _cacheHelper.setBoolData(
            key: CacheKeys.profileCompleted, value: true);
        _navigationHelper.onPop();
        _navigationHelper.onNavigateAndRemoveUntil(page: const LayoutView());
      });
    } else {
      _toastHelper.onShowToast(message: ConstantStrings.constImageFailure);
    }
  }
}
