import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class HotProductList extends ConsumerWidget {
  final int? categoryId;
  final List<ProductStarMainDTO>? productHotList;

  const HotProductList({
    this.categoryId,
    this.productHotList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productMainListProvider);

    final int index;
    String imgUrl = dio.options.baseUrl;
    ProductMainListsDTO? productHotLists = model!.productMainList;
    Logger().d("${productHotLists!.productStarMainDTOs[0].productName}");
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          childAspectRatio: 0.43,
        ),
        itemCount: productHotList!.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomProductItem(
            categoryId: productHotList![index].categoryId,
            productId: productHotList![index].productId,
            images: "${imgUrl}${productHotList![index].productThumbnail}",
            sellerName: productHotList![index].sellerName,
            productTitle: productHotList![index].productName,
            disablePrice: productHotList![index].discountedminOptionPrice,
            discountRate: productHotList![index].discountRate,
            totalPrice: productHotList![index].minOptionPrice,
            reviewGrade: productHotList![index].avgStarCount,
          );
        },
      ),
    );
  }
}
