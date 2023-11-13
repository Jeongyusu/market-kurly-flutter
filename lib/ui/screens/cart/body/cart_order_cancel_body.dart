import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_cancel_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_cancel_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_cancel_question.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_orderer_info.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_shipment_address.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderCancelBody extends ConsumerWidget {
  const CartOrderCancelBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "주문 내역 상세",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 25),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("주문번호 129319239", style: subTitleReqular())),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 340,
                  height: 50,
                  child: Text(
                    "전체 상품 다시 담기",
                    style: subTitleReqular(),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: disableColor, width: 1.0),
                      borderRadius: BorderRadius.circular(5)),
                ),
                CartOrderCancelOptionArea(),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text(
                      "결제 정보",
                      style: subTitleReqular(),
                    ),
                    children: [
                      CartOrderCancelPriceArea(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text(
                      "주문 정보",
                      style: subTitleReqular(),
                    ),
                    children: [
                      CartOrderOrdererInfo(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text(
                      "배송 정보",
                      style: subTitleReqular(),
                    ),
                    children: [
                      CartOrderShipmentAddress(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text(
                      "추가 정보",
                      style: subTitleReqular(),
                    ),
                    children: [],
                  ),
                ),
                CustomLineBold(),
                CartOrderCancelQuestion(),
              ],
            ),
          ]),
        ),
      ],
    );
  }

  // 장바구니 삭제버튼
  Widget _cartTotalBtn() {
    return Align(
      alignment: Alignment.center, // 요소를 수평 중앙에 정렬
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartCheckBoxItem(
              text: "전체선택",
              textStyle: basicTextBig(),
            ),
            Text(
              "선택삭제",
              style: basicText(),
            ),
          ],
        ),
      ),
    );
  }
}
