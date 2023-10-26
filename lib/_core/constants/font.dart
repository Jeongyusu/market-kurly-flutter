import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

// appbar-title
TextStyle navTitle() {
  return TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: basicColorB1);
}

// tabbar-title
TextStyle tabBarTitle() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: basicColorB3);
}

// menu-title
TextStyle subTitle() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: basicColorB1);
}

// basic-text
TextStyle basicText() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: basicColorB3);
}

TextStyle basicText02() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: basicColorB3);
}

// sub-content
TextStyle subContents() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: basicColorB7);
}

// cancle-text
TextStyle disabledText() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: disableColor,
    decoration: TextDecoration.lineThrough,
  );
}

// discount-text
TextStyle discountText() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: accentColor);
}

// price-text
TextStyle StrongText() {
  return TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: basicColorB1);
}

// validation-text
TextStyle validationText() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: validationColor);
}
