import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_screen.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/id_search_complete_screen/id_search_complete_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/id_search_screen/id_search_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/pw_search_complete_screen/pw_search_complete_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/pw_search_screen/pw_new_set_screen/pw_new_set_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/pw_search_screen/pw_search_screen.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/widget/pw_new_form.dart';
import 'package:flutter_blog/ui/screens/cart/cart_oder_sheet_screen.dart';
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
  static String cartOrderSheetScreen = "/cart/orderSheetScreen";
  static String pwSearchScreen = "/login/pwSearch";
  static String idSearchScreen = "/login/idSearch";
  static String idSearchCompleteScreen = "/login/idSearch/complete";
  static String pwSearchCompleteScreen = "/login/pwSearch/complete";
  static String pwNewSetScreen = "/login/pw/insert";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.splashScreen: (context) => const SplashScreen(),
    Move.loginScreen: (context) => const LoginScreen(),
    Move.joinScreen: (context) => const JoinScreen(),
    Move.mainScreen: (context) => const MainScreen(),
    Move.cartScreen: (context) => CartScreen(),
    Move.pwSearchScreen: (context) => PwSearchScreen(),
    Move.idSearchScreen: (context) => IdSearchScreen(),
    Move.pwSearchCompleteScreen: (context) => PwSearchCompleteScreen(),
    Move.idSearchCompleteScreen: (context) => IdSearchCompleteScreen(),
    Move.pwNewSetScreen: (context) => PwNewSetScreen(),
    Move.cartOrderSheetScreen: (context) => CartOderSheetScreen(),
  };
}
