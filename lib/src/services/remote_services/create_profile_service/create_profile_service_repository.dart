import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ems/src/models/user_model.dart';

abstract class CreateProfileServiceRepository {
  Future<Either<String, String>> uploadImage({required File image});

  Future<Either<String, Unit>> createProfile(
      {required UserModel userModel, required File image});
}
