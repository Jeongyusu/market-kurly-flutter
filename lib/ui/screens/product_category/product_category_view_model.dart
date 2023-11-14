import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductCategoryModel {
  ProductListDTO productListDTO;

  ProductCategoryModel(this.productListDTO);
}

class ProductCategoryViewModel extends StateNotifier<ProductCategoryModel?>{
  Ref ref;
  ProductCategoryViewModel(super._state, this.ref);

  Future<void> productCategoryList(int categoryId) async {
    ResponseDTO responseDTO = await ProductCategoryRepository().fetchProductCategoryList(categoryId);
    Logger().d("여까지실행");
    Logger().d("여기까지2 ${responseDTO.response}");
    state = ProductCategoryModel(responseDTO.response);
  }

}

final productCategoryProvider =
StateNotifierProvider.autoDispose<ProductCategoryViewModel, ProductCategoryModel?>((ref) {
  return ProductCategoryViewModel(null, ref);
});