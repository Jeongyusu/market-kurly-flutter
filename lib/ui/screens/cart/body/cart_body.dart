import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_text_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartBody extends ConsumerWidget {
  const CartBody({
    super.key,
    required this.param,
    required this.cartDTOListModel,
  });

  final Param? param;
  final CartListModel? cartDTOListModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Param? param = ref.watch(paramProvider);
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "장바구니",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        _cartButtonAppbar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                CartOptionArea(),
                Column(
                  children: [
                    CartPriceArea(cartDTOListModel: cartDTOListModel),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }

  Widget _cartButtonAppbar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 0.1,
      backgroundColor: basicColorW,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 5.0),
        background: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 10,
                color: bgAndLineColor,
              ),
            ),
          ),
          child: _cartTotalBtn(),
        ),
      ),
    );
  }

  // 장바구니 삭제버튼
  Widget _cartTotalBtn() {
    return Align(
      alignment: Alignment.center,
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
