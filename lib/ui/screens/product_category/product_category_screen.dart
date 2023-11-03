import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_body/product_category_body.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryBody(),
    );
  }
}