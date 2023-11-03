import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/answer_status_and_user.dart';

class ProductInquiryTitle extends StatelessWidget {
  final String inquiryTitle;
  final TextStyle titleStyle;
  final TextStyle statusStyle;
  final IconData? secretIcon;
  final String answerTitle;
  final String inquiryName;
  const ProductInquiryTitle({
    super.key,
    required this.formattedDate,
    required this.inquiryTitle,
    required this.statusStyle,
    this.secretIcon,
    required this.answerTitle,
    required this.inquiryName,
    required this.titleStyle,
  });

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${inquiryTitle}",
              style: titleStyle,
            ),
            SizedBox(
              height: smallGap,
              width: smallGap,
            ),
            Icon(
              secretIcon,
              size: 20,
              color: formColor,
            ),
          ],
        ),
        SizedBox(
          height: smallGap,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnswerStatusAndUser(
              answerStatus: "답변대기",
              userName: "서태웅",
              statusStyle: statusStyle,
            ),
            Text(
              formattedDate,
              style: subContents(),
            ),
          ],
        ),
      ],
    );
  }
}
