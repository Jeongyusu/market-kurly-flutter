import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class UserQuestionDropdown2 extends StatefulWidget {
  const UserQuestionDropdown2({super.key});

  @override
  State<UserQuestionDropdown2> createState() => _UserQuestionDropdown2State();
}

class _UserQuestionDropdown2State extends State<UserQuestionDropdown2> {
  String? _selectedValue;
  List<String> _valueList = [
    "취소/교환/반품",
    "회원/이벤트/쿠폰",
    "상품(식품/비식품/티켓)",
    "배송",
    "주문/결제",
    "서비스/오류/기타"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: formColor),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Dropdown 버튼 간격 조절
        child: DropdownButton2<String>(
          barrierColor: Color.fromRGBO(111, 110, 110, 0.5019607843137255),
          hint: Text("  유형을 입력해주세요."),
          isExpanded: true,
          value: _selectedValue,
          style: TextStyle(),
          alignment: Alignment.centerLeft,
          items: _valueList.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    value,
                    style: basicTextSmall(),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedValue = value ?? "첫 번째";
            });
          },
          underline: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 40,
            width: double.infinity,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 18,
            iconEnabledColor: basicColorB3,
            iconDisabledColor: basicColorB9,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 8, right: 8),
          ),
        ),
      ),
    );
  }
}
