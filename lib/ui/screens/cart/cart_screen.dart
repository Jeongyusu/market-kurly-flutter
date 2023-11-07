import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/body/cart_body.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_sbtween_item.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  // 초기 수량
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    if (cartListModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: CartBody(),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                print("주문하기 클릭됨");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(50),
                backgroundColor: primaryColor,
              ),
              child: Text("주문하기"),
            ),
          ),
        ),
      );
    }
  }
}
