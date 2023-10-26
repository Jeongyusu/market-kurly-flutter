import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_dto.dart';
import 'package:flutter_blog/data/model/post.dart';
import 'package:flutter_blog/data/repository/cart_repsository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터
class CartListModel {
  CartDTO cartDTO;
  CartListModel(this.cartDTO);
}

// 2. 창고
class CartListViewModel extends StateNotifier<CartListModel?> {
  CartListViewModel(super._state, this.ref);
  Ref ref;

  Future<void> notifyInit() async {
    // // jwt 가져오기
    // SessionStore sessionStore = ref.read(sessionProvider);
    ResponseDTO responseDTO = await CartDTORepository().fetchCartList();
    Logger().d("여까지실행");
    Logger().d(responseDTO.response);
    state = CartListModel(responseDTO.response);
  }

  void plusQuantity(int index) {
    Logger().d("플러스 클릭됨");
    if (index >= 0 && index < state!.cartDTO.cartProducts.length) {
      state!.cartDTO.cartProducts[index].quentity++;
    }
    state = CartListModel(state!.cartDTO);
  }

  void minusQuantity(int index) {
    Logger().d("마이너스 클릭됨");
    if (index >= 0 && index < state!.cartDTO.cartProducts.length) {
      if (state!.cartDTO.cartProducts[index].quentity > 0) {
        state!.cartDTO.cartProducts[index].quentity--;
      }
    }
    state = CartListModel(state!.cartDTO);
  }

  void calSumOriginPrice() {
    state!.cartDTO.totalBeforePrice = 0;
    Logger().d("상품금액 합계 출력됨");
    if (state != null) {
      int sumOriginPrice = 0;
      state!.cartDTO.cartProducts.forEach((cartProduct) {
        sumOriginPrice += cartProduct.beforeDiscount * cartProduct.quentity;
        state!.cartDTO.totalBeforePrice = sumOriginPrice;
        state = CartListModel(state!.cartDTO);
      });
    }
  }

  void calSumDiscountPrice() {
    Logger().d("할인금액 합계 출력됨");
    state!.cartDTO.totalDiscountPrice = 0;
    if (state != null) {
      int sumDiscountPrice = 0;
      state!.cartDTO.cartProducts.forEach((cartProduct) {
        sumDiscountPrice +=
            (cartProduct.beforeDiscount - cartProduct.discountedPrice) *
                (cartProduct.quentity);
        state!.cartDTO.totalDiscountPrice = sumDiscountPrice;
        state = CartListModel(state!.cartDTO);
      });
    }
  }
  // Future<void> notifyAdd(PostSaveReqDTO dto) async {
  //   SessionStore sessionStore = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO =
  //       await PostRepository().savePost(sessionStore.jwt!, dto);
  //
  //   if (responseDTO.code == 1) {
  //     Post newPost = responseDTO.data as Post; // 1. dynamic(Post) -> 다운캐스팅
  //     List<Post> newPosts = [
  //       newPost,
  //       ...state!.posts
  //     ]; // 2. 기존 상태에 데이터 추가 [전개연산자]
  //     state = PostListModel(
  //         newPosts); // 3. 뷰모델(창고) 데이터 갱신이 완료 -> watch 구독자는 rebuild됨.
  //     Navigator.pop(mContext!); // 4. 글쓰기 화면 pop
  //   } else {
  //     ScaffoldMessenger.of(mContext!).showSnackBar(
  //         SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
  //   }
  // }
}

// 3. 창고 관리자 (View 빌드되기 직전에 생성됨)
final cartDTOListProvider =
    StateNotifierProvider.autoDispose<CartListViewModel, CartListModel?>((ref) {
  return CartListViewModel(null, ref)..notifyInit();
});
