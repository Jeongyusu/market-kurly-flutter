import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class ProductDiscountAndPrice extends StatelessWidget {
  const ProductDiscountAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "2000원",
          style: disabledText(),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "20%",
                style: discountText(),
              ),
              WidgetSpan(
                child: SizedBox(width: smallGap),
              ),
              TextSpan(
                text: "1700원~",
                style: subTitleReqular(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
