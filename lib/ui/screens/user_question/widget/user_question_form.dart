import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_dropdown2.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';

class UserQuestionForm extends StatelessWidget {
  const UserQuestionForm({
    super.key,
    required this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "문의 유형",
                      style: basicTextSmallAndBold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          Container(width: 400, child: UserQuestionDropdown2()),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "문의 유형",
                  style: basicTextSmallAndBold(),
                ),
                Container(
                  width: 360,
                  child: CustomLoginTextFormField(
                      placeholderText: "제목을 입력해주세요",
                      funValidator: validateContent(),
                      controller: controller ?? TextEditingController()),
                ),
                Container(
                  height: 160,
                  child: CustomTextArea(
                      hintText: "문의하실 내용을 입력해주세요. (0/5,000)",
                      funValidator: validateContent(),
                      contents: controller ?? TextEditingController()),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
