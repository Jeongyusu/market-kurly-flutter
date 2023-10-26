import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomLineRegular extends StatelessWidget {
  const CustomLineRegular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: bgAndLineColor, // 선의 색상 설정
            width: 5.0, // 선의 두께 설정
          ),
        ),
      ),
    );
  }
}
