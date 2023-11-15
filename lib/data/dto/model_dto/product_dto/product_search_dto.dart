class ProductSearchDTO {
  int productId;
  String sellerName;
  String productName;
  String productThumbnail;
  int minOptionPrice;
  int discountedminOptionPrice;
  int discountRate;
  int categoryId;
  double avgStarCount;

  ProductSearchDTO(
      this.productId,
      this.sellerName,
      this.productName,
      this.productThumbnail,
      this.minOptionPrice,
      this.discountedminOptionPrice,
      this.discountRate,
      this.categoryId,
      this.avgStarCount);

  ProductSearchDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        sellerName = json["sellerName"],
        productName = json["productName"],
        productThumbnail = json["productThumbnail"],
        minOptionPrice = json["minOptionPrice"],
        discountedminOptionPrice = json["discountedminOptionPrice"],
        discountRate = json["discountRate"],
        categoryId = json["categoryId"],
        avgStarCount = json["avgStarCount"];
}
