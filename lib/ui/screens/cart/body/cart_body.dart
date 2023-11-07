import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_button_appbar.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "장바구니",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CartButtonAppbar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                CartOptionArea(),
                Column(
                  children: [
                    CartPriceArea(),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
