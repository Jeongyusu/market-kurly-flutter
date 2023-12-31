import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:intl/intl.dart';

class JoinReqDTO {
  final String userId;
  final String userPassword;
  final String username;
  final String userEmail;
  final DateTime? userBirth;
  final String? userGender;
  final String role;

  JoinReqDTO(
      {required this.userId,
      required this.userPassword,
      required this.username,
      required this.userEmail,
      required this.role,
      this.userBirth,
      this.userGender});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "userPassword": userPassword,
        "userEmail": userEmail,
        "userBirth": DateFormat('yyyy-MM-dd').format(userBirth!),
        "userGender": userGender,
        "role": role,
      };
}

class LoginReqDTO {
  final String userId;
  final String userPassword;

  LoginReqDTO({required this.userId, required this.userPassword});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "userPassword": userPassword};
}

class UserUpdateReqDTO {
  final String userId;
  final String userPassword;
  final String username;
  final String userEmail;
  final DateTime? userBirth;
  final String? userGender;
  final String role;

  UserUpdateReqDTO(
      {required this.userId,
      required this.userPassword,
      required this.username,
      required this.userEmail,
      required this.role,
      this.userBirth,
      this.userGender});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "userPassword": userPassword,
        "userEmail": userEmail,
        "userBirth": DateFormat('yyyy-MM-dd').format(userBirth!),
        "userGender": userGender,
        "role": role,
      };
}

class UpdateCheckDTO {
  final String userId;
  final String userPassword;

  UpdateCheckDTO({
    required this.userId,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userPassword": userPassword,
      };
}
