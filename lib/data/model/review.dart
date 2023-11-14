class ReviewBase {
  final String url;

  ReviewBase(this.url);
}

class ProductReviewDetailDTO {
  final String username;
  final int starCount;
  final String productName;
  final DateTime reviewCreatedAt;
  final List<ReviewBase>? reviewPics;
  final String reviewContent;

  ProductReviewDetailDTO({
    required this.username,
    required this.starCount,
    required this.productName,
    required this.reviewCreatedAt,
    required this.reviewPics,
    required this.reviewContent,
  });
}

List<ReviewBase> reviewPics1 = [
  ReviewBase("assets/images/product/product_review01.png"),
  ReviewBase("assets/images/product/product_review02.png"),
];

List<ReviewBase> reviewPics2 = [
  ReviewBase("assets/images/product/product_review03.png"),
];

List<ProductReviewDetailDTO> reviewData = [
  ProductReviewDetailDTO(
    username: '서태웅',
    starCount: 4,
    productName: '매일 두유 검은콩 (190ml X 12팩)',
    reviewCreatedAt: DateTime.now(),
    reviewPics: [ReviewBase("assets/images/product/product_review01.png")],
    reviewContent: "처음시켜봐요 맛있길",
  ),

  ProductReviewDetailDTO(
    username: '강백호',
    starCount: 5,
    productName: '매일 두유 검은콩 (190ml X 12팩)',
    reviewCreatedAt: DateTime.now().subtract(Duration(days: 2)),
    reviewPics: reviewPics2,
    reviewContent: '건강에 좋은거라 자주 구매합니다! 맛도 괜찮아요! 운동 끝나고 자주 먹어요ㅎㅎ',
  ),
  // Add more entries as needed
];
