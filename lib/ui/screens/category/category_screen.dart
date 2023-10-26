import 'package:flutter/material.dart';

import 'widget/category_product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryProducts(),
    );
  }
}
