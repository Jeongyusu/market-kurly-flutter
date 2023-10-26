import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
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
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 300,
        height: 90,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets${cartDTOListModel?.cartDTO.cartProducts[index].image}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: smallGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartPriceTextItem(index: index),
                Spacer(),
                CustomOptionCount(index: index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
