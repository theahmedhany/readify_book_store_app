import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'You can also like',
            style: Styles.textStyle22,
          ),
        ),
        SizedBox(height: 32),
        SimilarBooksListView(),
      ],
    );
  }
}
