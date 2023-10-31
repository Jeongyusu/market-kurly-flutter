import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomFilterDropdown extends StatefulWidget {
  const CustomFilterDropdown({
    super.key,
    required String selectedValue,
    required List<String> valueList,
  })  : _selectedValue = selectedValue,
        _valueList = valueList;

  final String _selectedValue;
  final List<String> _valueList;

  @override
  State<CustomFilterDropdown> createState() => _CustomFilterDropdownState();
}

class _CustomFilterDropdownState extends State<CustomFilterDropdown> {
  final List<String> _valueList = <String>[
    "신상품순",
    "평점순",
    "판매량순",
    "마감인박순",
    "가격순"
  ];
  String _selectedValue = "신상품순";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Dropdown 버튼 간격 조절
        child: DropdownButton2<String>(
          value: widget._selectedValue,
          style: TextStyle(),
          alignment: Alignment.centerRight,
          items: widget._valueList.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: basicTextSmall(),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedValue = value ?? "";
            });
          },
          underline: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 90,
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
