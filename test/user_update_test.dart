// import 'package:flutter/cupertino.dart';
// import 'package:flutter_blog/_core/constants/size.dart';
// import 'package:flutter_blog/_core/utils/validator_util.dart';
// import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
// import 'package:flutter_blog/data/model/user.dart';
// import 'package:flutter_blog/data/store/session_store.dart';
// import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_gender_radio_button.dart';
// import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
// import 'package:flutter_blog/ui/screens/my_info/body/my_info_update_view_model.dart';
// import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
// import 'package:flutter_blog/ui/widgets/custom_date_picker.dart';
// import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// void main() async {
//   UserUpdateReqDTO userUpdateDTO = UserUpdateReqDTO(
//       username: "정정정",
//       userPassword: "1234",
//       userEmail: "12312@naver.com",
//       userBirth: DateTime(1992 - 10 - 14),
//       userGender: "WOMAN",
//       role: "NORMAL");
//   await SessionStore().userUpdate(userUpdateDTO);
// }
//
// class MyInfoUpdateForm extends ConsumerWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _userId = TextEditingController();
//   final _userName = TextEditingController();
//   final _userPassword = TextEditingController();
//   final _userConfirmPassword = TextEditingController();
//   final _userEmail = TextEditingController();
//   final _userGender = TextEditingController();
//
//   final User? user;
//   MyInfoUpdateForm({this.user, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     MyInfoUpdateFormModel? myInfoUpdateFormModel =
//         ref.watch(myInfoUpdateFormProvider);
//     SessionStore? sessionStore = ref.read(sessionProvider);
//
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Expanded(
//                   child: CustomJoinTextFormField(
//                     controller: _userId,
//                     text: "아이디",
//                     funValidator: validateUsername(),
//                     enabled: false,
//                     placeholderText: "${sessionStore!.user!.userId}",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: mediumGap),
//           CustomJoinTextFormField(
//             controller: _userPassword,
//             text: "비밀번호",
//             placeholderText: "비밀번호를 입력해주세요",
//             obscureText: false,
//             funValidator: validatePassword(),
//           ),
//           const SizedBox(height: mediumGap),
//           CustomJoinTextFormField(
//             controller: _userConfirmPassword,
//             text: "비밀번호 확인",
//             placeholderText: "비밀번호를 한번 더 입력해주세요",
//             obscureText: true,
//             funValidator: validatePassword(),
//           ),
//           const SizedBox(height: mediumGap),
//           CustomJoinTextFormField(
//             controller: _userName,
//             text: "이름",
//             enabled: false,
//             funValidator: validateUsername(),
//             placeholderText: "${sessionStore!.user!.username}",
//           ),
//           const SizedBox(height: mediumGap),
//           CustomJoinTextFormField(
//             controller: _userEmail,
//             text: "이메일",
//             placeholderText: "${sessionStore!.user!.userEmail}",
//             obscureText: false,
//             funValidator: validateEmail(),
//             enabled: true,
//           ),
//           const SizedBox(height: mediumGap),
//           DatePicker(),
//           const SizedBox(height: mediumGap),
//           JoinGenderRadioButton(),
//           const SizedBox(height: mediumGap),
//           CustomLineBold(),
//           const SizedBox(height: mediumGap),
//           CustomElevatedButton(
//             text: "수정하기",
//             funPageRoute: () {
//               if (_formKey.currentState!.validate()) {
//                 UserUpdateReqDTO userUpdateDTO = UserUpdateReqDTO(
//                     username: _userName.text,
//                     userPassword: _userPassword.text,
//                     userEmail: _userEmail.text,
//                     userBirth: myInfoUpdateFormModel?.userBirth ?? null,
//                     userGender: myInfoUpdateFormModel?.userGender ?? null,
//                     role: "NORMAL");
//                 ref.read(sessionProvider).userUpdate(userUpdateDTO);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
