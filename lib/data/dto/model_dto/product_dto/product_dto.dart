//제품 상세
import 'dart:ffi';

class ProductDescriptionDTO {
  final int productId;
  final String productName;
  final String productContent;
  final String productThumbnail;
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
      this.productThumbnail,
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
        productThumbnail = json["productThumbnail"],
        discountRate = json["discountRate"],
        discountedPrice = json["discountedPrice"],
        originPrice = json["originPrice"],
        productOrigin = json["productOrigin"],
        productDetailImage = json["productDetailImage"],
        seller = json["seller"];
}

//핫한 상품
class ProductStarMainDTO {
  final int productId;
  final String sellerName;
  final String productName;
  final String productThumbnail;
  final int minOptionPrice;
  final int discountedminOptionPrice;
  final int categoryId;
  final int discountRate;
  final double avgStarCount;

  ProductStarMainDTO(
      this.productId,
      this.sellerName,
      this.productName,
      this.productThumbnail,
      this.minOptionPrice,
      this.discountedminOptionPrice,
      this.categoryId,
      this.discountRate,
      this.avgStarCount,
      );

  ProductStarMainDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        sellerName = json["sellerName"],
        productName = json["productName"],
        productThumbnail = json["productThumbnail"],
        minOptionPrice = json["minOptionPrice"],
        categoryId = json["categoryId"],
        discountedminOptionPrice = json["discountedminOptionPrice"],
        discountRate = json["discountRate"],
        avgStarCount = json["avgStarCount"];
}

//반값 세일
class ProductDiscountMainDTO {
  final int productId;
  final String sellerName;
  final String productName;
  final String productThumbnail;
  final int minOptionPrice;
  final int categoryId;
  final int discountedminOptionPrice;
  final int discountRate;
  final double avgStarCount;

  ProductDiscountMainDTO(
      this.productId,
      this.sellerName,
      this.productName,
      this.productThumbnail,
      this.minOptionPrice,
      this.categoryId,
      this.discountedminOptionPrice,
      this.discountRate,
      this.avgStarCount,
      );

  ProductDiscountMainDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        sellerName = json["sellerName"],
        productName = json["productName"],
        productThumbnail = json["productThumbnail"],
        categoryId = json["categoryId"],
        minOptionPrice = json["minOptionPrice"],
        discountedminOptionPrice = json["discountedminOptionPrice"],
        discountRate = json["discountRate"],
        avgStarCount = json["avgStarCount"];
}

// MD추천
class ProductRandomMainDTO {
  final int productId;
  final String sellerName;
  final String productName;
  final String productThumbnail;
  final int minOptionPrice;
  final int categoryId;
  final int discountedminOptionPrice;
  final int discountRate;
  final double avgStarCount;

  ProductRandomMainDTO(
      this.productId,
      this.sellerName,
      this.productName,
      this.productThumbnail,
      this.minOptionPrice,
      this.categoryId,
      this.discountedminOptionPrice,
      this.discountRate,
      this.avgStarCount,
      );

  ProductRandomMainDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        sellerName = json["sellerName"],
        productName = json["productName"],
        productThumbnail = json["productThumbnail"],
        categoryId = json["categoryId"],
        minOptionPrice = json["minOptionPrice"],
        discountedminOptionPrice = json["discountedminOptionPrice"],
        discountRate = json["discountRate"],
        avgStarCount = json["avgStarCount"];
}
