import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_form.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widget/user_question_bottom_appbar.dart';
import 'widget/user_question_dropdown2.dart';

class CustomerQuestionScreen extends ConsumerWidget {
  final TextEditingController? controller;
  const CustomerQuestionScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
        title: Text(
          "문의작성",
          style: subTitleBold(),
        ),
      ),
      body: UserQuestionForm(controller: controller),
      bottomNavigationBar:
          UserQuestionBottomAppbar(text: "등록하기", funPageRoute: () {}),
    );
  }
}
