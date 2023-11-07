import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderPriceTextItem extends ConsumerWidget {
  final int index;
  const CartOrderPriceTextItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartListProvider);
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
            "${cartDTOListModel?.cartDTO.cartProducts[index].originPrice}원" ??
                "에러",
            style: disabledText()),
        Text(" |  ", style: greyToneText(),),
        Text("${cartDTOListModel?.cartDTO.cartProducts[index].optionQuantity}개" ?? "에러",
          style: basicText(),
        ),
      ],
    );
  }
}
