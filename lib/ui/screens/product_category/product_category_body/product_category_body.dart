import 'package:flutter/material.dart';

import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_view_model.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_filter_dropdown.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_count.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_category.dart';
import 'package:flutter_blog/ui/widgets/product_items/product_count_and_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class ProductCategoryBody extends ConsumerWidget {
  const ProductCategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imgUrl = dio.options.baseUrl;
    CategoryModel? categoryModel = ref.read(categoryListProvider);
    ProductCategoryModel? productCategoryModel =
        ref.read(productCategoryProvider(categoryModel!.selectedcategoryId!));
    if (productCategoryModel == null || categoryModel == null) {
      Future.delayed(Duration(microseconds: 4000));
      return Center(child: CircularProgressIndicator());
    } else {
      return CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          CustomNavAppBar(
            text: categoryModel!.selectedCategoryName!,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.43,
                ),
                itemCount: productCategoryModel!.productListDTO.result.length,
                itemBuilder: (context, index) {
                  Logger().d("$index 번째 아이템 생성 중");
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 4.0, bottom: 0.0),
                    child: CustomProductItem(
                      productId: productCategoryModel!
                          .productListDTO.result[index].productId,
                      images:
                          "${imgUrl}${productCategoryModel!.productListDTO.result[index].productThumnail}",
                      sellerName: productCategoryModel!
                          .productListDTO.result[index].sellerName,
                      discountRate: productCategoryModel!
                          .productListDTO.result[index].discountRate,
                      disablePrice: productCategoryModel!
                          .productListDTO.result[index].originPrice,
                      productTitle: productCategoryModel!
                          .productListDTO.result[index].productName,
                      totalPrice: productCategoryModel!
                          .productListDTO.result[index].discountedPrice,
                      reviewGrade: productCategoryModel!
                          .productListDTO.result[index].averageStarCount,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
  }
}
