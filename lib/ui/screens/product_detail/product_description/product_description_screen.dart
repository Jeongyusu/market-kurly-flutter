import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_body/product_description_body.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDescriptionBody(),
    );
  }
}
