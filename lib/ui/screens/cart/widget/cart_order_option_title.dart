import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderOptionTitle extends ConsumerWidget {
  final int index;
  const CartOrderOptionTitle({
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
          "[${cartListModel!.checkedCartDTO![index].sellerName ?? ""}]"
              "${cartListModel!.checkedCartDTO![index].productName ?? ""}",
          style: subContentsBold(),
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
