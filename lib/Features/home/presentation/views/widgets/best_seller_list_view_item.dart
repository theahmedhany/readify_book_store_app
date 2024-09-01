import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readify_book_store_app/Core/utils/app_router.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/custom_book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                  'assets/images/no_book_cover.jpg',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle24,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      bookModel.volumeInfo.authors != null &&
                              bookModel.volumeInfo.authors!.isNotEmpty
                          ? bookModel.volumeInfo.authors![0]
                          : 'Unknown Author',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Text(
                          'Free',
                          style: Styles.textStyle22,
                        ),
                        const Spacer(),
                        BookRating(
                          rating:
                              bookModel.volumeInfo.averageRating?.round() ?? 0,
                          count: bookModel.volumeInfo.ratingCount ?? 0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
