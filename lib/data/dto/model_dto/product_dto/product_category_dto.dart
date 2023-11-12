class ProductCategoryDTO {
  final int? id;
  final String? categoryType;

  ProductCategoryDTO(
    this.id,
    this.categoryType,
  );

  ProductCategoryDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryType = json["categoryType"];
}
