import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/product.dart';
import 'package:logger/logger.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductList() async {
    try {
      Logger().d("야야야야");
      final response = await dio.get("/api/products");
      Logger().d("야야야야222222222");

      Logger().d(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("야야3333");
      List<dynamic> mapList = responseDTO.response as List<dynamic>;
      List<ProductDTO> productList =
          mapList.map((e) => ProductDTO.fromJson(e)).toList();
      responseDTO.response = productList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "오류");
    }
  }
}
