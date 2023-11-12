import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';

class CartSaveDTO {
  List<SelectedOptionDTO> cartSaveDTO;

  CartSaveDTO(this.cartSaveDTO);

  Map<String, dynamic> toJson() => {
    "cartSaveDTO": cartSaveDTO.map((selectedOptionDTO) => selectedOptionDTO.toJson()).toList()
  };
}