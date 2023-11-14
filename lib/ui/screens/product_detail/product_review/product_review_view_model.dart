// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_detail_repository.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/data/store/parameter_store.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductReviewModel {
  final ProductReviewSaveDTO? productReviewSaveDTO;
  final ProductDetailDTO? productDetailList;

  ProductReviewModel({
    this.productReviewSaveDTO,
    this.productDetailList,
  });
}

class ProductReviewViewModel extends StateNotifier<ProductReviewModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  ProductReviewViewModel(this.ref, super.state);

  Future<void> reviewSave(String? jwt) async {
    Logger().d("notifiyAdd");
    if (mContext != null) {
      // 1. 통신 코드
      SessionUser sessionUser = ref.read(sessionProvider);

      ParameterStore parameterStore = ref.read(parameterProvider);
      ProductReviewSaveDTO? productReviewSaveDTO =
          parameterStore.productReviewSaveDTO;

      ResponseDTO responseDTO = await ProductDetailRepository()
          .fetchReviewSave(productReviewSaveDTO!, sessionUser.jwt!);
      Logger().d(11111);

      responseDTO.response =
          ProductReviewSaveDTO.fromJson(responseDTO.response);
      state = ProductReviewModel(productReviewSaveDTO: responseDTO.response);

      Logger().d(222222);
      // 2. 비지니스 로직
      if (responseDTO.success == true) {
        Navigator.pop(mContext!);
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(
            content: Text("후기등록이 실패했습니다."),
          ),
        );
      }
    } else {
      // mContext가 null일 때 처리
      print("에러: mContext가 null입니다");
    }
  }

  Future<void> reviewList() async {
    ResponseDTO responseDTO = await ProductRepository().fetchNewProductList();
    Logger().d(responseDTO);
    state = ProductReviewModel(productDetailList: responseDTO.response);
  }
}

// 3. 창고 관리자

final productReviewProvider =
    StateNotifierProvider<ProductReviewViewModel, ProductReviewModel?>((ref) {
  SessionStore sessionUser = ref.read(sessionProvider);
  return ProductReviewViewModel(ref, null)..reviewSave(sessionUser.jwt);
});
