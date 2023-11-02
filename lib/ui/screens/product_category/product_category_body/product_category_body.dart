import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_grid.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
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
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        CustomNavAppBar(
          text: "지금 가장 핫한 상품",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // 드롭다운
        SliverAppBar(
          toolbarHeight: 30,
          title: Text('0'),
          pinned: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: basicColorW,
          titleSpacing: 0,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '총 182 개',
                    style: strongTextSmall(),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0), // Dropdown 버튼 간격 조절
                child: DropdownButton2<String>(
                  value: _selectedValue,
                  style: TextStyle(),
                  alignment: Alignment.centerRight,
                  items: _valueList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: basicTextSmall(),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value ?? "첫 번째";
                    });
                  },
                  underline: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 90,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 18,
                    iconEnabledColor: basicColorB3,
                    iconDisabledColor: basicColorB9,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 8, right: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
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
              ProductCategoryGrid(images: images),
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
