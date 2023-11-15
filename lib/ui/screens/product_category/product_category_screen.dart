import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_body/product_category_body.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCategoryScreen extends ConsumerWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? categoryModel =ref.read(categoryListProvider);
    ProductCategoryModel? model = ref.read(productCategoryProvider(categoryModel!.selectedcategoryId!));
    return Scaffold(
      body: ProductCategoryBody(),
    );
  }
}
