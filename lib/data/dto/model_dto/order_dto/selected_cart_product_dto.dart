import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';

class SelectedCartProductDTO {
  int cartId;
  int productId;
  String productPic;
  String productName;
  int optionId;
  String optionName;
  String sellerName;
  int totalOptionOriginPrice;
  int totalOptionDiscountedPrice;
  int optionQuantity;

  SelectedCartProductDTO(
      this.cartId,
      this.productId,
      this.productPic,
      this.productName,
      this.optionId,
      this.optionName,
      this.sellerName,
      this.totalOptionOriginPrice,
      this.totalOptionDiscountedPrice,
      this.optionQuantity);

  Map<String, dynamic> toJson() => {
        "cartId": cartId,
        "productId": productId,
        "productPic": productPic,
        "productName": productName,
        "optionId": optionId,
        "optionName": optionName,
        "sellerName": sellerName,
        "totalOptionOriginPrice": totalOptionOriginPrice,
        "totalOptionDiscountedPrice": totalOptionDiscountedPrice,
        "optionQuantity": optionQuantity,
      };


  factory SelectedCartProductDTO.fromCartProductDTO(CartProductDTO cartProductDTO) {
    return SelectedCartProductDTO(
      cartProductDTO.cartId,
      cartProductDTO.productId,
      cartProductDTO.productPic,
      cartProductDTO.productName,
      cartProductDTO.optionId,
      cartProductDTO.optionName,
      cartProductDTO.sellerName,
      cartProductDTO.originPrice * cartProductDTO.optionQuantity,
      cartProductDTO.discountedPrice * cartProductDTO.optionQuantity,
      cartProductDTO.optionQuantity,
    );
  }
}
