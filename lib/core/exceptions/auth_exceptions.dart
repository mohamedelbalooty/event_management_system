class InvalidEmailException implements Exception{
  final String exception;
  const InvalidEmailException({required this.exception});
}

class WeakPasswordException implements Exception{
  final String exception;
  const WeakPasswordException({required this.exception});
}

class WrongPasswordException implements Exception{
  final String exception;
  const WrongPasswordException({required this.exception});
}

class EmailAlreadyUsedException implements Exception{
  final String exception;
  const EmailAlreadyUsedException({required this.exception});
}

class UserNotFoundException implements Exception{
  final String exception;
  const UserNotFoundException({required this.exception});
}

class NetworkException implements Exception{
  final String exception;
  const NetworkException({required this.exception});
}

class AnotherException implements Exception{
  final String exception;
  const AnotherException({required this.exception});
}

class UploadImageException implements Exception{
  final String exception;
  const UploadImageException({required this.exception});
}