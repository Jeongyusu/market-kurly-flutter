class UserCouponDTO {
  int couponId;
  String couponName;
  String couponContent;
  int reduceAmount;
  bool isExpired;

  UserCouponDTO(this.couponId, this.couponName, this.couponContent,
      this.reduceAmount, this.isExpired);

  UserCouponDTO.fromJson(Map<String, dynamic> json)
      : couponId = json["couponId"],
        couponName = json["couponName"],
        couponContent = json["couponContent"],
        reduceAmount = json["reduceAmount"],
        isExpired = json["isExpired"];
}
