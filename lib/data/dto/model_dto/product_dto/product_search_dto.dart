class ProductSearchDTO {
  int productId;
  String sellerName;
  String productName;
  int minOptionPrice;
  int discountedminOptionPrice;
  int discountRate;
  double avgStarCount;

  ProductSearchDTO(
      this.productId,
      this.sellerName,
      this.productName,
      this.minOptionPrice,
      this.discountedminOptionPrice,
      this.discountRate,
      this.avgStarCount);

  ProductSearchDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        sellerName = json["sellerName"],
        productName = json["productName"],
        minOptionPrice = json["minOptionPrice"],
        discountedminOptionPrice = json["discountedminOptionPrice"],
        discountRate = json["discountRate"],
        avgStarCount = json["avgStarCount"];
}
