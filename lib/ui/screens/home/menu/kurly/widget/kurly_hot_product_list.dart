import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KurlyHotProductList extends ConsumerWidget {
  final String? images;

  const KurlyHotProductList({
    this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productMainListProvider);
    String imgUrl = dio.options.baseUrl;

    if (model == null) {
      return SliverToBoxAdapter(
          child: const Center(child: CircularProgressIndicator()));
    } else {
      ProductMainListsDTO? productHotList = model.productMainList;
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 410,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CustomProductItem(
                    productId:
                        productHotList!.productStarMainDTOs[index].productId,
                    images:
                        "${imgUrl}${productHotList!.productStarMainDTOs[index].productThumbnail}",
                    sellerName:
                        productHotList!.productStarMainDTOs[index].sellerName,
                    productTitle:
                        productHotList!.productStarMainDTOs[index].productName,
                    disablePrice: productHotList!
                        .productStarMainDTOs[index].discountedminOptionPrice,
                    discountRate:
                        productHotList!.productStarMainDTOs[index].discountRate,
                    totalPrice: productHotList!
                        .productStarMainDTOs[index].minOptionPrice,
                    reviewGrade:
                        productHotList!.productStarMainDTOs[index].avgStarCount,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
