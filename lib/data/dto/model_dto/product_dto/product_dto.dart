class ProductDTO {
  final int? id;
  final String? thumbnail;
  final String? seller;
  final String? productTitle;
  final int? price;
  final int? discountRate;
  final int? totalPrice;

  ProductDTO(
    this.id,
    this.thumbnail,
    this.seller,
    this.productTitle,
    this.price,
    this.discountRate,
    this.totalPrice,
  );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "thumbnail": thumbnail,
      "seller": seller,
      "productTitle": productTitle,
      "price": price,
      "discountRate": discountRate,
      "totalPrice": totalPrice,
    };
  }

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  ProductDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        thumbnail = json["thumbnail"],
        seller = json["seller"],
        productTitle = json["productTitle"],
        price = json["price"],
        discountRate = json["discountRate"],
        totalPrice = json["totalPrice"];
}

//제품 상세
class ProductDescriptionDTO {
  final int productId;
  final String productName;
  final String productContent;
  final int discountRate;
  final int discountedPrice;
  final int originPrice;
  final String productOrigin;
  final String productDetailImage;
  final String seller;

  ProductDescriptionDTO(
    this.productId,
    this.productName,
    this.productContent,
    this.discountRate,
    this.discountedPrice,
    this.originPrice,
    this.productOrigin,
    this.productDetailImage,
    this.seller,
  );

  ProductDescriptionDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        productName = json["productName"],
        productContent = json["productContent"],
        discountRate = json["discountRate"],
        discountedPrice = json["discountedPrice"],
        originPrice = json["originPrice"],
        productOrigin = json["productOrigin"],
        productDetailImage = json["productDetailImage"],
        seller = json["seller"];
}
