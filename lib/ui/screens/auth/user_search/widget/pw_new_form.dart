import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/widgets/custom_date_picker.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_term_agreement.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PwNewForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _userId = TextEditingController();
  final _userPassword = TextEditingController();

  PwNewForm() : super();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomJoinTextFormField(
            text: "새 비밀번호 등록",
            placeholderText: "새 비밀번호 입력",
            obscureText: false,
            funValidator: validatePassword(),
            controller: _userId,
          ),
          SizedBox(
            height: smallGap,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "최소 10글자 이상/영문, 숫자, 특수문자 2개 이상 조합 \n동일한 숫자 3개 이상 연속 사용 불가",
                style: subContents(),
              )),
          SizedBox(
            height: mediumGap,
          ),
          CustomJoinTextFormField(
            text: "새 비밀번호 확인",
            placeholderText: "새 비밀번호 확인",
            obscureText: false,
            funValidator: validatePassword(),
            controller: _userPassword,
          ),
          const SizedBox(height: largeGap),
        ],
      ),
    );
  }
}
