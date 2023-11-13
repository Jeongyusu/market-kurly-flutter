import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/model/address.dart';
import 'package:flutter_blog/ui/screens/address/address_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderShipmentAddress extends ConsumerWidget {
  const CartOrderShipmentAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddressListModel? addressListModel = ref.read(addressListProvider);
    CartListModel? cartListModel = ref.read(cartListProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: disableColor,
                  ),
                  width: 80,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(
                    "기본 배송지",
                    style: greyToneButtonText(),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: 280,
                  child: Text(
                    "${cartListModel!.cartDTO.destination} ${cartListModel!.cartDTO.destinationDetail}",
                    style: greyToneLargeText(),
                  )),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: basicColorB7, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  child: Text(
                    "변경",
                    style: basicText(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
