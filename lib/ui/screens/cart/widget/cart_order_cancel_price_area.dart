import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderCancelPriceArea extends ConsumerWidget {
  const CartOrderCancelPriceArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextSpaceBetweenItem(
            leftText: " 상품금액",
            rightText: "${cartListModel!.cartDTO.totalBeforePrice}원",
            leftTextStyle: subContents(),
            rightTextStyle: basicText(),
          ),
          SizedBox(height: smallGap,),
          TextSpaceBetweenItem(
            leftText: " 배송비",
            rightText: "0원",
            leftTextStyle: subContents(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: smallGap,
          ),
          TextSpaceBetweenItem(
            leftText: " 결제금액",
            rightText: "0원",
            leftTextStyle: subContents(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: smallGap,
          ),
          TextSpaceBetweenItem(
            leftText: " 취소완료금액",
            rightText: "0원",
            leftTextStyle: subContents(),
            rightTextStyle: basicText(),
          ),
        ],
      ),
    );
  }
}
