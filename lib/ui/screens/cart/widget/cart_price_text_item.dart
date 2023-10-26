import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPriceTextItem extends ConsumerWidget {
  final int index;
  const CartPriceTextItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${cartDTOListModel?.cartDTO.cartProducts[index].discountedPrice}원" ??
              "에러",
          style: strongTextmMedium(),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
            "${cartDTOListModel?.cartDTO.cartProducts[index].beforeDiscount}원" ??
                "에러",
            style: disabledText()),
      ],
    );
  }
}