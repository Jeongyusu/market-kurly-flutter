// 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinFormModel {
  String? userId;
  String? userPassword;
  String? userConfirmPassword;
  String? username;
  String? userEmail;
  DateTime? userBirth;
  String? userGender;

  JoinFormModel(
      {this.userId,
      this.userPassword,
      this.userConfirmPassword,
      this.username,
      this.userEmail,
      this.userBirth,
      this.userGender});

  @override
  String toString() {
    return 'JoinFormModel{userId: $userId, userPassword: $userPassword, userConfirmPassword: $userConfirmPassword, username: $username, userEmail: $userEmail, userBirth: $userBirth, userGender: $userGender}';
  }
}

// 창고
class JoinFormViewModel extends StateNotifier<JoinFormModel> {
  JoinFormViewModel(super.state);

  void setUserId(String value) {
    JoinFormModel model = state!;
    model.userId = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUserPassword(String value) {
    JoinFormModel model = state!;
    model.userPassword = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUserConfirmPassword(String value) {
    JoinFormModel model = state!;
    model.userConfirmPassword = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUsername(String value) {
    JoinFormModel model = state!;
    model.username = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUserEmail(String value) {
    JoinFormModel model = state!;
    model.userEmail = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUserBirth(DateTime value) {
    JoinFormModel model = state!;
    model.userBirth = value; // 문자열을 Datetime으로 파싱
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }

  void setUserGender(String value) {
    JoinFormModel model = state!;
    model.userGender = value;
    state = JoinFormModel(
      userId: model.userId,
      userPassword: model.userPassword,
      userConfirmPassword: model.userConfirmPassword,
      username: model.username,
      userEmail: model.userEmail,
      userBirth: model.userBirth,
      userGender: model.userGender,
    );
  }
}

// 창고관리자
final joinFormProvider =
    StateNotifierProvider.autoDispose<JoinFormViewModel, JoinFormModel>((ref) {
  return JoinFormViewModel(JoinFormModel(
      userId: "",
      userPassword: "",
      username: "",
      userEmail: "",
      userBirth: DateTime.now(),
      userGender: ""));
});
