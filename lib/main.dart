import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/constants/theme.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO 1: Widget이 아닌 곳에서 현재 화면의 context에 접근해주는 객체
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.myInfoUpdateScreen,
      routes: getRouters(),
      theme: theme(),
    );
  }
}
