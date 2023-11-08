import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/coupon_dto/user_coupon_dto.dart';
import 'package:logger/logger.dart';

import '../dto/response_dto.dart';

class CouponRepository {
  Future<ResponseDTO> fetchCouponList(String jwt) async {
    try {
      // 1. 통신
      Logger().d("fetchCouponList동작중");
      final response = await dio.get(
        "/api/users/coupon",
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
            // 다른 필요한 헤더도 추가할 수 있습니다.
          },
        ),
      );
      Logger().d(response.data);
      // 2. ResponseDTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response;
      List<UserCouponDTO> userCouponList =
          mapList.map((e) => UserCouponDTO.fromJson(e)).toList();
      responseDTO.response = userCouponList;

      // 3. ResponseDTO의 data 파싱
      Logger().d("UserCouponDTO파싱완료");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(success: false, response: null, error: "유저쿠폰목록불러오기실패");
    }
  }
}
