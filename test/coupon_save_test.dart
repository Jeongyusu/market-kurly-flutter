import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/model_dto/coupon_dto/coupon_save_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:logger/logger.dart';

void main() async {
  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtZXRhY29kaW5nLWtleSIsImlkIjoxLCJ1c2VyRW1haWwiOiJzc2FyQG5hdGUuY29tIiwicm9sZSI6Ik5PUk1BTCIsImV4cCI6MTcwMDEwMzk5M30.4EKQzwgoD4mHgkvXo5L0hMrU_qE4fYmyD6zOLevH8jxp-nqt8P-eaRJ8moNTcXvabkCxf8Wzn9u988dhd88Z7A";
  CouponRegisterDTO couponRegisterDTO = CouponRegisterDTO("521e847d-4b4e-4b67");
  Logger().d(couponRegisterDTO.couponNumber);
  await fetchCouponSave(jwt, couponRegisterDTO);
}

Future<ResponseDTO> fetchCouponSave(
    String jwt, CouponRegisterDTO couponRegisterDTO) async {
  try {
    // 1. 통신
    Logger().d("fetchCouponSave동작중");
    Logger().d("fetchCouponSave동작중 여기까지 찍힘 ${couponRegisterDTO.toJson()}");
    final response = await dio.post("/api/users/coupon/register",
        // data에 Map넣으면 자동으로 JSON으로 변환됨
        data: couponRegisterDTO.toJson());
    Logger().d("쿠폰 세이브 진행중");
    // 2. ResponseDTO 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // 3. ResponseDTO의 data 파싱
    Logger().d(responseDTO.response);
    Logger().d("UserCouponDTO파싱완료");
    return responseDTO;
  } catch (e) {
    Logger().d("오류", e);
    return ResponseDTO(success: false, response: null, error: "fr");
  }
}
