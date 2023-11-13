class CartDeleteListDTO {
  List<int> cartDeleteList;

  CartDeleteListDTO(this.cartDeleteList);

  Map<String, dynamic> toJson() => {"cartDeleteList": cartDeleteList};
}
