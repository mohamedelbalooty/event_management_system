import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServiceRepository {
  Future<Either<String, Unit>> login({required String email, required String password});
  Future<Either<String, Unit>> register({required String email, required String password});
  Future<Either<String, Unit>> forgetPassword({required String email});
  Future<Either<String, Unit>> logout();
  Future<Either<String, Unit>> sendEmailVerification();
  Future<Either<String, Unit>> checkEmailVerification();
  bool isVerify();
  User? getUser();
}
