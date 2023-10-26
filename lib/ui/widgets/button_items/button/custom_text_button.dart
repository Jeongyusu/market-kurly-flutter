import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final funPageRoute;
  final EdgeInsets? contentPadding;

  const CustomTextButton(this.text, this.funPageRoute,
      {Key? key, this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: funPageRoute,
      style: TextButton.styleFrom(
        padding: contentPadding, // contentPadding을 여기서 적용
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: primaryColor,
        ),
      ),
    );
  }
}
