import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_save_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/option.dart';
import 'package:flutter_blog/data/repository/cart_repsository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductDetailModal {
  List<Option> selectedOptionDTOs;
  ProductDetailModal(this.selectedOptionDTOs);
}

class ProductDetailViewModel extends StateNotifier<ProductDetailModal?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  ProductDetailViewModel(super._state, this.ref);

  void notifyInit(int productId) {
    ProductDescriptionModel? model =
        ref.read(productDescriptionProvider(productId));
    List<Option> selectedOptionDTOs = model!.productDescriptionDTO.options;
    state = ProductDetailModal(selectedOptionDTOs);
  }

  Future<void> saveCartList(int productId) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    Logger().d("여기까지 실행됨");
    ProductDetailModal? productDetailModel =
        ref.read(productCartProvider(productId));
    Logger().d(
        "여기까지 실행됨11${productDetailModel!.selectedOptionDTOs[0].optionQuantity}");

    List<SelectedOptionDTO> selectedOptionDTOList = productDetailModel!
        .selectedOptionDTOs
        .map((e) => SelectedOptionDTO(e.id, e.optionQuantity))
        .toList();
    Logger().d("장바구니테스트 ${selectedOptionDTOList[0].optionQuantity}");
    Logger().d("장바구니테스트${selectedOptionDTOList[1].optionQuantity}");
    // 1. 통신 코드
    ResponseDTO responseDTO = await CartDTORepository().fetchSaveCartList(
        sessionStore.jwt!, CartSaveDTO(selectedOptionDTOList));
    Logger().d("여기까지 실행됨1");

    // 2. 비지니스 로직
    if (responseDTO.response == true) {
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

  void plusQuantity(int index) {
    Logger().d("플러스 클릭됨");
    state!.selectedOptionDTOs[index].optionQuantity++;
    state = ProductDetailModal(state!.selectedOptionDTOs);
    Logger().d("플러스 클릭됨${state!.selectedOptionDTOs[index].optionQuantity}");
  }

  void minusQuantity(int index) {
    Logger().d("마이너스 클릭됨");
    if (state!.selectedOptionDTOs[index].optionQuantity > 0) {
      state!.selectedOptionDTOs[index].optionQuantity--;
    }
    state = ProductDetailModal(state!.selectedOptionDTOs);
    Logger().d("마이너스 클릭됨${state!.selectedOptionDTOs[index].optionQuantity}");
  }
}

final productCartProvider = StateNotifierProvider.family
    .autoDispose<ProductDetailViewModel, ProductDetailModal?, int>(
        (ref, productId) {
  return ProductDetailViewModel(null, ref)..notifyInit(productId);
});
