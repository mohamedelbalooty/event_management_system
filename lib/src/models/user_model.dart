import 'package:ems/core/constants/firebase_keys.dart';

class UserModel {
  final String id, email, firstName, lastName, mobileNumber, birthDate, gender;
  String? image;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.birthDate,
    required this.gender,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json[FirebaseKeys.userId],
        email: json[FirebaseKeys.userEmail],
        firstName: json[FirebaseKeys.userFirstName],
        lastName: json[FirebaseKeys.userLastName],
        mobileNumber: json[FirebaseKeys.userMobileNumber],
        birthDate: json[FirebaseKeys.userBirthDate],
        image: json[FirebaseKeys.userImage],
        gender: json[FirebaseKeys.userGender],
      );

  Map<String, dynamic> toJson() => {
        FirebaseKeys.userId: id,
        FirebaseKeys.userEmail: email,
        FirebaseKeys.userFirstName: firstName,
        FirebaseKeys.userLastName: lastName,
        FirebaseKeys.userMobileNumber: mobileNumber,
        FirebaseKeys.userBirthDate: birthDate,
        FirebaseKeys.userImage: image,
        FirebaseKeys.userGender: gender,
      };
}
