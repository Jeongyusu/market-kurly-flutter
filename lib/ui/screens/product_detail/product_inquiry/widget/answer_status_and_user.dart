import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/widgets/line/custom_text_line_item.dart';

class AnswerStatusAndUser extends StatelessWidget {
  final String answerStatus;
  final TextStyle statusStyle;
  final String userName;
  const AnswerStatusAndUser({
    super.key,
    required this.answerStatus,
    required this.userName,
    required this.statusStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${answerStatus}",
          style: statusStyle,
        ),
        CustomTextLineItem(),
        Text(
          "${userName}",
          style: subContents(),
        ),
      ],
    );
  }
}
