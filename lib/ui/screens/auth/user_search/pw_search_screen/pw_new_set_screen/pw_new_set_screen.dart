import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_body/join_body.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/pw_search_screen/pw_new_set_screen/pw_new_set_body.dart';

class PwNewSetScreen extends StatelessWidget {
  const PwNewSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PwNewSetBody(),
    );
  }
}
