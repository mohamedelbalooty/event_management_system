import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ems/core/constants/constant_strings.dart';
import 'package:ems/core/constants/firebase_keys.dart';
import 'package:ems/core/exceptions/auth_exceptions.dart';
import 'package:ems/src/dartz_extraction.dart';
import 'package:ems/src/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'create_profile_service_repository.dart';

class CreateProfileServiceImpl implements CreateProfileServiceRepository {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _fireStore;

  CreateProfileServiceImpl(
      {required FirebaseStorage firebaseStorage,
      required FirebaseFirestore fireStore})
      : _firebaseStorage = firebaseStorage,
        _fireStore = fireStore;

  @override
  Future<Either<String, String>> uploadImage({required File image}) async {
    try {
      final reference = _firebaseStorage.ref();
      final filePath = Uri.file(image.path).pathSegments.last;
      final putImageFile = await reference
          .child('${FirebaseKeys.imagesCollection}/$filePath')
          .putFile(image);
      final downloadUrl = await putImageFile.ref.getDownloadURL();
      return Right(downloadUrl);
    } catch (exception) {
      return throw const UploadImageException(
          exception: ConstantStrings.constUploadImageFailure);
    }
  }

  @override
  Future<Either<String, Unit>> createProfile({
    required UserModel userModel,
    required File image,
  }) async {
    try {
      final imageUpload = await uploadImage(image: image);
      final Map<String, dynamic> data = {
        FirebaseKeys.userId: userModel.id,
        FirebaseKeys.userEmail: userModel.email,
        FirebaseKeys.userFirstName: userModel.firstName,
        FirebaseKeys.userLastName: userModel.lastName,
        FirebaseKeys.userMobileNumber: userModel.mobileNumber,
        FirebaseKeys.userBirthDate: userModel.birthDate,
        FirebaseKeys.userGender: userModel.gender,
        FirebaseKeys.userImage: imageUpload.asRight(),
      };
      await _fireStore
          .collection(FirebaseKeys.usersCollection)
          .doc(userModel.id)
          .set(data);
      return const Right(unit);
    } on UploadImageException catch (uploadImageException) {
      return Left(uploadImageException.exception);
    } catch (exception) {
      return const Left(ConstantStrings.constFailure);
    }
  }
}
