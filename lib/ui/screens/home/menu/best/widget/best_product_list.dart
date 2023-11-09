import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestProductList extends ConsumerWidget {
  const BestProductList({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productBestListProvider);
    String imgUrl = dio.options.baseUrl;

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      ProductListDTO? bestProducts = model.productList;
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            childAspectRatio: 0.43,
          ),
          itemCount: bestProducts!.totalCount,
          itemBuilder: (BuildContext context, int index) {
            return CustomProductItem(
              productId: bestProducts!.result[index].productId,
              images: "${imgUrl}${bestProducts!.result[index].productThumnail}",
              sellerName: bestProducts!.result[index].sellerName,
              discountRate: bestProducts!.result[index].discountRate,
              disablePrice: bestProducts!.result[index].originPrice,
              productTitle: bestProducts!.result[index].productName,
              totalPrice: bestProducts!.result[index].discountedPrice,
            );
          },
        ),
      );
    }
  }
}
