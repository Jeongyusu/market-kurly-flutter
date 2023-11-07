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

class CustomProductGrid extends StatelessWidget {
  const CustomProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomProductItem(index: index);
        },
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        crossAxisSpacing: 12,
        childAspectRatio: 0.46,
      ),
    );
  }
}
