import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/home/menu/new_product/widget/new_product_list.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/widget/product_category_list.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewBody extends ConsumerStatefulWidget {
  const NewBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<NewBody> createState() => _NewBodyState();
}

class _NewBodyState extends ConsumerState<NewBody> {
  int selectedCategory = 0;

  void onCategorySelected(int categoryId) {
    setState(() {
      selectedCategory = categoryId;
    });
  }

  String _selectedValue = "평점순";

  @override
  Widget build(BuildContext context) {
    CategoryModel? categoryType = ref.watch(categoryListProvider);
    ProductListModel? productListModel = ref.watch(productNewListProvider);
    if (productListModel == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
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
          ProductCountAndFilter(
              count: productListModel!.productList!.result.length),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryType!.categorys.length,
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
                            child: Text(
                              "${categoryType!.categorys[index].categoryType}",
                            ),
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
            child: NewProductList(
              categoryId: selectedCategory,
              productOneList: productListModel?.productList?.result
                  .where((e) => e.categoryId == selectedCategory + 1)
                  .toList(),
            ),
          ),
        ],
      );
    }
  }
}
