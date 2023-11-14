class ProductQuestionSaveDTO {
  int productId;
  String productQuestionTitle;
  String productQuestionContent;
  bool isSecreted;

  ProductQuestionSaveDTO(this.productId, this.productQuestionTitle,
      this.productQuestionContent, this.isSecreted);


  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productQuestionTitle": productQuestionTitle,
    "productQuestionContent": productQuestionContent,
    "isSecreted": isSecreted
  };

  ProductQuestionSaveDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        productQuestionTitle = json["productQuestionTitle"],
        productQuestionContent = json["productQuestionContent"],
        isSecreted = json["isSecreted"];
}