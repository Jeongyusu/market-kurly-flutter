import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_main_tabbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainTabBar(),
    );
  }
}
