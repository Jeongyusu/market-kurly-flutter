import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';

class AddressDetail extends StatelessWidget {
  String? address;
  AddressDetail({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckBoxItem(text: ""),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("기본 배송지", style: TextStyle(fontSize: 12)),
                Text(
                  "${address}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.pencil))
        ],
      ),
    );
  }
}
