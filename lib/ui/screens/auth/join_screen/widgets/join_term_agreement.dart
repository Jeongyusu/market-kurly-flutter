import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';

class JoinTermAgreement extends StatelessWidget {
  const JoinTermAgreement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JoinRichTextItem(
          text: "이용약관동의",
          strong: "*",
        ),
        SizedBox(
          height: mediumGap,
        ),
        CheckBoxItem(
          text: "전체 동의합니다",
        ),
        SizedBox(
          height: smallGap,
        ),
        Text(
          "선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.",
          style: subContents(),
        ),
        SizedBox(
          height: smallGap,
        ),
        CheckBoxItem(
          text: "이용 약관 동의",
          iconSize: 20,
        ),
        SizedBox(
          height: xsmallGap,
        ),
        CheckBoxItem(
          text: "개인정보 수집·이용 동의",
          iconSize: 20,
        ),
        SizedBox(
          height: mediumGap,
        )
      ],
    );
  }
}
