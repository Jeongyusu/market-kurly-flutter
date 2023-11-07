import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_blog/ui/screens/coupon/widget/coupon_bottom_appbar.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_camera.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_drop_down.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_check_box_item.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'widget/user_question_bottom_appbar.dart';
import 'widget/user_question_dropdown2.dart';

class UserQuestionFormScreen extends ConsumerWidget {
  final TextEditingController? controller;
  const UserQuestionFormScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
        title: Text(
          "문의작성",
          style: subTitleBold(),
        ),
      ),
      body: ListView(children: [
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
                        child: Container(
                            width: 400, child: UserQuestionDropdown2()),
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
                        controller: controller ?? TextEditingController()),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  UserQuestionCamera(),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "· 상품과 무관한 내용이거나 음란 및 불법적인 내용은 통보없이 삭제될 수 있습니다.",
                        style: subContentsSmaill(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "· 사진은 최대 8장까지 등록가능합니다.",
                        style: subContentsSmaill(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "이메일",
                        style: basicTextSmallAndBold(),
                      ),
                      Container(
                        width: 360,
                        child: CustomLoginTextFormField(
                            placeholderText: "elozl@naver.com",
                            funValidator: validateContent(),
                            controller: controller ?? TextEditingController()),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          CheckBoxItem(text: "이메일 알림 받기"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar:
          UserQuestionBottomAppbar(text: "등록하기", funPageRoute: () {}),
    );
  }
}
