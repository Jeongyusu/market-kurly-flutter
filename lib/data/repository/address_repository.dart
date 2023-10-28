import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:logger/logger.dart';

// V -> P(전역프로바이더, 뷰모델) -> R
class AddressRepository {
  Future<ResponseDTO> fetchAddressList() async {
    try {
      // 1. 통신
      Logger().d("fetchAddressList 동작중");
      final response = await dio.get("/api/addresses");
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO toyResponseDTO = ResponseDTO.fromJson(response.data);

      Logger().d(toyResponseDTO.response);
      List<dynamic> mapList = toyResponseDTO.response;
      List<Address> addresses =
          mapList.map((e) => Address.fromJson(e)).toList();

      Logger().d(response.data);
      toyResponseDTO.response = addresses;

      Logger().d(toyResponseDTO.response);
      return toyResponseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "주소목록 불러오기실패");
    }
  }
}
