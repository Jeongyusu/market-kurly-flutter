import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_img.dart';

class ProductReviewImgList extends StatelessWidget {
  const ProductReviewImgList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductReviewImg(),
        ProductReviewImg(),
        ProductReviewImg(),
        ProductReviewImg(),
        ProductReviewImg(),
      ],
    );
  }
}
