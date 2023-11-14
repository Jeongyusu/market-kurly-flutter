import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/request_dto/payment_request.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/payment_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';

class PayHomePage extends ConsumerWidget {
  final int price;
  final String name;
  final int months;
  const PayHomePage(
      {Key? key, required this.price, this.name = "귤귤", required this.months});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser session = ref.read(sessionProvider);

    return IamportPayment(
      appBar: new AppBar(
        title: new Text('결제하기'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp57785721',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: 'kakaopay', // PG사
        payMethod: 'card', // 결제수단
        name: name, // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: price, // 결제금액
        buyerName: "${session.user!.username}", // 구매자 이름
        buyerTel: '01012345678', // 구매자 연락처
        buyerEmail: "${session.user!.userEmail}", // 구매자 이메일
        appScheme: 'example', // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        if (result['imp_success'] == 'true') {
          PaymentRequestDTO requestDTO =
              PaymentRequestDTO(session.user!.id, name);

          ResponseDTO responseDTO =
              await paymentRepository().fetchPayment(requestDTO);
          if (responseDTO.success == true) {
            return AlertDialog(content: Text("결제 완료"));
          } else {
            return AlertDialog(content: Text("결제는 완료, 서버 통신 실패"));
          }
          //서버에 실패했다는 alert창 띄우기
        } else {
          //결제에 실패했다는 alert 창 띄우기
          Navigator.pushReplacementNamed(
            context,
            Move.myInfoScreen,
            arguments: result,
          );
        }
      },
    );
  }
}
