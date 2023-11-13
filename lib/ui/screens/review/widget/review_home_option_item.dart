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
  String bottomRightText;
  TextStyle bottomRightTextStyle;
  ReviewHomeOptionItem(
      {super.key,
      required this.index,
      required this.bottomRightText,
      required this.bottomRightTextStyle});

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
              child: Image.asset(
                'assets${cartListModel?.cartDTO.cartProducts[index].productPic}',
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
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(right: 15),
                      alignment: Alignment.topRight,
                      child: Text(
                        bottomRightText,
                        style: bottomRightTextStyle,
                      ),
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
