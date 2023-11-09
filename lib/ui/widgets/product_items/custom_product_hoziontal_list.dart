import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomProductHorizontalList extends ConsumerWidget {
  final int? productId;
  final String? images;
  final String? sellerName;
  final String? productTitle;
  final int? disablePrice;
  final int? discountRate;
  final int? totalPrice;
  final int index;

  const CustomProductHorizontalList({
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
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images!.length,
        itemExtent: 150,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CustomProductItem(
              images: images,
              productId: productId,
              sellerName: sellerName,
              productTitle: productTitle,
              disablePrice: disablePrice,
              discountRate: discountRate,
              totalPrice: totalPrice,
            ),
          );
        },
      ),
    );
  }
}
