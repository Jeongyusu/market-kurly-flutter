import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10, // 선의 높이를 조절하여 선의 두께를 설정
      color: bgAndLineColor, // 선의 색상 설정
    );
  }
}
