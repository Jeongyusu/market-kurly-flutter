import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:flutter_blog/data/repository/address_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class AddressModel {
  List<Address> addresses;
  AddressModel(this.addresses);
}

// 2. 창고
class AddressViewModel extends StateNotifier<AddressModel?> {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;
  AddressViewModel(super.state, this.ref);

  Ref ref;

  Future<void> notifyInit() async {
    print("category notifyInit 실행");
    // 1. 통신 코드
    ResponseDTO responseDTO = await AddressRepository().fetchAddressList();

    print("CategoryViewModel 통신코드실행 responseDTO : ${responseDTO.response}");
    List<Address> addresses = responseDTO.response;
    print("categorys 파싱 responseDTO : ${addresses}");
    // 2. 비지니스 로직
    state = AddressModel(addresses);
  }
}

// 3. 창고 관리자
final CategoryListProvider =
    StateNotifierProvider<AddressViewModel, AddressModel?>((ref) {
  return AddressViewModel(null, ref)..notifyInit();
});
