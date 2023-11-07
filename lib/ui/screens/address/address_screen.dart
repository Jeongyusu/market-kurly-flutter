import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/address/address_body.dart';

class MyInfoAddressScreen extends StatelessWidget {
  const MyInfoAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddressBody(),
    );
  }
}
