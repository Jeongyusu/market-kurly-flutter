import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class CustomLoginTextFormField extends StatelessWidget {
  final String placeholderText;
  final bool obscureText;
  final funValidator;
  final TextEditingController controller;

  const CustomLoginTextFormField({
    Key? key,
    required this.placeholderText,
    this.obscureText = false,
    required this.funValidator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: smallGap),
        TextFormField(
          cursorColor: primaryColor,
          controller: controller,
          validator: funValidator,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            hintText: "$placeholderText",
            hintStyle: TextStyle(
              color: formColor,
              fontSize: 13,
            ),
            enabledBorder: OutlineInputBorder(
              // 3. 기본 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: formColor),
            ),
            focusedBorder: OutlineInputBorder(
              // 4. 손가락 터치시 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              // 5. 에러발생시 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // 5. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
