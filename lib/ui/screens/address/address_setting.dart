import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';

class AddressSetPage extends StatelessWidget {
  const AddressSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "주소 등록",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
