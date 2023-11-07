import 'package:dio/dio.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_summary.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/product.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 창고데이터 (서버쪽에 DTO )
class ProductListModel {
  ProductListDTO? productList;
  ProductListModel(this.productList);
}

// 창고
class ProductListViewModel extends StateNotifier<ProductListModel?> {
  final mContext = navigatorKey.currentContext;

  ProductListViewModel(super._state, this.ref);
  Ref ref;

  Future<void> fetchNewProducts() async {
    ResponseDTO responseDTO = await ProductRepository().fetchNewProductList();
    Logger().d(responseDTO);
    final productListModel = ProductListModel(responseDTO.response);
    state = productListModel;
  }

  Future<void> fetchBestProducts() async {
    ResponseDTO responseDTO = await ProductRepository().fetchBestProductList();
    Logger().d(responseDTO);
    final productListModel = ProductListModel(responseDTO.response);
    state = productListModel;
  }
}

// // 창고 관리자
// final productListProvider =
//     StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
//   return ProductListViewModel(null, ref)..notifyInit();
// });

// 창고 관리자
final productNewListProvider =
    StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..fetchNewProducts();
});

// 창고 관리자
final productBestListProvider =
    StateNotifierProvider<ProductListViewModel, ProductListModel?>((ref) {
  return ProductListViewModel(null, ref)..fetchBestProducts();
});
