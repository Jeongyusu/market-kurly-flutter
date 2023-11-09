import 'package:intl/intl.dart';

class User {
  int id;
  String userId; // 인증시 필요한 필드
  String username;
  String userEmail;
  DateTime userBirth;
  String userGender;
  String role;

  User({
    required this.id,
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.userBirth,
    required this.userGender,
    required this.role,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "username": username,
        "userEmail": userEmail,
        "userBirth": userBirth,
        "userGender": userGender,
        "role": role,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        username = json["username"],
        userEmail = json["userEmail"],
        userBirth = DateTime.parse(json["userBirth"]),
        userGender = json["userGender"],
        role = json["role"];

  @override
  String toString() {
    return 'User{username: $username, email: $userEmail}';
  }
}
