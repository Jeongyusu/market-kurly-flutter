import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class UserQuestionCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // 카메라 또는 갤러리 열기 및 사진 촬영 또는 선택 메서드 실행
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: formColor, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.camera_alt, // 카메라 아이콘
              size: 30,
              color: formColor,
            ),
          ),
        ),
      ],
    );
  }
}
