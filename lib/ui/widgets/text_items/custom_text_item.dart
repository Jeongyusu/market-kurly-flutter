import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomTextItem extends StatelessWidget {
  final String text;
  final String subtext;
  final TextStyle style;
  final TextStyle subStyle;
  const CustomTextItem({
    super.key,
    required this.text,
    required this.subtext,
    required this.style,
    required this.subStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${text}",
          style: style,
        ),
        SizedBox(
          width: xsmallGap,
        ),
        Text(
          "${subtext}",
          style: subStyle,
        ),
      ],
    );
  }
}
