import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.19),
            child: CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                  'assets/images/no_book_cover.jpg',
            ),
          ),
          const SizedBox(height: 32),
          Text(
            bookModel.volumeInfo.title!,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Opacity(
            opacity: 0.7,
            child: Text(
              textAlign: TextAlign.center,
              bookModel.volumeInfo.authors != null &&
                      bookModel.volumeInfo.authors!.isNotEmpty
                  ? bookModel.volumeInfo.authors![0]
                  : 'Unknown Author',
              style: Styles.textStyle20.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 12),
          BookRating(
            rating: bookModel.volumeInfo.averageRating ?? 0,
            count: bookModel.volumeInfo.ratingCount ?? 0,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 32),
          BooksAction(bookModel: bookModel),
        ],
      ),
    );
  }
}
