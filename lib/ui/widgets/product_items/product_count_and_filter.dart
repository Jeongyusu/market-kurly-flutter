import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_filter_dropdown.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_count.dart';

class ProductCountAndFilter extends StatefulWidget {
  const ProductCountAndFilter({
    super.key,
    required String selectedValue,
    required List<String> valueList,
  })  : _selectedValue = selectedValue,
        _valueList = valueList;

  final String _selectedValue;
  final List<String> _valueList;

  @override
  State<ProductCountAndFilter> createState() => _ProductCountAndFilterState();
}

class _ProductCountAndFilterState extends State<ProductCountAndFilter> {
  final List<String> categoryTitle = [
    '한식,양식 중식',
    '중식, 한식,양식 중식',
    '양식,한식,양식 중식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
  ];

  int selectedCategory = 0;

  void onCategorySelected(int categoryId) {
    print("Category $categoryId selected"); // 디버깅 메시지
    setState(() {
      selectedCategory = categoryId;
    });
  }

  final List<String> _valueList = <String>[
    "신상품순",
    "평점순",
    "판매량순",
    "마감인박순",
    "가격순"
  ];
  String _selectedValue = "신상품순";

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
      flexibleSpace: ProductItemCount(count: 32),
      actions: [
        CustomFilterDropdown(
            selectedValue: _selectedValue, valueList: _valueList),
      ],
    );
  }
}
