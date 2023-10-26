import 'package:flutter/material.dart';

class TextSpaceBetweenItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final TextStyle leftTextStyle; // 왼쪽 텍스트 스타일
  final TextStyle rightTextStyle; // 오른쪽 텍스트 스타일

  const TextSpaceBetweenItem({
    Key? key,
    required this.leftText,
    required this.rightText,
    required this.leftTextStyle,
    required this.rightTextStyle, // 기본 색상 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftText, style: leftTextStyle),
          Text(rightText, style: rightTextStyle),
        ],
      ),
    );
  }
}
