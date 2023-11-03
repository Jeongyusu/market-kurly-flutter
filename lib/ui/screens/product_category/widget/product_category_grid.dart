import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_cart_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_discount_and_price.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_seller_and_title.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_thumbnail.dart';

class ProductCategoryGrid extends StatelessWidget {
  const ProductCategoryGrid({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.43,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductItem(
            images: images,
            index: index,
          );
        },
      ),
    );
  }
}