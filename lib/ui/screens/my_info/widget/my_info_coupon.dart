import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/repository/coupon_repository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoCoupon extends ConsumerWidget {
  const MyInfoCoupon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);
    // ResponseDTO responseDTO = CouponRepository().fetchCouponList(sessionStore.jwt!);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 25),
          alignment: Alignment.topLeft,
          child: Text(
            "2만원 이상 무료배송",
            style: basicText(),
          ),
        )
      ],
    );
  }
}
