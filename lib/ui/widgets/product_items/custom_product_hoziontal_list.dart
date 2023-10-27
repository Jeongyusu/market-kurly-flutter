import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';

class CustomProductHorizontalList extends StatelessWidget {
  const CustomProductHorizontalList({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 355,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomProductItem(images: images, index: index),
          );
        },
      ),
    );
  }
}
