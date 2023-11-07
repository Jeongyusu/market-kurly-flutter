import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_grid.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewBody extends StatefulWidget {
  const NewBody({
    super.key,
  });

  @override
  State<NewBody> createState() => _BestBodyState();
}

class _BestBodyState extends State<NewBody> {
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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ProductListModel? model = ref.watch(productNewListProvider);
        String imgUrl = dio.options.baseUrl;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                child: Image.asset(
                  "assets/images/new_banner.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.43,
                      ),
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomProductItem(
                          images:
                              "${imgUrl}${model!.productList!.result[index].productThumnail}",
                          sellerName:
                              model!.productList!.result[index].productName,
                          discountRate:
                              model!.productList!.result[index].discountRate,
                          disablePrice:
                              model!.productList!.result[index].originPrice,
                          productTitle:
                              model!.productList!.result[index].productName,
                          totalPrice:
                              model!.productList!.result[index].discountedPrice,
                          index: index,
                        );
                      },
                    ),
                  ),
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
      },
    );
  }
}
