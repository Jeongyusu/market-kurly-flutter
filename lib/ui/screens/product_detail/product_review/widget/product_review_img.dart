import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_img_screen.dart';

class ProductReviewImg extends StatelessWidget {
  const ProductReviewImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductReviewImgScreen()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/images/product01.jpg",
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
