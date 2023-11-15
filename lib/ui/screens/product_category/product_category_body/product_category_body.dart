import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_list.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCategoryBody extends StatefulWidget {
  final int? index;
  final int categoryId;
  const ProductCategoryBody({
    Key? key,
    required this.categoryId,
    this.index,
  }) : super(key: key);

  @override
  State<ProductCategoryBody> createState() => _ProductCategoryBodyState();
}

class _ProductCategoryBodyState extends State<ProductCategoryBody> {
  late int selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        CategoryModel? categoryModel = ref.watch(categoryListProvider);
        ProductListModel? productListModel =
            ref.watch(productCategoryListProvider(widget.categoryId));
        return CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            CustomNavAppBar(
              text:
                  categoryModel!.categorys[selectedCategory].categoryType ?? "",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ProductCountAndFilter(),
            SliverPadding(
              sliver: SliverToBoxAdapter(
                child: ProductCategoryList(
                  categoryId: productListModel
                      ?.productList?.result[selectedCategory].productId,
                  productOneList:
                      productListModel?.productList?.result.toList(),
                ),
              ),
              padding: EdgeInsets.all(16.0),
            ),
          ],
        );
      },
    );
  }
}
