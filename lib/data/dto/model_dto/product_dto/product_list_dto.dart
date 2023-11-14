import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';

class ProductDetailDTO {
  final String username;
  final int starCount;
  final String productName;
  final DateTime reviewCreatedAt;
  final List<dynamic>? reviewPics;
  final String reviewContent;

  ProductDetailDTO(
    this.username,
    this.starCount,
    this.productName,
    this.reviewCreatedAt,
    this.reviewPics,
    this.reviewContent,
  );

  ProductDetailDTO.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        starCount = json["starCount"],
        productName = json["productName"],
        reviewCreatedAt = json["reviewCreatedAt"],
        reviewPics = json["reviewPics"],
        reviewContent = json["reviewContent"];
}

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

class ProductMainListsDTO {
  List<ProductStarMainDTO> productStarMainDTOs;
  List<ProductDiscountMainDTO> productDiscountMainDTOs;
  List<ProductRandomMainDTO> productRandomMainDTOs;

  ProductMainListsDTO(
    this.productStarMainDTOs,
    this.productDiscountMainDTOs,
    this.productRandomMainDTOs,
  );

  Map<String, dynamic> toJson() => {
        "productStarMainDTOs": productStarMainDTOs,
        "productDiscountMainDTOs": productDiscountMainDTOs,
        "productRandomMainDTOs": productRandomMainDTOs,
      };

  ProductMainListsDTO.fromJson(Map<String, dynamic> json)
      : productStarMainDTOs = (json["productStarMainDTOs"] as List<dynamic>)
            .map((e) => ProductStarMainDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        productDiscountMainDTOs =
            (json["productDiscountMainDTOs"] as List<dynamic>)
                .map((e) =>
                    ProductDiscountMainDTO.fromJson(e as Map<String, dynamic>))
                .toList(),
        productRandomMainDTOs = (json["productRandomMainDTOs"] as List<dynamic>)
            .map(
                (e) => ProductRandomMainDTO.fromJson(e as Map<String, dynamic>))
            .toList();
}
