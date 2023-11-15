import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_search_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:logger/logger.dart';

class ProductRepository {
//  상세화면 리스트

  Future<ResponseDTO> fetchCategoryList(int id) async {
    try {
      // 통신
      final response =
          await dio.get("/api/products/category?page=0&categoryId=${id}");
      Logger().d(response.data);
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);

      responseDTO.response =
          ProductDescriptionDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  Future<ResponseDTO> fetchProductDetail(int id) async {
    try {
      // 통신
      final response = await dio.get("/api/products/$id");
      Logger().d(response.data);
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);

      responseDTO.response =
          ProductDescriptionDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  컬리추천 리스트
  Future<ResponseDTO> fetchMainProductList() async {
    try {
      final response = await dio.get("/api/product/lists");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      Logger().d("야야");

      responseDTO.response = ProductMainListsDTO.fromJson(responseDTO.response);
      Logger().d("호호");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  //  신상품리스트
  Future<ResponseDTO> fetchFinalSaleProductList() async {
    try {
      final response = await dio.get("/api/products/finalsale?page=0");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
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
      final response = await dio.get("/api/product/lists");
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
      final response = await dio.get("/api/product/lists");
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
      final response = await dio.get("/api/product/lists");
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
      final response = await dio.get("/api/product/lists");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      responseDTO.response = ProductListDTO.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }

  // 키워드 검색 상품
  Future<ResponseDTO> fetchSearchProductList(value) async {
    try {
      final response = await dio.get("/api/product/search?keyword=${value}");
      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      // responseDTO.response 의 데이터 원본 형태: List<ProductSearchDTO> productSearchDTOS
      // List<dynamic> mapList = responseDTO.response;
      // Logger().d("나요기0");
      // List<ProductSearchDTO> productSearchDTOs = mapList.map((e) => ProductSearchDTO.fromJson(e)).toList();
      // Logger().d("나요기1");
      // // responseDTO.response = productSearchDTOs;
      // Logger().d("나요기2");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "검색 오류");
    }
  }
}
