import 'package:flutter/material.dart';

class TextSpaceBetweenItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final TextStyle leftTextStyle;
  final TextStyle rightTextStyle;

  const TextSpaceBetweenItem({
    Key? key,
    required this.leftText,
    required this.rightText,
    required this.leftTextStyle,
    required this.rightTextStyle,
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
