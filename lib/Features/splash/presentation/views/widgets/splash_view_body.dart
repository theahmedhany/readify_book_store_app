import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readify_book_store_app/Core/utils/app_router.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/splash/presentation/views/widgets/sliding_splash_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textSlidingAnimation;
  late Animation<Offset> logoSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initTextSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(slidingAnimation: logoSlidingAnimation),
        const Text(
          textAlign: TextAlign.center,
          'Readify',
          style: Styles.textStyle60,
        ),
        const SizedBox(height: 5),
        SlidingText(slidingAnimation: textSlidingAnimation),
      ],
    );
  }

  void initTextSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    logoSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
