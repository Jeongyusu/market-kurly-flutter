class Category {
  final int? id;
  final String? categoryType;
  final String? categoryPic;

  Category(
    this.id,
    this.categoryType,
    this.categoryPic,
  );

// Map 형태로 받아서 Dart 객체로 변환합니다.
  Category.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryType = json["categoryType"],
        categoryPic = json["categoryPic"];
}
