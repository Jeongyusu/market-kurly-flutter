import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_screen.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_screen.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/splash_screen.dart';

class Move {
  static String splashScreen = "/splash";
  static String loginScreen = "/login";
  static String joinScreen = "/join";
  static String userInfoScreen = "/user/info";
  static String mainScreen = "/main/productList";
  static String cartScreen = "/cart/save";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.splashScreen: (context) => const SplashScreen(),
    Move.loginScreen: (context) => const LoginScreen(),
    Move.joinScreen: (context) => const JoinScreen(),
    Move.mainScreen: (context) => const MainScreen(),
    Move.cartScreen: (context) => CartScreen(),
  };
}
