import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetchProductDetail(1);
}

Future<ResponseDTO> fetchProductDetail(int id) async {
  try {
    // 통신
    final response = await dio.get("/api/products/$id");
    Logger().d(response.data);
    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(responseDTO.response);

    responseDTO.response = ProductDescriptionDTO.fromJson(responseDTO.response);
    Logger().d("키키");
    return responseDTO;
  } catch (e) {
    return ResponseDTO(success: false, response: null, error: "오류");
  }
}
