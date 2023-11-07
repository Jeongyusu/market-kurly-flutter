import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_rating_bar_item.dart';

class ProductReviewRating extends StatelessWidget {
  const ProductReviewRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "상품 평가",
            style: subTitleSmall(),
          ),
          SizedBox(height: xsmallGap),
          Text(
            "이 상품의 품질에 대해 얼마나 만족하시나요?",
            style: subContents(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ProductRatingBarItem(),
            ),
          ),
        ],
      ),
    );
  }
}
