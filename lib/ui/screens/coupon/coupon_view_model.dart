import 'package:flutter_blog/data/dto/model_dto/coupon_dto/coupon_save_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/coupon_dto/user_coupon_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/coupon_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CouponModel {
  List<UserCouponDTO>? userCouponDTOList;
  CouponModel({this.userCouponDTOList});
}

class CouponViewModel extends StateNotifier<CouponModel?> {
  CouponViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);
    String jwt = sessionStore.jwt ?? "";
    Logger().d("jwt테스트${jwt}");
    try {
      ResponseDTO responseDTO = await CouponRepository().fetchCouponList(jwt);
      Logger().d("여까지실행");
      Logger().d("여기까지2 ${responseDTO.response}");
      state = CouponModel(userCouponDTOList: responseDTO.response);
    } catch (e) {
      Logger().d("에러 발생");
    }
  }

  Future<void> saveCoupon(String couponNumber) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    String jwt = sessionStore.jwt ?? "";
    Logger().d("jwt테스트${jwt}");
    CouponRegisterDTO couponRegisterDTO = CouponRegisterDTO(couponNumber);
    ResponseDTO responseDTO =
        await CouponRepository().fetchCouponSave(jwt, couponRegisterDTO);
    Logger().d("쿠폰 정상 저장됨");
    Logger().d(responseDTO.response);
    await notifyInit();
  }

  Future<void> notifytest() async {
    await notifyInit();
  }
}

final couponProvider =
    StateNotifierProvider<CouponViewModel, CouponModel?>((ref) {
  return CouponViewModel(null, ref)..notifyInit();
});
