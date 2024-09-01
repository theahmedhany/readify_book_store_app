import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:readify_book_store_app/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kSplashColor,
      body: SplashViewBody(),
    );
  }
}
