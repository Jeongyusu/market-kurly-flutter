import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_orderer_info.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_payment.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_shipment_address.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_text_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/coupon_drop_down.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validators/validators.dart';

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
                      child: Text("주문상품",style: subTitle())),
                ),
                CartOrderOptionArea(),
                CustomLineBold(),
                SizedBox(height: 20,),
                Container(
                  child:
                  ExpansionTile(title: Text("주문자 정보", style: subTitle(),),
                    children: [
                      CartOrderOrdererInfo(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text("배송지", style: subTitle(),),
                    children: [
                      CartOrderShipmentAddress(),
                    ],
                  ),
                ),
                CustomLineBold(),
                Container(
                  child: ExpansionTile(
                    title: Text("쿠폰", style: subTitle(),),
                    children: [
                      CartOrderCoupondropdown(),
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

  // 장바구니 삭제버튼
  Widget _cartTotalBtn() {
    return Align(
      alignment: Alignment.center, // 요소를 수평 중앙에 정렬
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CheckBoxItem(
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
