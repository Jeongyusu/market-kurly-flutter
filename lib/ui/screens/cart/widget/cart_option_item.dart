import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_price_text_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_text_item.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOptionItem extends ConsumerWidget {
  final int index;
  const CartOptionItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 325,
        height: 100,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.network(
                  'http://192.168.0.42:8080${cartListModel?.cartDTO.cartProducts[index].productPic}', // 이미지의 URL
                  width: 200, // 이미지의 가로 크기
                  height: 150, // 이미지의 세로 크기
                  fit: BoxFit.cover, // 이미지의 맞춤 방법 (옵션)
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                )),
            SizedBox(
              width: smallGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartPriceTextItem(index: index),
                CustomOptionCount(index: index),
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
