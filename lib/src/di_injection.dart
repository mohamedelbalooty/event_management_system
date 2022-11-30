import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/core/helper/cache_helper.dart';
import 'package:ems/core/helper/dialog_helper.dart';
import 'package:ems/core/helper/exception_handling_helper.dart';
import 'package:ems/core/helper/image_picker_helper.dart';
import 'package:ems/core/helper/navigation_helper.dart';
import 'package:ems/core/helper/picker_helper.dart';
import 'package:ems/core/helper/toast_helper.dart';
import 'package:ems/src/services/remote_services/auth_service/auth_service_impl.dart';
import 'package:ems/src/view_models/auth_view_model.dart';
import 'services/remote_services/create_profile_service/create_profile_service_impl.dart';
import 'view_models/create_profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  ///External packages
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  sl.registerLazySingleton<ImagePicker>(() => ImagePicker());
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  ///Helpers
  sl.registerLazySingleton<NavigationHelper>(() => NavigationHelper());
  sl.registerLazySingleton<PickerHelper>(
      () => PickerHelper(navigator: sl<NavigationHelper>()));
  sl.registerLazySingleton<CacheHelper>(
      () => CacheHelper(preferences: preferences));
  sl.registerLazySingleton<ImagePickerHelper>(
      () => ImagePickerHelper(picker: sl<ImagePicker>()));
  sl.registerLazySingleton<DialogHelper>(
      () => DialogHelper(navigator: sl<NavigationHelper>()));
  sl.registerLazySingleton<ToastHelper>(() => ToastHelper());
  sl.registerLazySingleton<ExceptionHandlingHelper>(
      () => ExceptionHandlingHelper());

  ///Services
  sl.registerLazySingleton<AuthServiceImpl>(() => AuthServiceImpl(
        firebaseAuth: sl<FirebaseAuth>(),
        handlingHelper: sl<ExceptionHandlingHelper>(),
      ));
  sl.registerLazySingleton<CreateProfileServiceImpl>(
      () => CreateProfileServiceImpl(
            firebaseStorage: sl<FirebaseStorage>(),
            fireStore: sl<FirebaseFirestore>(),
          ));

  ///ViewModels
  sl.registerFactory<AuthViewModel>(() => AuthViewModel(
        navigationHelper: sl<NavigationHelper>(),
        dialogHelper: sl<DialogHelper>(),
        toastHelper: sl<ToastHelper>(),
        cacheHelper: sl<CacheHelper>(),
        authService: sl<AuthServiceImpl>(),
      ));

  sl.registerFactory<CreateProfileViewModel>(() => CreateProfileViewModel(
        navigationHelper: sl<NavigationHelper>(),
        dialogHelper: sl<DialogHelper>(),
        toastHelper: sl<ToastHelper>(),
        cacheHelper: sl<CacheHelper>(),
        imagePickerHelper: sl<ImagePickerHelper>(),
        createProfileService: sl<CreateProfileServiceImpl>(),
      ));
}
