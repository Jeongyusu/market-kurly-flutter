import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_delete_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_save_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/order_dto/selected_cart_list_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../_core/constants/move.dart';
import '../../main.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class CartDTORepository {
  final mContext = navigatorKey.currentContext;

  Future<ResponseDTO> fetchCartList(String jwt) async {
    try {
      // 1. 통신
      Logger().d("fetchCartList동작중");
      final response = await dio.get(
        "/api/carts",
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
            // 다른 필요한 헤더도 추가할 수 있습니다.
          },
        ),
      );
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = CartDTO.fromJson(responseDTO.response);

      // 3. ResponseDTO의 data 파싱
      Logger().d("CartProductDTO파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "카트목록불러오기실패");
    }
  }

  Future<ResponseDTO> fetchSaveCartList(
      String jwt, CartSaveDTO cartSaveDTO) async {
    try {
      // 1. 통신
      Logger().d("saveCartList동작중");
      Logger().d("${cartSaveDTO.toJson()}");

      final response = await dio.post("/api/carts/insert",
          options: Options(
            headers: {
              "Authorization": "Bearer $jwt",
              // 다른 필요한 헤더도 추가할 수 있습니다.
            },
          ),
          data: cartSaveDTO.toJson());
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "카트목록 저장 실패");
    }
  }

  Future<ResponseDTO> fetchRemoveCartList(
      String jwt, CartDeleteListDTO cartDeleteListDTO) async {
    try {
      // 1. 통신
      Logger().d("removeCartList동작중");
      Logger().d("${cartDeleteListDTO.toJson()}");

      final response = await dio.post("/api/carts/delete",
          options: Options(
            headers: {
              "Authorization": "Bearer $jwt",
              // 다른 필요한 헤더도 추가할 수 있습니다.
            },
          ),
          data: cartDeleteListDTO.toJson());
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      Logger().d("CartSaveDTO파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "카트목록 선택삭제 실패");
    }
  }

  Future<ResponseDTO> fetchRemoveAllCart(String jwt) async {
    try {
      // 1. 통신
      Logger().d("removeCartList동작중");
      // Logger().d("${cartDeleteListDTO.toJson()}");

      final response = await dio.post(
        "/api/carts/delete/all",
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
            // 다른 필요한 헤더도 추가할 수 있습니다.
          },
        ),
      );
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      Logger().d("fetchRemoveAllCart파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "카트목록 전체삭제 실패");
    }
  }

  Future<ResponseDTO> fetchOrderConfirm(
      String jwt, SelectedCartListDTO selectedCartListDTO) async {
    try {
      // 1. 통신
      Logger().d("orderConfirm동작중");
      Logger().d("${selectedCartListDTO.toJson()}");

      final response = await dio.post("/api/carts/order",
          options: Options(
            headers: {
              "Authorization": "Bearer $jwt",
              // 다른 필요한 헤더도 추가할 수 있습니다.
            },
          ),
          data: selectedCartListDTO.toJson());

      Logger().d("여기까지 완료");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.response = SelectedCartListDTO.fromJson(responseDTO.response);

      // 3. ResponseDTO의 data 파싱
      Logger().d("SelectedCartListDTO 파싱완료");
      return responseDTO;
    } catch (e) {
      Logger().d("장바구니 주문검증 실패");
      return ResponseDTO(success: false, response: null, error: "카트검증실패");
    }
  }

// Future<ResponseDTO> fetchPost(String jwt, int id) async {
  //   try {
  //     // 통신
  //     Response response = await dio.get("/post/$id",
  //         options: Options(headers: {"Authorization": "$jwt"}));
  //
  //     // 응답 받은 데이터 파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     responseDTO.data = Post.fromJson(responseDTO.data);
  //
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(-1, "게시글 한건 불러오기 실패", null);
  //   }
  // }
  //
  // // deletePost, updatePost, savePost
  // // fetchPost, fetchPostList
  // Future<ResponseDTO> savePost(String jwt, PostSaveReqDTO dto) async {
  //   try {
  //     // 1. 통신
  //     final response = await dio.post("/post",
  //         data: dto.toJson(),
  //         options: Options(headers: {"Authorization": "${jwt}"}));
  //
  //     Logger().d(response.data);
  //
  //     // 2. ResponseDTO 파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     Logger().d(responseDTO.data);
  //
  //     // 3. ResponseDTO의 data 파싱
  //     Post post = Post.fromJson(responseDTO.data);
  //
  //     // 4. 파싱된 데이터를 다시 공통 DTO로 덮어씌우기
  //     responseDTO.data = post;
  //
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(-1, "게시글 작성 실패", null);
  //   }
  // }
}
