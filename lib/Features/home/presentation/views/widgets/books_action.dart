import 'package:flutter/material.dart';
import 'package:readify_book_store_app/Core/utils/functions/launch_url.dart';
import 'package:readify_book_store_app/Core/widgets/custom_button.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Color(0xff1A3636),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              },
              backgroundColor: const Color(0xff9CA986),
              textColor: Colors.white,
              fontSize: 20,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              text: getText(bookModel),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Free Preview';
    }
  }
}
