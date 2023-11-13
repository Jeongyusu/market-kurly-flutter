import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderCancleOptionTitle extends ConsumerWidget {
  final int index;
  const CartOrderCancleOptionTitle({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Container(
      width: 220,
      child: RichText(
        text: TextSpan(
          text:
          "[${cartListModel!.cartDTO.cartProducts[index].sellerName ?? ""}]"
              "${cartListModel!.cartDTO.cartProducts[index].productName ?? ""}",
          style: subContentsBold(),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
