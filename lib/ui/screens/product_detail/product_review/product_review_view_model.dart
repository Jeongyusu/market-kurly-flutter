// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_detail_repository.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductReviewModel {
  final int? productId;
  final int? writeableReviewId;
  final String? reviewTitle;
  final String? reviewContent;
  final int? starCount;
  final List<String>? reviewPics;

  ProductReviewModel({
    this.productId,
    this.writeableReviewId,
    this.reviewTitle,
    this.reviewContent,
    this.starCount,
    this.reviewPics,
  });
}

class ProductReviewViewModel extends ProductReviewModel {
  final BuildContext? mContext = navigatorKey.currentContext;

  Future<void> fetchReviewSave(
      ProductReviewSaveDTO productReviewSaveDTO, String jwt) async {
    if (mContext != null) {
      // 1. 통신 코드
      ResponseDTO responseDTO = await ProductDetailRepository()
          .fetchReviewSave(productReviewSaveDTO, jwt);

      // 2. 비지니스 로직
      if (responseDTO.success == true) {
        Navigator.pushNamed(mContext!, Move.productReviewScreen);
      } else {
        ScaffoldMessenger.of(mContext!)
            .showSnackBar(SnackBar(content: Text("")));
      }
    } else {
      // mContext가 null일 때 처리
      print("에러: mContext가 null입니다");
    }
  }
}

// 3. 창고 관리자
final productReviewProvider = Provider<ProductReviewViewModel>((ref) {
  return ProductReviewViewModel();
});
