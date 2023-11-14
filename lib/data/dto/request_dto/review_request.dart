class ReviewBase {
  final String? reviewBase;

  ReviewBase({this.reviewBase});

  Map<String, dynamic> toJson() {
    return {
      'reviewBase': reviewBase,
    };
  }

  ReviewBase.fromJson(Map<String, dynamic> json)
      : reviewBase = json['reviewBase'];
}

class ProductReviewSaveDTO {
  final int? productId;
  final int? writeableReviewId;
  final String? reviewContent;
  final int? starCount;
  final List<ReviewBase>? reviewPics;

  ProductReviewSaveDTO({
    this.productId,
    this.writeableReviewId,
    required this.reviewContent,
    this.starCount,
    List<ReviewBase>? reviewPics,
  }) : reviewPics = reviewPics ?? [];

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "writeableReviewId": writeableReviewId,
        "reviewContent": reviewContent,
        "starCount": starCount,
        "reviewPics": reviewPics?.map((pic) => pic.toJson()).toList(),
      };

  ProductReviewSaveDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        writeableReviewId = json["writeableReviewId"],
        reviewContent = json["reviewContent"],
        starCount = json["starCount"],
        reviewPics = (json["reviewPics"] as List<dynamic>?)
            ?.map((item) => ReviewBase.fromJson(item))
            .toList();
}
