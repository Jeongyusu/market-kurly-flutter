import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged; // Change the type here

  CustomRadioButton({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25,
          height: 30,
          child: Transform.scale(
            scale: 1.3,
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged, // Use the updated type
              activeColor: primaryColor02,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: basicText(),
        ),
      ],
    );
  }
}
