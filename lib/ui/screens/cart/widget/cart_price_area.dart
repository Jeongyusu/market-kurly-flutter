import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPriceArea extends ConsumerWidget {
  const CartPriceArea({
    super.key,
    required this.cartDTOListModel,
  });

  final CartListModel? cartDTOListModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextSpaceBetweenItem(
            leftText: "상품금액",
            rightText: "${cartDTOListModel!.cartDTO.totalBeforePrice}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: xsmallGap,
          ),
          TextSpaceBetweenItem(
            leftText: "상품할인금액",
            rightText: "${cartDTOListModel!.cartDTO.totalDiscountPrice}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: xsmallGap,
          ),
          TextSpaceBetweenItem(
            leftText: "배송비",
            rightText: "0원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
        ],
      ),
    );
  }
}
