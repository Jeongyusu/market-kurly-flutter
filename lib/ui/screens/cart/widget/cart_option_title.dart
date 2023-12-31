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

    return Container(
      width: 220,
      child: RichText(
        text: TextSpan(
          text:
              "[${cartDTOListModel?.cartDTO.cartProducts[index].sellerName ?? ""}]"
              "${cartDTOListModel?.cartDTO.cartProducts[index].productName ?? ""}",
          style: subContentsBold(),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
