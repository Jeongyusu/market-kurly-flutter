import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class ProductDiscountAndPrice extends StatelessWidget {
  final int? disablePrice;
  final int? discountRate;
  final int? totalPrice;
  const ProductDiscountAndPrice({
    super.key,
    this.disablePrice,
    this.discountRate,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${disablePrice}원",
          style: disabledText(),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${discountRate} %",
                style: discountText(),
              ),
              WidgetSpan(
                child: SizedBox(width: smallGap),
              ),
              TextSpan(
                text: "${totalPrice}~",
                style: subTitleReqular(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
