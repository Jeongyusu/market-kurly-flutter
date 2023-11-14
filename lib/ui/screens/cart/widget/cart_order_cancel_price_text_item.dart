import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderCancelPriceTextItem extends ConsumerWidget {
  final int index;
  const CartOrderCancelPriceTextItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${cartListModel!.cartDTO.cartProducts[index].discountedPrice * cartListModel!.cartDTO.cartProducts[index].optionQuantity}원" ??
              "에러",
          style: strongTextmMedium(),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
            "${cartListModel!.cartDTO.cartProducts[index].originPrice * cartListModel!.cartDTO.cartProducts[index].optionQuantity}원" ??
                "에러",
            style: disabledText()),
        Text(
          " |  ",
          style: greyToneText(),
        ),
        Text(
          "${cartListModel!.cartDTO.cartProducts[index].optionQuantity}개" ??
              "에러",
          style: basicText(),
        ),
      ],
    );
  }
}
