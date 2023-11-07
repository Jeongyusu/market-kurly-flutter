import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';

class ProductListDTO {
  final int totalCount;
  final List<ProductSummary> result;

  ProductListDTO(
    this.totalCount,
    this.result,
  );

  Map<String, dynamic> toJson() {
    return {
      "totalCount": totalCount,
      "result": result,
    };
  }

  ProductListDTO.fromJson(Map<String, dynamic> json)
      : totalCount = json["totalCount"],
        result = (json["result"] as List<dynamic>)
            .map(
              (e) => ProductSummary.fromJson(e as Map<String, dynamic>),
            )
            .toList();
}

//제품 상세
class ProductDetailDTO {
  final int productId;
  final String productName;
  final String productContent;
  final int discountRate;
  final int discountedPrice;
  final int originPrice;
  final String productOrigin;
  final String productDetailImage;
  final String seller;

  ProductDetailDTO(
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

  ProductDetailDTO.fromJson(Map<String, dynamic> json)
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
