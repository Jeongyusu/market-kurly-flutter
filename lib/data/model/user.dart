import 'package:intl/intl.dart';

class User {
  int? id;
  String userId; // 인증시 필요한 필드
  String username;
  String userEmail;
  DateTime? created;
  DateTime? updated;

  User({
    this.id,
    required this.userId,
    required this.username,
    required this.userEmail,
    this.created,
    this.updated,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "userEmail": userEmail,
        "created": created,
        "updated": updated
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      // : id = json["id"],
        :
        userId = json["userId"],
        username = json["username"],
        userEmail = json["userEmail"];
        // created = DateFormat("yyyy-mm-dd").parse(json["created"]), // 3
        // updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $userEmail, created: $created, updated: $updated}';
  }
}
