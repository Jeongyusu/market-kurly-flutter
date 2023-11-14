import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/product_question_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_inquiry_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../mainaddress.dart';

class ProductInquiryModel {
  ProductQuestionSaveDTO productQuestionSaveDTO;
  int? selectedProductId;

  ProductInquiryModel({required this.productQuestionSaveDTO, this.selectedProductId});
}

class ProductInquiryViewModel extends StateNotifier<ProductInquiryModel?> {
  final mContext = navigatorKey.currentContext;

  Ref ref;
  ProductInquiryViewModel(super._state, this.ref);

  void selectProductID (productId){
    state!.selectedProductId = productId;
    state = ProductInquiryModel(productQuestionSaveDTO: state!.productQuestionSaveDTO, selectedProductId: productId);
  }

  Future<void> saveProductInquiry (ProductQuestionSaveDTO reqDTO) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await ProductInquiryRepository().fetchSaveProductInquiry(sessionStore.jwt!, reqDTO);
    if(responseDTO.success == true){
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }
}

final productInquiryProvider =
StateNotifierProvider.autoDispose<ProductInquiryViewModel, ProductInquiryModel?>((ref) {
  return ProductInquiryViewModel(ProductInquiryModel(productQuestionSaveDTO: ProductQuestionSaveDTO(0, "", "", true), selectedProductId: 0), ref);
});