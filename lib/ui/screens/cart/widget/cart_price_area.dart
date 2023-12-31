import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPriceArea extends ConsumerWidget {
  const CartPriceArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    int deliveryFee = cartListModel!.cartDTO.totalBeforePrice -
                cartListModel.cartDTO.totalDiscountPrice >=
            20000
        ? 0
        : 3500;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextSpaceBetweenItem(
            leftText: "상품금액",
            rightText: "${cartListModel!.cartDTO.totalBeforePrice}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: xsmallGap,
          ),
          TextSpaceBetweenItem(
            leftText: "상품할인금액",
            rightText: "${cartListModel!.cartDTO.totalDiscountPrice}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: xsmallGap,
          ),
          TextSpaceBetweenItem(
            leftText: "배송비",
            rightText: "${deliveryFee}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: smallGap,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: bgAndLineColor, // 선의 색상 설정
                  width: 1.0, // 선의 두께 설정
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextSpaceBetweenItem(
              leftText: "결제예정금액",
              rightText:
                  "${cartListModel!.cartDTO.totalBeforePrice - cartListModel.cartDTO.totalDiscountPrice + deliveryFee}원",
              leftTextStyle: basicTextBig(),
              rightTextStyle: strongTextmMedium(),
            ),
          ),
        ],
      ),
    );
  }
}
