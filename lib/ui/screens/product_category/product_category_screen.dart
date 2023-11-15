import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_body/product_category_body.dart';

class ProductCategoryScreen extends StatelessWidget {
  final int? categoryId;
  const ProductCategoryScreen({super.key, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductCategoryBody(
        categoryId: categoryId!,
      ),
    );
  }
}
