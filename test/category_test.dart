import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_category_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  await fetchCategoryTypeList();
}

Future<ResponseDTO> fetchCategoryTypeList() async {
  try {
    // 1. 통신
    Logger().d("카테고리타입 동작중");
    final response = await dio.get("/api/categorys");
    Logger().d(response.data);
    // 2. ResponseDTO 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    List<dynamic> mapList = responseDTO.response;
    List<ProductCategoryDTO> categoryType =
        mapList.map((e) => ProductCategoryDTO.fromJson(e)).toList();

    responseDTO.response = categoryType;

    return responseDTO;
  } catch (e) {
    return ResponseDTO(success: false, response: null, error: "카테고리 불러오기실패");
  }
}
