import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/product_question_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

class ProductInquiryRepository {
  Future<ResponseDTO> fetchSaveProductInquiry(String jwt, ProductQuestionSaveDTO productQuestionSaveDTO) async {
    try {
      // 1. 통신
      Logger().d("fetchProductInquiryList동작중");
      final response = await dio.post(
        "/api/users/product/question/save",
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
            // 다른 필요한 헤더도 추가할 수 있습니다.
          },
        ),
        data:productQuestionSaveDTO.toJson(),
      );
      Logger().d("문의작성테스트");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = ProductQuestionSaveDTO.fromJson(responseDTO.response);
      // 3. ResponseDTO의 data 파싱
      Logger().d("문의 리스트 가져오기 파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "문의목록불러오기실패");
    }
  }
}