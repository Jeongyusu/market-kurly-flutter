import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';

class CartStore extends ChangeNotifier {
  bool _disposed = false; // 메모리 해제
  List<CartProductDTO> data = []; // 생성될 데이터 변수 선언

  // 메모리 누수 방지
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  // 메모리 해제가 아닐시 notifyListeners 호출
  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  // 장바구니 선택 추가
  void addItem(value) {
    // 장바구니 고유값 중복되지 않게 추가
    var index = data.indexWhere((item) => item.cartId == value.id);
    if (index == -1) {
      data.add(value);
      notifyListeners();
    }
  }

  // 장바구니 선택 해제
  void removeItem(value) {
    data.removeWhere((item) => item.cartId == value);
    notifyListeners();
  }

  // 장바구니 선택 전체 해제
  void clearItem() {
    data.clear();
    notifyListeners();
  }
}