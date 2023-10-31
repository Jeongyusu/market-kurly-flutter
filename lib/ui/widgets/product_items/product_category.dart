import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({
    super.key,
    required this.categoryTitle,
    required this.selectedCategory,
  });

  final List<String> categoryTitle;
  final int selectedCategory;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final List<String> categoryTitle = [
    '한식,양식 중식',
    '중식, 한식,양식 중식',
    '양식,한식,양식 중식',
    '양식,양식,한식,양식',
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryTitle.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          onCategorySelected(index);
                        });
                      },
                      style: TextButton.styleFrom(
                        elevation: 2,
                        backgroundColor: selectedCategory == index
                            ? primaryColor02
                            : basicColorW,
                        foregroundColor: selectedCategory == index
                            ? basicColorW
                            : basicColorB9,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(
                            color: selectedCategory == index
                                ? primaryColor02
                                : bgAndLineColor,
                          ),
                        ),
                        minimumSize: Size(0, 40),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        textStyle: TextStyle(
                          color: selectedCategory == index
                              ? basicColorW
                              : primaryColor,
                        ),
                      ),
                      child: Text("${categoryTitle[index]}"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
