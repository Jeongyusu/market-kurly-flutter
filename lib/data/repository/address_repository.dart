import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/request_dto/address_request.dart';
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

  Future<ResponseDTO> savePost(AddressSaveReqDTO dto) async {
    Logger().d("savePost 호출");
    // 통신은 무조건 try-catch
    try {
      // 1. 통신
      // Request에 Body 데이터와 헤더 토큰값을 가지고 가야함
      // response안에 서버 측 응답으로 받은 http헤더와 body있음
      final response = await dio.post("/api/test/save/address",
          // data에 Map넣으면 자동으로 JSON으로 변환됨
          data: dto.toJson());

      Logger().d("save 통신코드 toJson : ${dto.toJson()}");
      Logger().d("save 통신코드 response : ${response}");

      // 2. 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      Logger().d("save 통신코드 ResponseDTO.fromJson : ${responseDTO}");

      // 3. ResponseDTO의 data파싱
      Address address = Address.fromJson(responseDTO.response);

      Logger().d("save 통신코드 Address.fromJson : ${address}");
      // 4. 파싱된 데이터를 다시 공통 DTO로 덮어 씌우기
      responseDTO.response = address;

      return responseDTO;
    }
    // 200이 아니면 catch로 감
    catch (e) {
      return ResponseDTO(success: false, response: "게시글 작성 실패.", error: null);
    }
  }
}
