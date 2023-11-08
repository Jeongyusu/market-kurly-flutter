// 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoUpdateFormModel {
  String userId;
  String userPassword;
  String userConfirmPassword;
  String username;
  String userEmail;
  DateTime? userBirth;
  String? userGender;

  MyInfoUpdateFormModel(
      {required this.userId,
      required this.userPassword,
      required this.userConfirmPassword,
      required this.username,
      required this.userEmail,
      this.userBirth,
      this.userGender});

  @override
  String toString() {
    return 'JoinFormModel{userId: $userId, userPassword: $userPassword, userConfirmPassword: $userConfirmPassword, username: $username, userEmail: $userEmail, userBirth: $userBirth, userGender: $userGender},';
  }
}

// 창고
class MyInfoUpdateFormViewModel extends StateNotifier<MyInfoUpdateFormModel> {
  MyInfoUpdateFormViewModel(super.state);

  void setUserId(String value) {
    MyInfoUpdateFormModel model = state!;
    model.userId = value;
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.userPassword = value;
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.userConfirmPassword = value;
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.username = value;
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.userEmail = value;
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.userBirth = value; // 문자열을 Datetime으로 파싱
    state = MyInfoUpdateFormModel(
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
    MyInfoUpdateFormModel model = state!;
    model.userGender = value;
    state = MyInfoUpdateFormModel(
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
final myInfoUpdateFormProvider = StateNotifierProvider.autoDispose<
    MyInfoUpdateFormViewModel, MyInfoUpdateFormModel?>((ref) {
  return MyInfoUpdateFormViewModel(MyInfoUpdateFormModel(
      userId: "",
      userPassword: "",
      userConfirmPassword: "",
      username: "",
      userEmail: "",
      userBirth: DateTime.now(),
      userGender: ""));
});
