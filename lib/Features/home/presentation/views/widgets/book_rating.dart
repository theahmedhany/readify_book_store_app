import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Color(0xffFFDD4F),
          size: 22,
        ),
        const SizedBox(width: 5),
        Text(
          rating.toString(),
          style: Styles.textStyle20,
        ),
        const SizedBox(width: 8),
        Opacity(
          opacity: 0.7,
          child: Text(
            '(${count.toString()})',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
