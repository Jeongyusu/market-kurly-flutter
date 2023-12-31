import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고 데이터
class ProductDescriptionModel {
  ProductDescriptionDTO productDescriptionDTO;

  ProductDescriptionModel({required this.productDescriptionDTO});
}

// 창고
class ProductDescriptionViewModel
    extends StateNotifier<ProductDescriptionModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ProductDescriptionViewModel(this.ref, super.state);

  Future<void> notifyInit(int id) async {
    Logger().d("productDetail");
    // SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO = await ProductRepository().fetchProductDetail(id);

    state =
        ProductDescriptionModel(productDescriptionDTO: responseDTO.response);
  }
}

// 창고 관리자
final productDescriptionProvider = StateNotifierProvider.family
    .autoDispose<ProductDescriptionViewModel, ProductDescriptionModel?, int>(
        (ref, productId) {
      Logger().d("productDetail 창고 만들어짐 $productId");
      return ProductDescriptionViewModel(ref, null)..notifyInit(productId);
    });