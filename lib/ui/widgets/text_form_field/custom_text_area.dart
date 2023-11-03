import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomTextArea extends StatelessWidget {
  final hintText;
  final funValidator;
  final TextEditingController controller;
  final String initValue;

  const CustomTextArea({
    Key? key,
    required this.funValidator,
    required this.controller,
    required this.hintText,
    this.initValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = initValue;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        maxLines: 10,
        validator: funValidator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: "$hintText",
          hintStyle: TextStyle(
            color: formColor,
            fontSize: 14,
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
    );
  }
}
