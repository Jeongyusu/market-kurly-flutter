import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/category/category_body/category_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryBody(),
    );
  }
}
