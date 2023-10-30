import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_item.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';

class ProductDetailGrid extends StatelessWidget {
  const ProductDetailGrid({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ProductDetailItem(images: images),
    );
  }
}
