import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_product_dto.dart';

class CartDTO {
  List<CartProductDTO> cartProducts;
  int totalBeforePrice;
  int totalDiscountPrice;
  int deliveryFee;
  int totalPrice;
  int addressId;
  bool isDefaultAddress;
  String destination;
  String destinationDetail;

  CartDTO(
      this.cartProducts,
      this.totalBeforePrice,
      this.totalDiscountPrice,
      this.deliveryFee,
      this.totalPrice,
      this.addressId,
      this.isDefaultAddress,
      this.destination,
      this.destinationDetail);

  Map<String, dynamic> toJson() => {
        "cartProducts":
            cartProducts.map((product) => product.toJson()).toList(),
        "totalBeforePrice": totalBeforePrice,
        "totalDiscountPrice": totalDiscountPrice,
        "deliveryFee": deliveryFee,
        "totalPrice": totalPrice,
        "addressId": addressId,
        "isDefaultAddress": isDefaultAddress,
        "destination": destination,
        "destinationDetail": destinationDetail,
      };

  CartDTO.fromJson(Map<String, dynamic> json)
      : cartProducts = (json["cartProducts"] as List<dynamic>)
            .map((e) => CartProductDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalBeforePrice = json["totalBeforePrice"],
        totalDiscountPrice = json["totalDiscountPrice"],
        deliveryFee = json["deliveryFee"],
        totalPrice = json["totalPrice"],
        addressId = json["addressId"],
        isDefaultAddress = json["isDefaultAddress"],
        destination = json["destination"],
        destinationDetail = json["destinationDetail"];
}
