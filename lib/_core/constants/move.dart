import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/address/address_screen.dart';
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
import 'package:flutter_blog/ui/screens/home/menu/kurly/hot_product_screen.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/recommend_product_screen.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/sale_product_screen.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_update_detail_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_update_screen.dart';
import 'package:flutter_blog/ui/screens/notice/notice_detail_screen.dart';
import 'package:flutter_blog/ui/screens/notice/notice_home_screen.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_save_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_img_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_list_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_save_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_screen.dart';
import 'package:flutter_blog/ui/screens/review/review_home_screen.dart';
import 'package:flutter_blog/ui/screens/search/search_result_screen.dart';
import 'package:flutter_blog/ui/screens/splash_screen.dart';
import 'package:flutter_blog/ui/screens/user_question/user_question_form_screen.dart';
import 'package:flutter_blog/ui/screens/user_question/user_question_screen.dart';

class Move {
  // splash
  static String splashScreen = "/splash";

  // main
  static String mainScreen = "/main";

  // auth
  static String loginScreen = "/login";
  static String joinScreen = "/join";

  //id & pw
  static String idSearchScreen = "/login/idSearch";
  static String idSearchCompleteScreen = "/login/idSearch/complete";
  static String pwSearchScreen = "/login/pwSearch";
  static String pwNewSetScreen = "/login/pw/insert";
  static String pwSearchCompleteScreen = "/login/pwSearch/complete";

  // my_info
  static String myInfoScreen = "/user/info";
  static String myInfoUpdateScreen = "/user/info/updateScreen";
  static String myInfoUpdateDetailScreen = "/user/info/update/detailScreen";
  static String myInfoAddressScreen = "/user/info/address";
  static String myInfoCouponHomeScreen = "/user/info/coupon/homeScreen";
  static String myInfoReviewHomeScreen = "/user/info/review/homeScreen";

  // cart
  static String cartScreen = "/cart/save";
  static String cartOrderSheetScreen = "/cart/orderSheetScreen";
  static String cartOrderCancelScreen = "/cart/orderCancelScreen";

  // product
  static String productInquirySaveScreen = "/product/inquery/saveScreen";
  static String productReviewImgScreen = "/product/review/detailImgScreen";
  static String productReviewSaveScreen = "/product/review/save/Screen";
  static String productReviewScreen = "/product/review/Screen";
  static String productReviewListScreen = "/product/review/List/Screen";
  static String hotProductScreen = "/product/kurly/hotProductListScreen";
  static String saleProductScreen = "/product/kurly/saleProductListScreen";
  static String recommendProductScreen =
      "/product/kurly/recommendProductListScreen";
  static String productCategoryScreen = "/product/category/detailScreen";
  static String searchResultScreen = "/product/searchResultScreen";


  // customer
  static String customerHomeScreen = "/customerCenter/homeScreen";
  static String customerNoticeHomeScreen = "customer/notice/homeScreen";
  static String customerNoticeDetailScreen = "customer/notice/detailScreen";
  static String customerQuestionScreen = "customer/questionScreen";
  static String customerQuestionFormScreen = "customer/questionFormScreen";

}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // splash
    Move.splashScreen: (context) => const SplashScreen(),

    // main
    Move.mainScreen: (context) => const MainScreen(),

    // auth
    Move.loginScreen: (context) => const LoginScreen(),
    Move.joinScreen: (context) => const JoinScreen(),

    // id & pw
    Move.idSearchScreen: (context) => IdSearchScreen(),
    Move.idSearchCompleteScreen: (context) => IdSearchCompleteScreen(),
    Move.pwSearchScreen: (context) => PwSearchScreen(),
    Move.pwNewSetScreen: (context) => PwNewSetScreen(),
    Move.pwSearchCompleteScreen: (context) => PwSearchCompleteScreen(),

    // my_info
    Move.myInfoScreen: (context) => MyInfoScreen(),
    Move.myInfoUpdateScreen: (context) => MyInfoUpdateScreen(),
    Move.myInfoUpdateDetailScreen: (context) => MyInfoUpdateDetailScreen(),
    Move.myInfoCouponHomeScreen: (context) => MyInfoCouponHomeScreen(),
    Move.myInfoAddressScreen: (context) => MyInfoAddressScreen(),
    Move.myInfoReviewHomeScreen: (context) => MyInfoReviewHomeScreen(),

    // cart
    Move.cartScreen: (context) => CartScreen(),
    Move.cartOrderSheetScreen: (context) => CartOderSheetScreen(),
    Move.cartOrderCancelScreen: (context) => CartOderCancelScreen(),

    // product
    Move.productReviewImgScreen: (context) => ProductReviewImgScreen(),
    Move.productReviewImgScreen: (context) => ProductReviewImgScreen(),
    Move.productReviewSaveScreen: (context) => ProductReviewSaveScreen(),
    // Move.productReviewScreen: (context) => ProductReviewScreen(),
    Move.productReviewListScreen: (context) => ProductReviewListScreen(),
    Move.productCategoryScreen: (context) => ProductCategoryScreen(),
    Move.hotProductScreen: (context) => HotProductScreen(),
    Move.saleProductScreen: (context) => SaleProductScreen(),
    Move.recommendProductScreen: (context) => RecommendProductScreen(),
    Move.searchResultScreen: (context) => SearchResultScreen(),

    // customer
    Move.customerHomeScreen: (context) => CustomerHomeScreen(),
    Move.customerNoticeHomeScreen: (context) => CustomerNoticeHomeScreen(),
    Move.customerNoticeDetailScreen: (context) => CustomerNoticeDetailScreen(),
    Move.customerQuestionFormScreen: (context) => CustomerQuestionFormScreen(),
    Move.customerQuestionScreen: (context) => CustomerQuestionScreen(),
  };
}
