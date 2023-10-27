import 'package:flutter/material.dart';
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
    );
  }
}
