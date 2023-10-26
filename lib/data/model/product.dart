class Product {
  final int? id;
  final String? thumbnail;
  final String? seller;
  final String? productTitle;
  final int? price;
  final int? discountRate;
  final int? totalPrice;

  Product(this.id, this.thumbnail, this.seller, this.productTitle, this.price,
      this.discountRate, this.totalPrice);

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "seller": seller,
        "productTitle": productTitle,
        "price": price,
        "discountRate": discountRate,
        "totalPrice": totalPrice,
      };

// Map 형태로 받아서 Dart 객체로 변환합니다.
  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        thumbnail = json["thumbnail"],
        seller = json["seller"],
        productTitle = json["productTitle"],
        price = json["price"],
        discountRate = json["discountRate"],
        totalPrice = json["totalPrice"];
}
