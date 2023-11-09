import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewProductList extends ConsumerWidget {
  const NewProductList({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productNewListProvider);
    String imgUrl = dio.options.baseUrl;

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      ProductListDTO? newProducts = model.productList;
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            childAspectRatio: 0.43,
          ),
          itemCount: newProducts!.totalCount,
          itemBuilder: (BuildContext context, int index) {
            return CustomProductItem(
              productId: newProducts!.result[index].productId,
              images: "${imgUrl}${newProducts!.result[index].productThumnail}",
              sellerName: newProducts!.result[index].sellerName,
              discountRate: newProducts!.result[index].discountRate,
              disablePrice: newProducts!.result[index].originPrice,
              productTitle: newProducts!.result[index].productName,
              totalPrice: newProducts!.result[index].discountedPrice,
            );
          },
        ),
      );
    }
  }
}
