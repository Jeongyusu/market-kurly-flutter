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

TextStyle appBarTitle() {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: basicColorW);
}

// menu-title
TextStyle subTitleSmall() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: basicColorB1);
}

TextStyle subTitleReqular() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: basicColorB1);
}

TextStyle subTitleBold() {
  return TextStyle(
      fontSize: 17, fontWeight: FontWeight.w500, color: basicColorB1);
}

// id&pw search-contents
TextStyle subContentsPoint() {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor);
}

TextStyle subContentsPointSmall() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor);
}

TextStyle subContentsMedium() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: basicColorB3);
}

TextStyle basicTextBig() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, color: basicColorB3);
}

// basic-text
TextStyle basicText() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: basicColorB3);
}

// basic-text
TextStyle basicTextSmall() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: basicColorB3);
}

TextStyle basicTextSmallAndBold() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: basicColorB1);
}

// sub-content
TextStyle subContents() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: basicColorB7);
}

TextStyle subContentsSmaill() {
  return TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: basicColorB7);
}

TextStyle subContentsReqular() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: basicColorB9);
}

TextStyle subContentsBold() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: basicColorB5);
}

TextStyle disabledText() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: disableColor,
    decoration: TextDecoration.lineThrough,
  );
}

TextStyle disabledTextBig() {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: disableColor,
    decoration: TextDecoration.lineThrough,
  );
}

// discount-text
TextStyle discountText() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: accentColor);
}

// discount-text
TextStyle discountTextBig() {
  return TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: accentColor);
}

// price-text
TextStyle strongTextBig() {
  return TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: basicColorB1);
}

// price-text
TextStyle strongTextmMedium() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: basicColorB1);
}

// price-text
TextStyle strongTextSmall() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: basicColorB1);
}

// validation-text
TextStyle validationText() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: validationColor);
}

// | <-- 스타일
TextStyle greyToneText() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: disableColor);
}

// 주문자 정보 내부 텍스트
TextStyle greyToneLargeText() {
  return TextStyle(
      fontSize: 17, fontWeight: FontWeight.w400, color: basicColorB1);
}

// 기본 배송지 버튼모양텍스트 스타일
TextStyle greyToneButtonText() {
  return TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: basicColorB1);
}

// 상품후기 홈 후기쓰기 텍스트 스타일
TextStyle reviewTitle() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor03);
}

TextStyle reviewWrite() {
  return TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: basicColorW);
}

TextStyle reviewDeadLine() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: validationColor);
}

TextStyle reviewOrderNumber() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: basicColorB7);
}

TextStyle couponTitle() {
  return TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: basicColorB1);
}
