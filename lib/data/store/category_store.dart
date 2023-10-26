import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/category.dart';
import 'package:flutter_blog/data/repository/category_repsository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class CategoryModel {
  List<Category> categorys;
  CategoryModel(this.categorys);
}

// 2. 창고
class CategoryViewModel extends StateNotifier<CategoryModel?> {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;
  CategoryViewModel(super.state, this.ref);

  Ref ref;

  Future<void> notifyInit() async {
    print("category notifyInit 실행");
    // 1. 통신 코드
    ResponseDTO responseDTO = await CategoryRepository().fetchCategoryList();

    print("CategoryViewModel 통신코드실행 responseDTO : ${responseDTO.response}");
    List<Category> categorys = responseDTO.response;
    print("categorys 파싱 responseDTO : ${categorys}");
    // 2. 비지니스 로직
    state = CategoryModel(categorys);
  }
}

// 3. 창고 관리자
final CategoryListProvider =
    StateNotifierProvider<CategoryViewModel, CategoryModel?>((ref) {
  return CategoryViewModel(null, ref)..notifyInit();
});
