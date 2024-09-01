import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomBookDetailsAppBar(),
              ),
              BookDetailsSection(bookModel: bookModel),
              const Expanded(child: SizedBox(height: 32)),
              const SimilarBooksSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
