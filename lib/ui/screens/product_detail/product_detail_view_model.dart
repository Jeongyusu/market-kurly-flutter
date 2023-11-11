import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';
import 'package:flutter_blog/data/model/option.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductDetailModal {
  List<Option> selectedOptionDTOs;

  ProductDetailModal(this.selectedOptionDTOs);
}

class ProductDetailViewModel extends StateNotifier<ProductDetailModal?> {
  Ref ref;
  ProductDetailViewModel(super._state, this.ref);

  void notifyInit(int productId){
    ProductDescriptionModel? model = ref.read(productDescriptionProvider(productId));
    List<Option> selectedOptionDTOs = model!.productDescriptionDTO.options;
    state = ProductDetailModal(selectedOptionDTOs);
  }

  void plusQuantity(int index) {
    Logger().d("플러스 클릭됨");
      state!.selectedOptionDTOs[index].optionQuantity++;
    state = ProductDetailModal(state!.selectedOptionDTOs);
    Logger().d("플러스 클릭됨${state!.selectedOptionDTOs[index].optionQuantity}" );

  }

  void minusQuantity(int index) {
    Logger().d("마이너스 클릭됨");
      if (state!.selectedOptionDTOs[index].optionQuantity > 0) {
        state!.selectedOptionDTOs[index].optionQuantity--;
      }
    state = ProductDetailModal(state!.selectedOptionDTOs);
    Logger().d("마이너스 클릭됨${state!.selectedOptionDTOs[index].optionQuantity}" );

  }
}


final productCartProvider =
StateNotifierProvider.family.autoDispose<ProductDetailViewModel, ProductDetailModal?, int>((ref, productId) {
return ProductDetailViewModel(null, ref)..notifyInit(productId); });
