import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({Key? key, this.images, this.index});

  final String? images;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(
          "${images}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
