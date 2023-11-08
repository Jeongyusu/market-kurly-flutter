import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoProfile extends ConsumerWidget {
  const MyInfoProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo_dark.png',
            width: 50,
            height: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${sessionStore.user!.username}님",
            style: strongTextmMedium(),
          ),
        ],
      ),
    );
  }
}
