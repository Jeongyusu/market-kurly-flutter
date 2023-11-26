import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CouponHomeScreenBody extends ConsumerWidget {
  const CouponHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CouponModel? couponModel = ref.watch(couponProvider);
    if(couponModel?.userCouponDTOList == null) {
      return Center(child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),);
    }
    return ListView.builder(
      itemCount: couponModel!.userCouponDTOList!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: basicColorB7),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${couponModel!.userCouponDTOList![index].couponName}",
                  style: couponTitle(),
                ),
                Text("${couponModel!.userCouponDTOList![index].couponContent}"),
                Text("${couponModel!.userCouponDTOList![index].isExpired ? "사용불가" : "사용가능"}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
