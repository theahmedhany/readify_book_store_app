import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:readify_book_store_app/Core/utils/app_router.dart';
import 'package:readify_book_store_app/Core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: 24,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            'Readify',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'NewAmsterdam',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
