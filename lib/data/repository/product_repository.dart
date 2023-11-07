import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/product.dart';
import 'package:logger/logger.dart';

class ProductRepository {
//  상세화면 리스트
  Future<ResponseDTO> fetchProductDetail(String jwt, int id) async {
    try {
      // 통신
      final response = await dio.get("/api/products/{productId}");

      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = ProductDetailDTO.fromJson(responseDTO.response);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  신상품리스트
  Future<ResponseDTO> fetchNewProductList() async {
    try {
      final response = await dio.get("/api/products/newproduct?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  베스트 상품 리스트
  Future<ResponseDTO> fetchBestProductList() async {
    try {
      final response = await dio.get("/api/products/bestproduct?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  금주혜택 상품 리스트
  Future<ResponseDTO> fetchBenefitProductList() async {
    try {
      final response = await dio.get("/api/products/event?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  컬리추천
  Future<ResponseDTO> fetchHomeProductList() async {
    try {
      final response = await dio.get("/api/products/home?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  가장 핫한 상품 리스트
  Future<ResponseDTO> fetchPopularProductList() async {
    try {
      final response = await dio.get("/api/products/newproduct?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  초특가 반값 SALE 상품 리스트
  Future<ResponseDTO> fetchSaleProductList() async {
    try {
      final response = await dio.get("/api/products/newproduct?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  MD추천 상품 리스트
  Future<ResponseDTO> fetchRecommendProductList() async {
    try {
      final response = await dio.get("/api/products/newproduct?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }
}
