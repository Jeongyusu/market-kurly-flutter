import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/model_dto/coupon_dto/user_coupon_dto.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartOrderCouponDropdown extends ConsumerStatefulWidget {
  const CartOrderCouponDropdown({super.key});

  @override
  ConsumerState<CartOrderCouponDropdown> createState() => _CartOrderCouponDropdownState();
}

class _CartOrderCouponDropdownState extends ConsumerState<CartOrderCouponDropdown> {
  List<String> _optionList = [];
  int? _selectedOption;



  void onChanged(int? newValue) {
    setState(() {
      _selectedOption = newValue!;
      Logger().d("선택된 쿠폰의 쿠폰번호는 ${_selectedOption}입니다.");
      Param param = ref.read(paramProvider);
      param.couponId = newValue;
      UserCouponDTO selectedCoupon = ref
          .read(couponProvider)!
          .userCouponDTOList!
          .firstWhere((coupon) => coupon.couponId == _selectedOption);
      param.couponAmount = selectedCoupon.reduceAmount;
    });
  }

  String extractNumber(String couponName) {
    RegExp regex = RegExp(r'\d+');
    Match match = regex.firstMatch(couponName)!;
    return match.group(0) ?? "";
  }


  @override
  Widget build(BuildContext context) {
    CouponModel? couponModel = ref.watch(couponProvider);
    if(couponModel == null) {
      return Center(child: Image.asset('assets/images/giphy.gif', fit: BoxFit.cover, width: 200, height: 200),);
    }
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 300,
          child: DropdownButton<int>(
            isExpanded: true,
            items: couponModel!.userCouponDTOList!.map((UserCouponDTO userCouponDTO) {
              return DropdownMenuItem<int>(
                value: userCouponDTO!.couponId,
                child: Text(userCouponDTO.couponName),
              );
            }).toList(),
            onChanged: onChanged,
            value: _selectedOption ?? 1,
            hint: Text("유형을 선택하세요"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
