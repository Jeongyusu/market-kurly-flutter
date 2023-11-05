import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewHomePriceTextItem extends ConsumerWidget {
  final int index;
  const ReviewHomePriceTextItem({
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
          "${cartDTOListModel?.cartDTO.cartProducts[index].optionQuantity}개 구매" ??
              "에러",
          style: basicText(),
        ),
      ],
    );
  }
}
