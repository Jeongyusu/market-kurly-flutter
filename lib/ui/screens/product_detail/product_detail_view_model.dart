import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고 데이터
class ProductDetailModel {
  ProductDetailDTO productDetailDTO;
  ProductDetailModel({required this.productDetailDTO});
}

// 창고
class ProductDetailViewModel extends StateNotifier<ProductDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ProductDetailViewModel(this.ref, super.state);

  Future<void> notifyInit(int id) async {
    Logger().d("notifyInit");

    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await ProductRepository().fetchProductDetail(sessionUser.jwt!, id);

    state = ProductDetailModel(productDetailDTO: responseDTO.response);
  }
}

// 창고 관리자
final productDetailProvider = StateNotifierProvider.family
    .autoDispose<ProductDetailViewModel, ProductDetailModel?, int>(
        (ref, productId) {
  Logger().d("productDetail 창고 만들어짐 $productId");
  return ProductDetailViewModel(ref, null)..notifyInit(productId);
});
