class SelectedOptionDTO {
  int optionId;
  int optionQuantity = 0;

  SelectedOptionDTO(this.optionId, this.optionQuantity);


  Map<String, dynamic> toJson() => {
    "optionId": optionId,
    "optionQuantity": optionQuantity,
  };
}