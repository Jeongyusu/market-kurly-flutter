import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request/user_request.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomLoginTextFormField(
            placeholderText: "아이디를 입력해주세요",
            obscureText: false,
            funValidator: validateUsername(),
            controller: _username,
          ),
          const SizedBox(height: xsmallGap),
          CustomLoginTextFormField(
            placeholderText: "비밀번호를 입력해주세요",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _password,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                LoginReqDTO loginReqDTO = LoginReqDTO(
                    username: _username.text, password: _password.text);
                ref.read(sessionProvider).login(loginReqDTO);
              }
            },
          ),
        ],
      ),
    );
  }
}
