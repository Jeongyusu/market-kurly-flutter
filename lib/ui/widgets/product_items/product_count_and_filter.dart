import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_filter_dropdown.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_count.dart';

class ProductCountAndFilter extends StatelessWidget {
  final int? count;
  ProductCountAndFilter({
    Key? key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      title: Text('0'),
      pinned: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: basicColorW,
      titleSpacing: 0,
      flexibleSpace: ProductItemCount(count: count),
      actions: [
        CustomFilterDropdown(),
      ],
    );
  }
}
