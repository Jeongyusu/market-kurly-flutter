import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/category.dart';
import 'package:logger/logger.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class CategoryRepository {
  Future<ResponseDTO> fetchCategoryList() async {
    try {
      // 1. 통신
      Logger().d("fetchCategoryList 동작중");
      final response = await dio.get("/api/categorys");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO toyResponseDTO = ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = toyResponseDTO.response;
      List<Category> categorys =
          mapList.map((e) => Category.fromJson(e)).toList();

      toyResponseDTO.response = categorys;

      return toyResponseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "카테고리 불러오기실패");
    }
  }
}
