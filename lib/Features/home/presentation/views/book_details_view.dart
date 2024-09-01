import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readify_book_store_app/Features/home/data/models/book_model/book_model.dart';
import 'package:readify_book_store_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: (widget.bookModel.volumeInfo.categories != null &&
              widget.bookModel.volumeInfo.categories!.isNotEmpty)
          ? widget.bookModel.volumeInfo.categories![0]
          : 'Unknown Category',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookModel: widget.bookModel),
      ),
    );
  }
}
