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
import 'package:flutter_blog/ui/screens/cart/cart_order_cancel_screen.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_home_screen.dart';
import 'package:flutter_blog/ui/screens/customer_center/customer_center_home_screen.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_update_screen.dart';
import 'package:flutter_blog/ui/screens/review/review_home_screen.dart';
import 'package:flutter_blog/ui/screens/splash_screen.dart';

class Move {
  static String splashScreen = "/splash";
  static String loginScreen = "/login";
  static String joinScreen = "/join";
  static String myInfoScreen = "/user/info";
  static String myInfoUpdateScreen = "/user/info/updateScreen";
  static String mainScreen = "/main/productList";
  static String cartScreen = "/cart/save";
  static String cartOrderSheetScreen = "/cart/orderSheetScreen";
  static String cartOrderCancelScreen = "/cart/orderCancelScreen";
  static String pwSearchScreen = "/login/pwSearch";
  static String idSearchScreen = "/login/idSearch";
  static String idSearchCompleteScreen = "/login/idSearch/complete";
  static String pwSearchCompleteScreen = "/login/pwSearch/complete";
  static String pwNewSetScreen = "/login/pw/insert";
  static String reviewHomeScreen = "/review/homeScreen";
  static String couponHomeScreen = "/coupon/homeScreen";
  static String customerCenterHomeScreen = "/customerCenter/homeScreen";
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
    Move.cartOrderCancelScreen: (context) => CartOderCancelScreen(),
    Move.myInfoScreen: (context) => MyInfoScreen(),
    Move.myInfoUpdateScreen: (context) => MyInfoUpdateScreen(),
    Move.reviewHomeScreen: (context) => ReviewHomeScreen(),
    Move.couponHomeScreen: (context) => CouponHomeScreen(),
    Move.customerCenterHomeScreen: (context) => CustomerCenterHomeScreen(),
  };
}
