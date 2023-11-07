import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartPriceTextItem extends ConsumerWidget {
  final int index;
  const CartPriceTextItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartListProvider);
    Logger().d(cartDTOListModel!.cartDTO.cartProducts[index].optionQuantity);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${cartDTOListModel?.cartDTO.cartProducts[index].discountedPrice ?? 0 * cartDTOListModel!.cartDTO.cartProducts[index].optionQuantity ?? 0} 원" ??
              "에러",
          style: strongTextmMedium(),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
            "${cartDTOListModel?.cartDTO.cartProducts[index].originPrice ?? 0 * cartDTOListModel!.cartDTO.cartProducts[index].optionQuantity ?? 0}원" ??
                "에러",
            style: disabledText()),
      ],
    );
  }
}
