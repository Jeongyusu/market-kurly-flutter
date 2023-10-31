import 'package:flutter/material.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({
    super.key,
    required this.images,
    required this.index,
  });

  final List<String> images;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
