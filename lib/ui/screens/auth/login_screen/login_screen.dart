import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_body/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
