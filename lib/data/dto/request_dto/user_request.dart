import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';

class JoinReqDTO {
  final String userId;
  final String userPassword;
  final String username;
  final String userEmail;
  final String? userBirth;
  final String? userGender;

  JoinReqDTO(
      {required this.userId,
      required this.userPassword,
      required this.username,
      required this.userEmail,
      this.userBirth,
      this.userGender});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "userPassword": userPassword,
        "userEmail": userEmail,
        "userBirth": userBirth,
        "userGender": userGender
      };
}

class LoginReqDTO {
  final String username;
  final String password;

  LoginReqDTO({required this.username, required this.password});

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
