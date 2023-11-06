import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/widgets/custom_cart_and_quantity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMainAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final Widget title;
  const CustomMainAppbar({
    super.key,
    required this.title,
  });

  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);
    return AppBar(
      automaticallyImplyLeading: false,
      title: title,
      actions: sessionStore.isLogin
          ? [CustomCartAndQuantity()] : [],
    );
  }
}
