import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderPriceArea extends ConsumerWidget {
  const CartOrderPriceArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    int deliveryFee = cartListModel!.cartDTO.totalBeforePrice - cartListModel.cartDTO.totalDiscountPrice >= 20000 ? 0 : 3500;
    Param param = ref.read(paramProvider);
    int couponDiscount;
    if(param.couponAmount! < 100){
      couponDiscount = cartListModel!.cartDTO.totalBeforePrice * param!.couponAmount!;
    } else {
      couponDiscount = param!.couponAmount!;
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                "결제금액",
                style: subTitleReqular(),
              )),
          SizedBox(
            height: 20,
          ),
          TextSpaceBetweenItem(
            leftText: " 주문금액",
            rightText: "${cartListModel!.cartDTO.totalBeforePrice}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: 20,
          ),
          TextSpaceBetweenItem(
            leftText: " - 상품금액",
            rightText: "${cartListModel!.cartDTO.totalBeforePrice}원",
            leftTextStyle: greyToneText(),
            rightTextStyle: greyToneText(),
          ),
          SizedBox(
            height: smallGap,
          ),
          TextSpaceBetweenItem(
            leftText: " - 상품할인금액",
            rightText: "${cartListModel!.cartDTO.totalDiscountPrice}원",
            leftTextStyle: greyToneText(),
            rightTextStyle: greyToneText(),
          ),
          SizedBox(
            height: mediumGap,
          ),
          TextSpaceBetweenItem(
            leftText: " 배송비",
            rightText: "${deliveryFee}원",
            leftTextStyle: basicText(),
            rightTextStyle: basicText(),
          ),
          SizedBox(
            height: smallGap,
          ),
          TextSpaceBetweenItem(
            leftText: " 쿠폰할인",
            rightText: "${couponDiscount ?? 0}원",
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
            padding: const EdgeInsets.only(top: 20, left: 3, bottom: 10),
            child: TextSpaceBetweenItem(
              leftText: "최종결제금액",
              rightText:
              "${cartListModel!.cartDTO.totalBeforePrice - cartListModel.cartDTO.totalDiscountPrice + deliveryFee - couponDiscount ?? 0}원",
              leftTextStyle: basicTextBig(),
              rightTextStyle: strongTextmMedium(),
            ),
          ),
        ],
      ),
    );
  }
}
