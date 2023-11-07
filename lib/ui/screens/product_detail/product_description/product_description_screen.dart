import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_body/product_description_body.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final int productId;
  const ProductDescriptionScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDescriptionBody(productId: productId),
    );
  }
}
