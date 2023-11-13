import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/model_dto/order_dto/selected_cart_list_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/cart_repsository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartOrderModel {
  SelectedCartListDTO selectedCartListDTO;
  CartOrderModel(this.selectedCartListDTO);
}

class CartOrderViewModel extends StateNotifier<CartOrderModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  CartOrderViewModel(super._state, this.ref);

  void notifyInit() {
    CartListModel? cartListModel = ref.read(cartListProvider);
    SelectedCartListDTO selectedCartListDTO = SelectedCartListDTO.fromCartDTO(
        cartListModel!.cartDTO, cartListModel!.checkedCartDTO!, 1);
    state = CartOrderModel(selectedCartListDTO);
  }

  Future<void> orderConfirm() async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CartDTORepository()
        .fetchOrderConfirm(sessionStore.jwt!, state!.selectedCartListDTO);
    if (responseDTO.success == true) {
      // Navigator.pushNamed(mContext!, Move.cartOrderCancelScreen);
      Logger().d("결제성공");
    } else {
      Logger().d("결제실패");
      // Navigator.pushNamed(mContext!, Move.cartOrderCancelScreen);
    }
  }
}

final cartOrderProvider =
    StateNotifierProvider.autoDispose<CartOrderViewModel, CartOrderModel?>(
        (ref) {
  return CartOrderViewModel(null, ref)..notifyInit();
});
