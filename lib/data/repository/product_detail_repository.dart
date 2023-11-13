import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

class ProductDetailRepository {
  Future<ResponseDTO> fetchReviewSave(
      ProductReviewSaveDTO productReviewSaveDTO, String jwt) async {
    try {
      // 1. 통신
      Logger().d("${productReviewSaveDTO.toJson()}");
      final response = await dio.post(
        "/api/reviews/save",
        data: productReviewSaveDTO.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
          },
        ),
      );
      Logger().d("리뷰 작성 진행 중");

      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 3. ResponseDTO의 data 파싱
      Logger().d(responseDTO.response);
      return responseDTO;
    } catch (e) {
      Logger().d("오류", e);
      return ResponseDTO(
          success: false, response: null, error: "후기를 등록할 수 없습니다");
    }
  }
}
