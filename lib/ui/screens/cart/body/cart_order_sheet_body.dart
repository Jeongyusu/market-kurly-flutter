import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_orderer_info.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_payment.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_shipment_address.dart';
import 'package:flutter_blog/ui/screens/cart/widget/coupon_drop_down.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderSheetBody extends ConsumerWidget {
  const CartOrderSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "주문서",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("주문상품", style: subTitleReqular())),
                ),
                CartOrderOptionArea(),
                CustomLineBold(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ExpansionTile(
                    title: Text(
                      "주문자 정보",
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
                      "배송지",
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
                      "쿠폰",
                      style: subTitleReqular(),
                    ),
                    children: [
                      CartOrderCouponDropdown(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: CartOrderPriceArea(),
                ),
                CustomLineBold(),
                CartOrderPayment(),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
