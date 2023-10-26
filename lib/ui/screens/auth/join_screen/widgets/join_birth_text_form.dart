import 'package:flutter/material.dart';

class JoinBirthTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  JoinBirthTextForm({
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // 오른쪽 테두리 스타일을 정의
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // 오른쪽 테두리 색상
            width: 2.0, // 오른쪽 테두리 두께
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // 오른쪽 테두리 색상
            width: 2.0, // 오른쪽 테두리 두께
          ),
        ),
      ),
    );
  }
}
