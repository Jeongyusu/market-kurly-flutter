import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_price_text_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_text_item.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_order_option_title.dart';

class CartOrderOptionItem extends ConsumerWidget {
  final int index;
  const CartOrderOptionItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    var orderCartItems = cartListModel!.cartDTO.cartProducts.where((e) => e.isChecked == true).toList();
    String imgUrl = dio.options.baseUrl;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 330,
        height: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                '${imgUrl}${orderCartItems[index].productPic}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: smallGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartOrderOptionTitle(index: index),
                CartOrderPriceTextItem(index: index),
                // Text(
                //   "취소완료",
                //   style: basicTextSmall(),
                // ),
                Spacer(),
                // CustomOptionCount(index: index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
