import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_dto.dart';

import 'selected_cart_product_dto.dart';

class SelectedCartListDTO {
  List<SelectedCartProductDTO> selectedCartProducts;
  int totalBeforePrice;
  int totalDiscountPrice;
  int deliveryFee;
  int totalPrice;
  int? finalPrice; // 최종 결제될 금액
  int? userCouponId;
  int? addressId;

  SelectedCartListDTO(this.selectedCartProducts,
      this.totalBeforePrice,
      this.totalDiscountPrice,
      this.deliveryFee,
      this.totalPrice,
      this.finalPrice,
      this.userCouponId,
      this.addressId);

  Map<String, dynamic> toJson() =>
      {
        "selectedCartProducts": selectedCartProducts
            .map((selectedCartProductDTO) => selectedCartProductDTO.toJson())
            .toList(),
        "totalBeforePrice": totalBeforePrice,
        "totalDiscountPrice": totalDiscountPrice,
        "deliveryFee": deliveryFee,
        "totalPrice": totalPrice,
        "finalPrice": finalPrice,
        "userCouponId": userCouponId,
        "addressId": addressId,
      };

  factory SelectedCartListDTO.fromCartDTO(CartDTO cartDTO) {
    List<SelectedCartProductDTO> selectedCartProducts = cartDTO.cartProducts
        .map((cartProduct) =>
        SelectedCartProductDTO.fromCartProductDTO(cartProduct))
        .toList();

    return SelectedCartListDTO(
      selectedCartProducts,
      cartDTO.totalBeforePrice,
      cartDTO.totalDiscountPrice,
      cartDTO.deliveryFee,
      cartDTO.totalPrice,
      cartDTO.addressId,

    );
  }

}
