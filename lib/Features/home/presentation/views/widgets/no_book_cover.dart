import 'package:flutter/material.dart';

class NoBookCover extends StatelessWidget {
  const NoBookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Image.asset(
        'assets/images/no_book_cover.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
