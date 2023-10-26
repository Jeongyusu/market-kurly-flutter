import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request/user_request.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/widgets/custom_date_picker.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_term_agreement.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _userId = TextEditingController();
  final _userPassword = TextEditingController();
  final _userConfirmPassword = TextEditingController();
  final _username = TextEditingController();
  final _userEmail = TextEditingController();
  final _userBirth = DateTime.now();

  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomJoinTextFormField(
            text: "아이디",
            strong: " *",
            placeholderText: "아이디를 입력해주세요",
            obscureText: false,
            funValidator: validateUsername(),
            controller: _username,
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            text: "비밀번호",
            strong: " *",
            placeholderText: "비밀번호를 입력해주세요",
            obscureText: false,
            funValidator: validatePassword(),
            controller: _userPassword,
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            text: "비밀번호 확인",
            strong: " *",
            placeholderText: "비밀번호를 한번 더 입력해주세요",
            obscureText: true,
            funValidator: validatePassword(),
            controller: _userConfirmPassword,
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            text: "이름",
            strong: " *",
            placeholderText: "이름을 입력해주세요",
            obscureText: true,
            funValidator: validateUsername(),
            controller: _username,
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            text: "이메일",
            strong: " *",
            placeholderText: "예) marketkurly@kurly.com",
            obscureText: true,
            funValidator: validateEmail(),
            controller: _userEmail,
          ),
          const SizedBox(height: mediumGap),
          DatePicker(
            onDateChanged: (value) {
              _userBirth;
            },
          ),
          const SizedBox(height: mediumGap),
          RadioButton(),
          const SizedBox(height: mediumGap),
        ],
      ),
    );
  }
}
