import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readify_book_store_app/Core/utils/styles.dart';
import 'package:readify_book_store_app/Core/widgets/custom_loading_indecator.dart';
import 'package:readify_book_store_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:readify_book_store_app/Features/search/presentation/manager/books_search_cubit/books_search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksSearchCubit, BooksSearchState>(
      builder: (context, state) {
        if (state is BooksSearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BooksListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is BooksSearchFauilre) {
          return const Center(
            child: Text(
              'There are no matching books, Please search again.',
              textAlign: TextAlign.center,
              style: Styles.textStyle22,
            ),
          );
        } else if (state is BooksSearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              'Start searching for books.',
              textAlign: TextAlign.center,
              style: Styles.textStyle22,
            ),
          );
        }
      },
    );
  }
}
