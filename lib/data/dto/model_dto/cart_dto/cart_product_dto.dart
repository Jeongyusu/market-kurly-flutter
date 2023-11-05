class CartProductDTO {
  int cartId;
  int productId;
  String productPic;
  String productName;
  int optionId;
  String optionName;
  String sellerName;
  int originPrice;
  int discountRate;
  int discountedPrice;
  int optionQuantity;


  CartProductDTO(
      this.cartId,
      this.productId,
      this.productPic,
      this.productName,
      this.optionId,
      this.optionName,
      this.sellerName,
      this.originPrice,
      this.discountRate,
      this.discountedPrice,
      this.optionQuantity);

  CartProductDTO.fromJson(Map<String, dynamic> json)
      : cartId = json["cartId"],
        productId = json["productId"],
        productPic = json["productPic"],
        productName = json["productName"],
        optionId = json["optionId"],
        optionName = json["optionName"],
        sellerName = json["sellerName"],
        originPrice = json["originPrice"],
        discountRate = json["discountRate"],
        discountedPrice = json["discountedPrice"],
        optionQuantity = json["optionQuantity"];

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "productId": productId,
    "productPic": productPic,
    "productName": productName,
    "optionId": optionId,
    "optionName": optionName,
    "sellerName": cartId,
    "originPrice": originPrice,
    "discountRate": discountRate,
    "discountedPrice": discountedPrice,
    "optionQuantity": optionQuantity,
  };
}

