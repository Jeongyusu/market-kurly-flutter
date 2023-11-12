import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KurlyRecommendProductList extends ConsumerWidget {
  final String? images;

  const KurlyRecommendProductList({
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
      ProductMainListsDTO? productRecommendList = model.productMainList;
      return SliverPadding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CustomProductItem(
                productId: productRecommendList!
                    .productRandomMainDTOs[index].productId,
                images:
                    "${imgUrl}${productRecommendList!.productRandomMainDTOs[index].productThumbnail}",
                sellerName: productRecommendList!
                    .productRandomMainDTOs[index].sellerName,
                productTitle: productRecommendList!
                    .productRandomMainDTOs[index].productName,
                disablePrice: productRecommendList!
                    .productRandomMainDTOs[index].discountedminOptionPrice,
                discountRate: productRecommendList!
                    .productRandomMainDTOs[index].discountRate,
                totalPrice: productRecommendList!
                    .productRandomMainDTOs[index].minOptionPrice,
                reviewGrade: productRecommendList
                    .productStarMainDTOs[index].avgStarCount,
              );
            },
            childCount: 4,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            crossAxisSpacing: 12,
            childAspectRatio: 0.42,
          ),
        ),
      );
    }
  }
}
