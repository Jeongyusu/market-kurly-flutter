import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_category.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ProductCountAndFilter(
              selectedValue: _selectedValue, valueList: _valueList),
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
                ProductDetailGrid(images: images),
                Center(child: Text("트렌드")),
                Center(child: Text("라이프")),
                Center(child: Text("힐링")),
                Center(child: Text("지적교양")),
                Center(child: Text("소설")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
