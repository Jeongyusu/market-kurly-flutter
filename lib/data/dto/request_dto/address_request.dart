class AddressSaveReqDTO {
  final String destination;
  final String? destinationDetail;
  final String receiverName;
  final String receiverTel;
  final bool isDefaultAddress;

  AddressSaveReqDTO({
    required this.destination,
    this.destinationDetail,
    required this.receiverName,
    required this.receiverTel,
    required this.isDefaultAddress,
  });

  Map<String, dynamic> toJson() => {
        "destination": destination,
        "destinationDetail": destinationDetail,
        "receiverName": receiverName,
        "receiverTel": receiverTel,
        "isDefaultAddress": isDefaultAddress
      };
}
