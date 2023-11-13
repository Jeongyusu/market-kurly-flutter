import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class RequestParam {
  ProductReviewSaveDTO? productReviewSaveDTO;

  RequestParam({this.productReviewSaveDTO});
}

// 2. 창고 (비지니스 로직)
class ParameterStore extends RequestParam {
  final mContext = navigatorKey.currentContext;
}

// 3. 창고 관리자
final parameterProvider = Provider<ParameterStore>((ref) {
  return ParameterStore();
});
