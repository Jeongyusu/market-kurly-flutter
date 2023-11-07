import 'package:flutter/material.dart';

class CartOrderCoupondropdown extends StatefulWidget {
  const CartOrderCoupondropdown({super.key});

  @override
  State<CartOrderCoupondropdown> createState() =>
      _CartOrderCoupondropdownState();
}

class _CartOrderCoupondropdownState extends State<CartOrderCoupondropdown> {
  final _optionList = [
    "취소/교환/반품",
    "회원/이벤트/쿠폰",
    "상품(식품/비식품/티켓)",
    "배송",
    "주문/결제",
    "서비스/오류/기타"
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
