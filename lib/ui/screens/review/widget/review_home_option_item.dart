import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_price_text_item.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_option_title.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_price_text_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewHomeOptionItem extends ConsumerWidget {
  final int index;
  const ReviewHomeOptionItem({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 280,
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets${cartListModel?.cartDTO.cartProducts[index].image}',
                fit: BoxFit.cover,
                width: 50,
                height: 90,
              ),
            ),
            SizedBox(
              width: smallGap,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewHomeOptionTitle(index: index),
                  ReviewHomePriceTextItem(index: index),
                  Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: Text(
                      "7일 남음",
                      style: reviewDeadLine(),
                    ),
                  ),
                  // CustomOptionCount(index: index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
