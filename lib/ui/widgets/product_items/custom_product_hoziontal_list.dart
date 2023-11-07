import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';

class CustomProductHorizontalList extends StatelessWidget {
  const CustomProductHorizontalList({
    super.key,
    this.images,
  });

  final String? images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images!.length,
        itemExtent: 150,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CustomProductItem(images: images, index: index),
          );
        },
      ),
    );
  }
}
