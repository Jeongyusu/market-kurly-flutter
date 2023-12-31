import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/dto/model_dto/order_dto/selected_cart_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/order_dto/selected_cart_product_dto.dart';
import 'package:flutter_blog/data/repository/cart_repsository.dart';
import 'package:flutter_blog/ui/screens/cart/body/cart_body.dart';
import 'package:flutter_blog/ui/screens/cart/body/cart_order_sheet_body.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/cart_order_view_model.dart';
import 'package:flutter_blog/ui/screens/payment/pay_home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOderSheetScreen extends ConsumerWidget {
  const CartOderSheetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CartOrderSheetBody(),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              ref.read(cartOrderProvider.notifier).orderConfirm();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PayHomePage(price: 3000, months: 1);
                },
              ));
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
