import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartOrderCoupondropdown extends ConsumerStatefulWidget {
  const CartOrderCoupondropdown({super.key});

  @override
  ConsumerState createState() => _CartOrderCoupondropdownState();
}

class _CartOrderCoupondropdownState extends ConsumerState {
  final _optionList = [
    "회원가입 10% 쿠폰",
    "상품 1000원 할인 쿠폰",
    "상품 2000원 할인 쿠폰",
  ];
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedOption = _optionList[0];
    });
  }

  void onChanged(String? newValue) {
    setState(() {
      _selectedOption = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    CouponModel? couponModel = ref.read(couponProvider);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 300,
          child: DropdownButton<String>(
            isExpanded: true,
            items: _optionList.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: onChanged,
            value: _selectedOption,
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
