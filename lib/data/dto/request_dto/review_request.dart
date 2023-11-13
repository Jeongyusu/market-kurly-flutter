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
    List<String>? reviewPics,
  }) : reviewPics =
            reviewPics?.map((pic) => {"reviewBase": pic}).toList() ?? [];

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "writeableReviewId": writeableReviewId,
        "reviewContent": reviewContent,
        "starCount": starCount?.toStringAsFixed(1),
        "reviewPics": reviewPics,
      };

  ProductReviewSaveDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        writeableReviewId = json["writeableReviewId"],
        reviewContent = json["reviewContent"],
        starCount = json["starCount"],
        reviewPics = json["reviewPics"];
}
