import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/body/cart_body.dart';
import 'package:flutter_blog/ui/screens/cart/body/cart_order_sheet_body.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOderSheetScreen extends ConsumerWidget {
  const CartOderSheetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Scaffold(
      body: CartOrderSheetBody(),
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
