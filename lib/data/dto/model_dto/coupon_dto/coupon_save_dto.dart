class CouponRegisterDTO {
  final String couponNumber;

  CouponRegisterDTO(this.couponNumber);

  Map<String, dynamic> toJson() => {"couponNumber": couponNumber};
}
