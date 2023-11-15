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
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${cartListModel!.checkedCartDTO![index].discountedPrice * cartListModel!.checkedCartDTO![index].optionQuantity}원" ??
              "에러",
          style: strongTextmMedium(),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
            "${cartListModel!.checkedCartDTO![index].originPrice * cartListModel!.checkedCartDTO![index].optionQuantity}원" ??
                "에러",
            style: disabledText()),
        Text(" |  ", style: greyToneText(),),
        Text("${cartListModel!.checkedCartDTO![index].optionQuantity}개" ?? "에러",
          style: basicText(),
        ),
      ],
    );
  }
}
