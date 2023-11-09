import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KurlySaleProductList extends ConsumerWidget {
  final String? images;

  const KurlySaleProductList({
    super.key,
    this.images,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productMainListProvider);
    String imgUrl = dio.options.baseUrl;

    if (model == null) {
      return SliverToBoxAdapter(
          child: const Center(child: CircularProgressIndicator()));
    } else {
      ProductMainListsDTO? productSaleList = model.productMainList;
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            height: 410,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images?.length,
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CustomProductItem(
                    productId: productSaleList!
                        .productDiscountMainDTOs[index].productId,
                    images:
                        "${imgUrl}${productSaleList!.productDiscountMainDTOs[index].productThumbnail}",
                    sellerName:
                        "[ ${productSaleList!.productDiscountMainDTOs[index].sellerName} ]",
                    productTitle: productSaleList!
                        .productDiscountMainDTOs[index].productName,
                    disablePrice: productSaleList!
                        .productDiscountMainDTOs[index]
                        .discountedminOptionPrice,
                    discountRate: productSaleList!
                        .productDiscountMainDTOs[index].discountRate,
                    totalPrice: productSaleList!
                        .productDiscountMainDTOs[index].minOptionPrice,
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
