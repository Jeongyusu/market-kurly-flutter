import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';

class CartSaveDTO {
  List<SelectedOptionDTO> selectedOptionDTOs;

  CartSaveDTO(this.selectedOptionDTOs);

  Map<String, dynamic> toJson() => {
    "selectedOptionDTOs": selectedOptionDTOs.map((selectedOptionDTO) => selectedOptionDTO.toJson()).toList()
  };
}