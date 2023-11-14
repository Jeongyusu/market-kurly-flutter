import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_search_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchModel {
  List<ProductSearchDTO> productSearchDTOS;

  SearchModel(this.productSearchDTOS);
}

class SearchViewModel extends StateNotifier<SearchModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;
  SearchViewModel(super._state, this.ref);

  Future<void> searchProductList (value) async {
    ResponseDTO responseDTO = await ProductRepository().fetchSearchProductList(value);
    if (responseDTO.success == true) {
      Navigator.pushNamed(mContext!, Move.searchResultScreen);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text(responseDTO.error!),
        ),
      );
    }
  }

}

final searchProvider =
StateNotifierProvider.autoDispose<SearchViewModel, SearchModel?>((ref) {
  return SearchViewModel(null, ref);
});