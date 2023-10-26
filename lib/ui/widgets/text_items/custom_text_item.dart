import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomTextItem extends StatelessWidget {
  final String text;
  final String subtext;
  const CustomTextItem({
    super.key,
    required this.text,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${text}",
          style: basicTextBig(),
        ),
        Text(
          "${subtext}",
          style: basicTextBig(),
        ),
      ],
    );
  }
}
