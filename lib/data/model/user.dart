import 'package:intl/intl.dart';

class User {
  String userId; // 인증시 필요한 필드
  String username;
  String userEmail;


  User({
    required this.userId,
    required this.username,
    required this.userEmail,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "userEmail": userEmail,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      // : id = json["id"],
        :
        userId = json["userId"],
        username = json["username"],
        userEmail = json["userEmail"];


  @override
  String toString() {
    return 'User{username: $username, email: $userEmail}';
  }
}
