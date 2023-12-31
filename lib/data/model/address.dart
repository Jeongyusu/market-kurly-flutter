import 'package:flutter_blog/data/model/user.dart';

class Address {
  final int? id;
  final String? destination;
  final String? destinationDetail;
  final String? receiverName;
  final String? receiverTel;
  final User? user;
  bool isDefaultAddress = false;

  Address(
    this.id,
    this.destination,
    this.destinationDetail,
    this.receiverName,
    this.receiverTel,
    this.user,
    this.isDefaultAddress,
  );

// Map 형태로 받아서 Dart 객체로 변환합니다.
  Address.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        destination = json["destination"],
        destinationDetail = json["destinationDetail"],
        receiverName = json["receiverName"],
        receiverTel = json["receiverTel"],
        // 객체 안의 객체는 fromJson으로 파싱해서 넣어줌
        user = User.fromJson(json["user"]),
        isDefaultAddress = json["isDefaultAddress"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "destination": destination,
        "destinationDetail": destinationDetail,
        "receiverName": receiverName,
        "receiverTel": receiverTel,
        "user": user,
        "isDefaultAddress": isDefaultAddress
      };
}
