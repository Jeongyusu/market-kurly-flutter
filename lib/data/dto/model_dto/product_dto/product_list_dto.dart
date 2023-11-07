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
