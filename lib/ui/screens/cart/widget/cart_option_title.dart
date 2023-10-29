import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOptionTitle extends ConsumerWidget {
  final int index;
  const CartOptionTitle({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartListProvider);

    return Row(
      children: [
        Container(
          child: Text(
            cartDTOListModel?.cartDTO.cartProducts[index].productSeller ?? "",
            style: basicText(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: smallGap),
        Container(
          width: 100,
          child: Text(
            cartDTOListModel?.cartDTO.cartProducts[index].productTitle ?? "",
            style: basicText(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
