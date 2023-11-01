import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewHomeOptionTitle extends ConsumerWidget {
  final int index;
  const ReviewHomeOptionTitle({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartListProvider);

    return Row(
      children: [
        Flexible(
          child: Container(
              child: Text(
            "${cartDTOListModel?.cartDTO.cartProducts[index].productSeller ?? ""} "
            "${cartDTOListModel?.cartDTO.cartProducts[index].productTitle ?? ""}",
            style: strongTextmMedium(),
          )),
        ),
      ],
    );
  }
}
