import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_grid.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_filter_dropdown.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_count.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_category.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCategoryBody extends StatefulWidget {
  const ProductCategoryBody({Key? key}) : super(key: key);

  @override
  State<ProductCategoryBody> createState() => _ProductCategoryBodyState();
}

class _ProductCategoryBodyState extends State<ProductCategoryBody> {
  final List<String> imagePaths = [
    'assets/images/banner_01.png',
    'assets/images/banner_02.png',
    'assets/images/banner_03.png',
    'assets/images/banner_04.png',
  ];

  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  final List<String> categoryTitle = [
    '한식,양식 중식',
    '중식, 한식,양식 중식',
    '양식,한식',
    '한식,양식',
    '중식, 한식,양식',
  ];

  int selectedCategory = 0;

  void onCategorySelected(int categoryId) {
    print("Category $categoryId selected"); // 디버깅 메시지
    setState(() {
      selectedCategory = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        CustomNavAppBar(
          text: "지금 가장 핫한 상품",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ProductCountAndFilter(),
        // 카테고리
        SliverToBoxAdapter(
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
        ),
        SliverFillRemaining(
          child: IndexedStack(
            index: selectedCategory,
            children: [
              // ProductCategoryGrid(images: images),
              Center(child: Text("트렌드")),
              Center(child: Text("라이프")),
              Center(child: Text("힐링")),
              Center(child: Text("지적교양")),
              Center(child: Text("소설")),
            ],
          ),
        ),
      ],
    );
  }
}
