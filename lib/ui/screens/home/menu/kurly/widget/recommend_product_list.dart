import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class RecommendProductList extends ConsumerWidget {
  final int? categoryId;
  final List<ProductRandomMainDTO>? productRecommendList;

  const RecommendProductList({
    this.categoryId,
    this.productRecommendList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productMainListProvider);
    String imgUrl = dio.options.baseUrl;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.43,
        ),
        itemCount: productRecommendList!.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductItem(
            categoryId: productRecommendList![index].categoryId,
            productId: productRecommendList![index].productId,
            images: "${imgUrl}${productRecommendList![index].productThumbnail}",
            sellerName: productRecommendList![index].sellerName,
            productTitle: productRecommendList![index].productName,
            disablePrice: productRecommendList![index].discountedminOptionPrice,
            discountRate: productRecommendList![index].discountRate,
            totalPrice: productRecommendList![index].minOptionPrice,
            reviewGrade: productRecommendList![index].avgStarCount,
          );
        },
      ),
    );
  }
}
