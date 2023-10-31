import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_cart_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_discount_and_price.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_thumbnail.dart';

import '../../../_core/constants/color.dart';
import 'product_seller_and_title.dart';

class CustomProductItem extends StatelessWidget {
  final int index;
  const CustomProductItem({
    super.key,
    required this.images,
    required this.index,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductThumbnail(images: images, index: index),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CustomCartButton(),
                ),
                ProductSellerAndTitle(),
                ProductDiscountAndPrice(),
                CustomReviewIcon(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
