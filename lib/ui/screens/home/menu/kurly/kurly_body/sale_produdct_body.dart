import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/home/menu/best/widget/best_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/hot_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/kurly_hot_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/recommend_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/sale_product_list.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_category.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaleProductBody extends ConsumerStatefulWidget {
  const SaleProductBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SaleProductBody> createState() => _SaleProductBodyState();
}

class _SaleProductBodyState extends ConsumerState<SaleProductBody> {
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
    ProductListModel? productListModel = ref.watch(productMainListProvider);
    List<ProductDiscountMainDTO>? productSaleProducts =
        productListModel?.productMainList?.productDiscountMainDTOs;

    if (productListModel == null || categoryType == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return CustomScrollView(
        slivers: [
          CustomNavAppBar(
            text: "초특가 반값 SALE",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ProductCountAndFilter(count: productSaleProducts!.length),
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
            child: SaleProductList(
              categoryId: selectedCategory,
              productSaleList: productListModel
                  ?.productMainList?.productDiscountMainDTOs
                  .where((e) => e.categoryId == selectedCategory + 1)
                  .toList(),
            ),
          ),
        ],
      );
    }
  }
}
