import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/request_dto/address_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:flutter_blog/data/repository/address_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// 1. 창고 데이터
class AddressListModel {
  List<Address> addresses;
  AddressListModel(this.addresses);
}

// 2. 창고
class AddressListViewModel extends StateNotifier<AddressListModel?> {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;
  AddressListViewModel(super.state, this.ref);

  Ref ref;

  Future<void> notifyInit() async {
    SessionStore sessionStore = ref.read(sessionProvider);
    print("Address notifyInit 실행");
    // 1. 통신 코드
    ResponseDTO responseDTO = await AddressRepository().fetchAddressList(sessionStore.jwt!);

    print("AddressViewModel 통신코드실행 responseDTO : ${responseDTO.response}");
    List<Address> addresses = responseDTO.response;
    print("Address 파싱 responseDTO : ${addresses}");
    // 2. 비지니스 로직
    state = AddressListModel(addresses);
  }

  Future<void> notifyAdd(AddressSaveReqDTO dto) async {
    SessionStore sessionStore = ref.read(sessionProvider);
    Logger().d("notifyAdd 호출 / AddressSaveReqDTO : ${dto}");
    ResponseDTO responseDTO = await AddressRepository().savePost(sessionStore.jwt!,dto);

    if (responseDTO.success == true) {
      Logger().d("responseDTO.success 성공 : ${responseDTO.success}");
      // responseDTO는 dynamic타입, 실제로는 data가 Address타입 (묵시적 다운캐스팅이 가능)
      // as Address; 뒤에 붙여두면 명시적 다운캐스팅도 가능
      // 묵시적이라도 캐스팅 해야하므로 newAddress에 대입하는 코드가 반드시 분리되어야함
      Address newAddress = responseDTO.response; // 원래 여기에 as Address; 가 있다

      Logger().d("newAddress 캐스팅 : ${newAddress}");
      List<Address> addresses = state!.addresses;

      Logger().d("addresses 캐스팅 : ${addresses}");
      // newAddress가 가장 앞으로
      // ...addresses << posts라는 리스트를 흩뿌린것(전개연산자)
      List<Address> newAddresses = [newAddress, ...addresses];
      // 생성자로 posts에 newPosts를 넣은 PostListModel을 새로 new하고 상태로 준것
      state = AddressListModel(newAddresses);
      // 이 부분에서 뷰모델 데이터 갱신이 완료 << watch 구독자가 rebuild됨
      Navigator.pop(mContext!);
    } else {
      Logger().d("responseDTO.success 실패 : ${responseDTO.success}");
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          content: Text("게시물 작성 실패 : ${responseDTO.error}"),
        ),
      );
    }
  }
}

// 3. 창고 관리자
final addressListProvider =
    StateNotifierProvider<AddressListViewModel, AddressListModel?>((ref) {
  return AddressListViewModel(null, ref)..notifyInit();
});
