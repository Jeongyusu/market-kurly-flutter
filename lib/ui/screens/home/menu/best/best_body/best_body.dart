import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/menu/best/widget/best_product_list.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_grid.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestBody extends StatefulWidget {
  const BestBody({
    super.key,
  });

  @override
  State<BestBody> createState() => _BestBodyState();
}

class _BestBodyState extends State<BestBody> {
  final List<String> categoryTitle = [
    '한식,양식 중식',
    '중식, 한식,양식 중식',
    '양식,한식,양식 중식',
    '양식',
  ];

  int selectedCategory = 0;

  void onCategorySelected(int categoryId) {
    print("Category $categoryId selected");
    setState(() {
      selectedCategory = categoryId;
    });
  }

  String _selectedValue = "평점순";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProductCountAndFilter(count: 48),
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
              BestProductList(),
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
