import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CartOrderCoupondropdown extends StatefulWidget {
  const CartOrderCoupondropdown({super.key});

  @override
  State<CartOrderCoupondropdown> createState() =>
      _CartOrderCoupondropdownState();
}

class _CartOrderCoupondropdownState extends State<CartOrderCoupondropdown> {
  static const _headerStyle = TextStyle(
    fontSize: 12,
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        MultiSelectDropDown(
          onOptionSelected: (options) {
            debugPrint(options.toString());
          },
          options: const <ValueItem>[
            ValueItem(label: 'Option 1', value: '1'),
            ValueItem(label: 'Option 2', value: '2'),
            ValueItem(label: 'Option 3', value: '3'),
            ValueItem(label: 'Option 4', value: '4'),
            ValueItem(label: 'Option 5', value: '5'),
            ValueItem(label: 'Option 6', value: '6'),
          ],
          selectionType: SelectionType.multi,
          chipConfig: const ChipConfig(wrapType: WrapType.scroll),
          dropdownHeight: 400,
          optionTextStyle: const TextStyle(fontSize: 16),
          selectedOptionIcon: const Icon(Icons.check_circle),
          hint: "사용 가능 쿠폰 0장",
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
