import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_blog/ui/widgets/cart_items/custom_cart_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_discount_and_price.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_thumbnail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../_core/constants/color.dart';
import 'product_seller_and_title.dart';

class CustomProductItem extends ConsumerWidget {
  final int? productId;
  final String? images;
  final String? sellerName;
  final String? productTitle;
  final int? disablePrice;
  final int? discountRate;
  final int? totalPrice;
  final int index;

  const CustomProductItem({
    super.key,
    this.productId,
    this.images,
    required this.index,
    this.sellerName,
    this.productTitle,
    this.disablePrice,
    this.discountRate,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                tabController: null,
                productId: productId!,
              ),
            ),
          );
        },
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
                ProductSellerAndTitle(
                  productTitle: productTitle,
                  sellerName: sellerName,
                ),
                ProductDiscountAndPrice(
                  disablePrice: disablePrice,
                  discountRate: discountRate,
                  totalPrice: totalPrice,
                ),
                CustomReviewIcon(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
