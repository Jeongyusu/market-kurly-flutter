class ProductReviewSaveDTO {
  final int? productId;
  final int? writeableReviewId;
  final String? reviewContent;
  final int? starCount;
  final List<Map<String, String>>? reviewPics;

  ProductReviewSaveDTO({
    this.productId,
    this.writeableReviewId,
    required this.reviewContent,
    this.starCount,
    List<String>? reviewPics, // Nullable로 변경
  }) : reviewPics =
            reviewPics?.map((pic) => {"reviewBase": pic}).toList() ?? [];

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "writeableReviewId": writeableReviewId,
        "reviewContent": reviewContent,
        "starCount": starCount?.toStringAsFixed(1), // null 체크 추가
        "reviewPics": reviewPics,
      };
}
