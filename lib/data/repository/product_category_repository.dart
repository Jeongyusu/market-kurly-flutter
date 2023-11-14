import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/main.dart';
import 'package:logger/logger.dart';

class ProductCategoryRepository {
  final mContext = navigatorKey.currentContext;

  Future<ResponseDTO> fetchProductCategoryList(int categoryId) async {
    try {
      // 1. 통신
      Logger().d("fetchProductCategoryList동작중");
      final response = await dio.get("/api/products/category?page=0&categoryId=${categoryId}",
      );
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      // 3. ResponseDTO의 data 파싱
      Logger().d("ProductListDTO 파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "상품카테고리필터 호출 실패");
    }
  }
}