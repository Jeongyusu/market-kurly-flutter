import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductCategoryList extends ConsumerWidget {
  final int? categoryId;
  final List<ProductSummary>? productOneList;

  const ProductCategoryList({
    this.categoryId,
    this.productOneList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model =
        ref.watch(productCategoryListProvider(categoryId ?? 0));
    String imgUrl = dio.options.baseUrl;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.43,
        ),
        itemCount: productOneList!.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductItem(
            categoryId: model!.productList!.result[index].categoryId,
            productId: model!.productList!.result[index].productId,
            images: "${imgUrl}${productOneList![index].productThumnail}",
            sellerName: productOneList![index].sellerName,
            discountRate: productOneList![index].discountRate,
            disablePrice: productOneList![index].originPrice,
            productTitle: productOneList![index].productName,
            totalPrice: productOneList![index].discountedPrice,
            reviewGrade: productOneList![index].averageStarCount,
          );
        },
      ),
    );
  }
}
