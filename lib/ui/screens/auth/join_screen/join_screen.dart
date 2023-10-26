import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_body/join_body.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JoinBody(),
    );
  }
}
