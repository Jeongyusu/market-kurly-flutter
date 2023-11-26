// 창고
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  int? couponId;
  int? couponAmount;
  Param({this.couponId, this.couponAmount});
}

// 창고데이터
class ParamStore extends Param {

  void selectCouponId(int id){
    this.couponId = id;
  }

  void selectCouponAmount(int amount){
    this.couponAmount = amount;
  }

}

final paramProvider = Provider<ParamStore>((ref) {
  return ParamStore();
});
