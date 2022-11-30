import 'package:dartz/dartz.dart';
import 'package:ems/core/constants/constant_strings.dart';
import 'package:ems/core/helper/exception_handling_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service_repository.dart';

class AuthServiceImpl implements AuthServiceRepository {
  final FirebaseAuth _firebaseAuth;
  final ExceptionHandlingHelper _handlingHelper;

  const AuthServiceImpl(
      {required FirebaseAuth firebaseAuth,
      required ExceptionHandlingHelper handlingHelper})
      : _firebaseAuth = firebaseAuth,
        _handlingHelper = handlingHelper;

  @override
  bool isVerify() => _firebaseAuth.currentUser?.emailVerified ?? false;

  @override
  User? getUser() => _firebaseAuth.currentUser;

  @override
  Future<Either<String, Unit>> login(
      {required String email, required String password}) async {
    return await _handleFuture(
        future: () => _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password));
  }

  @override
  Future<Either<String, Unit>> register(
      {required String email, required String password}) async {
    return await _handleFuture(
        future: () => _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password));
  }

  @override
  Future<Either<String, Unit>> forgetPassword({required String email}) async {
    return await _handleFuture(
        future: () => _firebaseAuth.sendPasswordResetEmail(email: email));
  }

  @override
  Future<Either<String, Unit>> sendEmailVerification() async {
    return await _handleFuture(
        future: () => _firebaseAuth.currentUser!.sendEmailVerification());
  }

  @override
  Future<Either<String, Unit>> checkEmailVerification() async {
    return await _handleFuture(
        future: () => _firebaseAuth.currentUser!.reload());
  }

  @override
  Future<Either<String, Unit>> logout() async {
    return await _handleFuture(future: () => _firebaseAuth.signOut());
  }

  Future<Either<String, Unit>> _handleFuture(
      {required Future Function() future}) async {
    try {
      await future();
      return const Right(unit);
    } on FirebaseAuthException catch (authException) {
      final String failure =
          _handlingHelper.authErrorHandling(exceptionCode: authException.code);
      return Left(failure);
    } catch (exception) {
      return const Left(ConstantStrings.constFailure);
    }
  }
}
