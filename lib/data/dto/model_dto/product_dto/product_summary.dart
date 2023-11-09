class ProductSummary {
  final int productId;
  final String productThumnail;
  final String productName;
  final String sellerName;
  final int originPrice;
  final int discountRate;
  final int discountedPrice;
  final double averageStarCount;

  ProductSummary(
    this.productId,
    this.productThumnail,
    this.sellerName,
    this.productName,
    this.originPrice,
    this.discountRate,
    this.discountedPrice,
    this.averageStarCount,
  );

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productThumnail": productThumnail,
      "productName": productName,
      "sellerName": sellerName,
      "originPrice": originPrice,
      "discountRate": discountRate,
      "discountedPrice": discountedPrice,
      "averageStarCount": averageStarCount,
    };
  }

  ProductSummary.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        productThumnail = json["productThumnail"],
        productName = json["productName"],
        sellerName = json["sellerName"],
        originPrice = json["originPrice"],
        discountRate = json["discountRate"],
        discountedPrice = json["discountedPrice"],
        averageStarCount = json["averageStarCount"];
}
